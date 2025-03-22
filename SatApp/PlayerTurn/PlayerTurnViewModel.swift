import Foundation

final class PlayerTurnViewModel {
    private let questionNumber: Int
    private let playerName: String
    
    var warningTitle: String {
        [PlayerTurnViewModel.warningTitlePrefix, "\(questionNumber)", PlayerTurnViewModel.warningTitleSuffix].joined()
    }
    
    var name: String { playerName }
    var number: String { "\(questionNumber)" }
    
    init (questionNumber: Int, playerName: String) {
        self.questionNumber = questionNumber
        self.playerName = playerName
    }
}

extension PlayerTurnViewModel {
    static let playerTurnTitlePrefix: String = "Now it's the player "
    static let playerTurnTitleTurnSuffix: String = "'s "
    static let playerTurnTitleAnswerQuestionNumberPrefix: String = "turn to answer the question number #"
    
    private static let warningTitlePrefix: String = "Once you click the button below, you will be redirected to the question number #"
    private static let warningTitleSuffix: String = " and you cannot go back"
}
