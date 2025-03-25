import Foundation

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
