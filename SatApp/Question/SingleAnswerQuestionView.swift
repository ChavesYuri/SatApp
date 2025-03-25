import SwiftUI

struct SingleAnswerQuestionView: View {
    @StateObject var viewModel: SingleAnswerQuestionViewModel
    @State var store: SingleSelectionOptionStore
    let selection: (String, TimeInterval) -> Void
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0.0) {
                QuestionHeader(title: viewModel.title, question: viewModel.questionTitle, elapsedTime: $viewModel.elapsedTime)
                
                List(store.options.indices, id: \.self) { i in
                    SingleTextSelectionCell(option: $store.options[i], selection: {
                        store.select(at: i)
                    })
                }.listStyle(PlainListStyle())
            }
            
            RoundButton(title: SingleAnswerQuestionViewModel.buttonTitle, action: stopTimerAndSubmit).disabled(!store.canSubmit())
        }.onAppear(perform: viewModel.startTimer)
        
    }
    
    private func stopTimerAndSubmit() {
        viewModel.stopTimer()
        guard let selectedOption = store.selectedOptionText() else { return }
        selection(selectedOption, viewModel.elapsedTime)
    }
}

struct SingleAnswerQuestion_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            SingleAnswerQuestionTestView()
            
            SingleAnswerQuestionTestView().preferredColorScheme(.dark)
        }
        
    }
    
    struct SingleAnswerQuestionTestView: View {
        @State var selection: String = "none"
        
        var body: some View {
            VStack {
                SingleAnswerQuestionView(
                    viewModel: .init(question: "A question", score: 1),
                    store: .init(options: [
                        "First Option",
                        "Second Option",
                        "Third Option",
                        "Forth Option"]),
                    selection: {  (option, time) in selection = [option, "\(time)"].joined(separator: " ") }
                )
                
                Text("Last selection: " + selection)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
    }
}
