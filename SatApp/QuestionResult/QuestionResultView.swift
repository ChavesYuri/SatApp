import SwiftUI

struct QuestionResultView: View {
    let viewModel: QuestionResultViewModel
    let selection: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(QuestionResultViewModel.timeTookTitlePrefix)
                .foregroundColor(.gray)
                .font(.headline) +
            
            Text(viewModel.timeTook)
                .font(.headline)
                .fontWeight(.bold) +
            
            Text(QuestionResultViewModel.timeTookTitleSuffix)
                .foregroundColor(.gray)
                .font(.headline)
            
            Text(viewModel.answerText)
                .foregroundColor(viewModel.isCorrect ? .green : .red)
                .font(.title3)
                .fontWeight(.bold)
            
            Spacer()
            
            RoundButton(title: QuestionResultViewModel.nextButtonTitle, action: selection)
        }.padding()
    }
}

#Preview {
    QuestionResultView(viewModel: .init(playerName: "A name", time: "25 seconds", answer: "A1", correctAnswer: "A1"), selection: {})
}
