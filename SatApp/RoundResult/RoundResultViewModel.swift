import Foundation

final class RoundResultViewModel {
    private let players: [PlayerRoundAnswer]
    private let question: String
    private let correctAnswer: String
    
    init(players: [PlayerRoundAnswer], question: String, correctAnswer: String) {
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
        players
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
