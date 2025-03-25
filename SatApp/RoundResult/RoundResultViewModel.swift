import Foundation
import QuizEngine_iOS

final class RoundResultViewModel {
    private let players: [Player<String, String>]
    private let question: String
    private let correctAnswer: String
    
    init(players: [Player<String, String>], question: String, correctAnswer: String) {
        self.players = players
        self.question = question
        self.correctAnswer = correctAnswer
    }
    
    var winner: PlayerRoundAnswer? {
        let rightAnswerPlayers: [PlayerRoundAnswer] = allPlayers.filter { $0.answer == correctAnswer }.sorted { $0.time < $1.time }
        
        guard !rightAnswerPlayers.isEmpty else { return nil }
        
        return rightAnswerPlayers.first
    }
    
    var allPlayers: [PlayerRoundAnswer] {
        players.compactMap { player in
            guard let (answer, time) = player.answers[question] else { return nil }
            return PlayerRoundAnswer(name: player.name, answer: answer, time: time)
        }
    }
    
    func isAnswerCorrect(_ answer: String) -> Bool {
        answer == correctAnswer
    }
}

extension RoundResultViewModel {
    static let roundWinnerTitle = "Round's winner: "
    static let tieResultPrefixTitle = "This round is a "
    static let tiesResultSuffix = "Tie"
    static let playerTitle = "Player: "
    static let timeTakenTitle = "Time taken: "
    static let answerTitle = "Answer: "
}
