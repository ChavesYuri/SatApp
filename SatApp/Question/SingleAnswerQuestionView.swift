import SwiftUI

struct SingleAnswerQuestionView: View {
    let viewModel: SingleAnswerQuestionViewModel
    @State var store: SingleSelectionOptionStore
    let selection: (String, TimeInterval) -> Void
    

    @State private var timer: Timer?
    @State var elapsedTime: TimeInterval = 0
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0.0) {
                QuestionHeader(title: viewModel.title, question: viewModel.questionTitle, elapsedTime: $elapsedTime)
                
                List(store.options.indices, id: \.self) { i in
                    SingleTextSelectionCell(option: $store.options[i], selection: {
                        store.select(at: i)
                    })
                }.listStyle(PlainListStyle())
            }.onAppear(perform: startTimer)
            
            RoundButton(title: SingleAnswerQuestionViewModel.buttonTitle, action: stopTimerAndSubmit).disabled(!store.canSubmit())
        }
        
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            elapsedTime += 0.1
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func stopTimerAndSubmit() {
        stopTimer()
        guard let selectedOption = store.selectedOptionText() else { return }
        selection(selectedOption, elapsedTime)
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
