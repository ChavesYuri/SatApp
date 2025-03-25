import Foundation
import QuizEngine_iOS

final class GameResultViewModel<Question: Hashable, Answer: Equatable> {
    private let winnerThreshold: Int = 3
    let players: [Player<Question, Answer>]
    let correctAnswers: [Question: Answer]
    
    init(players: [Player<Question, Answer>], correctAnswers: [Question: Answer]) {
        self.players = players
        self.correctAnswers = correctAnswers
    }
    
    var scoreTitle: String { "Scores:" }
    
    var playerScores: [String] {
        players.map {
            "Player: \($0.name) • Score: \($0.score)"
        }
    }
    
    var items: [GameResultItem<Question, Answer>] {
        correctAnswers.map { (question, correctAnswer) in
            var playersPerQuestion: [GameResultItem<Question, Answer>.PlayerAnswer] = []
            for player in players {
                if let playerAnswer = player.answers[question] {
                    let isCorrect = playerAnswer.answer == correctAnswer
                    let time = playerAnswer.time
                    let answer = playerAnswer.answer
                    playersPerQuestion.append(GameResultItem.PlayerAnswer(name: player.name, answer: answer, time: time, isCorrect: isCorrect))
                }
            }
            
            return GameResultItem(question: question, correctAnswer: correctAnswer, players: playersPerQuestion)
        }.filter { !$0.players.isEmpty }
    }
    
    var noWinnerTitle: String { "There was no winner since no one scored \(winnerThreshold) points" }
    
    var winnerName: String? {
        guard let gameWinner = players.first(where: { $0.score == winnerThreshold }) else {
            return nil
        }
        
        return "\(gameWinner.name)"
    }
}

extension GameResultViewModel where Answer == String, Question == String {
    static let resultCellTitle = "Name: "
    static let answerCellTitle = "Answer: "
    static let timeTakenCellTitle = "Time taken: "
    static let gameResultTitle = "The game is finished!"
    static let winnerTitleSuffix = " is the winner 🏆"
}
