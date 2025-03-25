import UIKit
import QuizEngine_iOS

protocol ViewControllerFactory {
    func makePlayerTurnViewController(player: Player<String, String>, questionNumber: Int, completion: @escaping () -> Void) -> UIViewController
    func makeQuestionViewController(question: String, player: Player<String, String>, answerCallback: @escaping (String, TimeInterval) -> Void) -> UIViewController
    func makeQuestionResultViewController(result: QuestionResult<String, String>, completion: @escaping () -> Void) -> UIViewController
    func makeRoundResultViewController(players: [Player<String, String>], question: String, correctAnswer: String, completion: @escaping () -> Void) -> UIViewController
    func makeGameResultViewController(result: GameResult<String, String>) -> UIViewController
}
