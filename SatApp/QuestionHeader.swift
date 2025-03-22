import SwiftUI

struct QuestionHeader: View {
    let title: String
    let question: String
    @Binding var elapsedTime: TimeInterval
    

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(Color.blue)
                .padding(.top)
            
            HStack(spacing: -18) {
                Text(SingleAnswerQuestionViewModel.timerTitle)
                    .font(.headline)
                
                Text(elapsedTime.formattedTime)
                    .font(.headline)
                    .bold()
                    .padding()
            }
        
            Text(question)
                .font(.largeTitle)
                .fontWeight(.medium)
        }
        .padding()
    }
}

#Preview {
    QuestionHeader(title: "You've got 3 right answers", question: "A question", elapsedTime: .constant(0))
}
