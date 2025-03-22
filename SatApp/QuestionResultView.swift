import SwiftUI

final class QuestionResultViewModel {
    private let playerName: String
    private let time: String
    private let answer: String
    private let correctAnswer: String
    
    init(playerName: String, time: String, answer: String, correctAnswer: String) {
        self.playerName = playerName
        self.time = time
        self.answer = answer
        self.correctAnswer = correctAnswer
    }
    
    var name: String { "\(playerName)," }
    
    var timeTook: String { time }
    
    var answerText: String {
        isCorrect ?
        "Great job!\nYour answer \(answer) is correct" :
        "Unfortunately, the answer \(answer) is wrong.\nThe right answer is \(correctAnswer)"
    }
    
    var isCorrect: Bool {
        answer == correctAnswer
    }
}

extension QuestionResultViewModel {
    static let timeTookTitlePrefix = "You took "
    static let timeTookTitleSuffix = " to answer the question"
    static let nextButtonTitle = "Continue"
}

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
