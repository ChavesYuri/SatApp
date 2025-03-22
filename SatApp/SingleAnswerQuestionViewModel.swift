import Foundation

final class SingleAnswerQuestionViewModel {
    private let question: String
    private let score: Int
    
    init(question: String, score: Int) {
        self.question = question
        self.score = score
    }
    
    var title: String {
        let suffix = "s"
        let roundsWon = "You've won \(score) round"
        
        return score == 1 ? roundsWon : [roundsWon, suffix].joined()
    }
    
    var questionTitle: String { question }
}

extension SingleAnswerQuestionViewModel {
    static let buttonTitle = "Select"
    static let timerTitle = "Timer: "
}
