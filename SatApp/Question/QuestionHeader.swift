import SwiftUI

struct QuestionHeader: View {
    let title: String
    let question: String
    @Binding var elapsedTime: TimeInterval
    

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
                .padding(.top)
                .multilineTextAlignment(.leading)

            
            HStack(spacing: 0) {
                Text(SingleAnswerQuestionViewModel.timerTitle)
                    .font(.headline)
                
                Text(elapsedTime.formattedTime)
                    .font(.headline)
                    .bold()
                
            }
        
            Text(question)
                .font(.largeTitle)
                .fontWeight(.medium)
            
        }.padding()
        
    }
}

#Preview {
    QuestionHeader(title: "You've got 3 right answers", question: "A question", elapsedTime: .constant(0))
}
