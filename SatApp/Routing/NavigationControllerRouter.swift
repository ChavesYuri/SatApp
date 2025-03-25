import UIKit
import QuizEngine_iOS

final class NavigationControllerRouter: Router {
    typealias Question = String
    typealias Answer = String
    
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    init (navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func routeToPlayerTurn(player: Player<String, String>, questionNumber: Int, _ onStart: @escaping () -> Void) {
        let viewController = factory.makePlayerTurnViewController(player: player, questionNumber: questionNumber, completion: onStart)
        setViewController(viewController)
    }
    
    func routeToQuestionScreen(_ question: String, player: Player<String, String>, _ answer: @escaping AnswerCallback) {
        let viewController = factory.makeQuestionViewController(question: question, player: player, answerCallback: answer)
        setViewController(viewController)
    }
    
    func routeToQuestionResult(questionResult: QuestionResult<String, String>, completion: @escaping () -> Void) {
        let viewController = factory.makeQuestionResultViewController(result: questionResult, completion: completion)
        setViewController(viewController)
    }
    
    func routeToRoundResult(players: [Player<String, String>], question: String, correctAnswer: String, completion: @escaping () -> Void) {
        let viewController = factory.makeRoundResultViewController(players: players, question: question, correctAnswer: correctAnswer, completion: completion)
        setViewController(viewController)
    }
    
    func routeToGameResult(_ result: GameResult<String, String>) {
        let viewController = factory.makeGameResultViewController(result: result)
        setViewController(viewController)
    }
    
    private func setViewController(_ viewController: UIViewController) {
        navigationController.setViewControllers([viewController], animated: true)
    }
}
