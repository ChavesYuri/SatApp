import Foundation

public struct QuestionResult<Question: Hashable, Answer: Equatable> {
    public let playerName: String
    public let answer: Answer
    public let rightAnswer: Answer
    public let question: Question
    public let time: TimeInterval
    public var isCorrect: Bool { answer == rightAnswer }
    
    public init(playerName: String, answer: Answer, rightAnswer: Answer, question: Question, time: TimeInterval) {
        self.playerName = playerName
        self.answer = answer
        self.rightAnswer = rightAnswer
        self.question = question
        self.time = time
    }
}

public struct GameResult<Question: Hashable, Answer> {
    public let players: [Player<Question, Answer>]
    public let correctAnswers: [Question: Answer]

    public init(players: [Player<Question, Answer>], correctAnswers: [Question : Answer]) {
        self.players = players
        self.correctAnswers = correctAnswers
    }
}
