import SwiftUI

struct SingleAnswerQuestionView: View {
    let title: String
    let question: String
    @State var store: SingleSelectionOptionStore
    let selection: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            QuestionHeader(title: title, question: question)
            
            ForEach(store.options.indices, id: \.self) { i in
                SingleTextSelectionCell(option: $store.options[i], selection: {
                    store.select(at: i)
                })
            }.background(.clear)
            
            Spacer()
            
            RoundButton(title: "Select", action: {}).disabled(!store.canSubmit())
        }
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
                    title: "You've got 2 rights answers!",
                    question: "A question",
                    store: .init(options: [
                        "First Option",
                        "Second Option",
                        "Third Option",
                        "Forth Option"]),
                    selection: { selection = $0 }
                )
                
                Text("Last selection: " + selection)
            }
        }
    }
}
