import Foundation
import SwiftUI
import QuizEngine_iOS



final class GameViewControllerFactory: ViewControllerFactory {
    private let options: [String: [String]]
    
    init(options: [String : [String]]) {
        self.options = options
    }
    
    func makePlayerTurnViewController(player: Player<String, String>, questionNumber: Int, completion: @escaping () -> Void) -> UIViewController {
        let playerTurnViewModel = PlayerTurnViewModel(questionNumber: questionNumber, playerName: player.name)
        let view = PlayerTurnUIView(viewModel: playerTurnViewModel, selection: completion)
        let viewController = UIHostingController(rootView: view)
        
        return viewController
    }
    
    func makeQuestionViewController(question: String, player: Player<String, String>, answerCallback: @escaping (String, TimeInterval) -> Void) -> UIViewController {
        let viewModel = SingleAnswerQuestionViewModel(question: question, score: player.score)
        let options = options[question] ?? []
        let view = SingleAnswerQuestionView(viewModel: viewModel, store: .init(options: options), selection: answerCallback)
        let viewController = UIHostingController(rootView: view)
        
        return viewController
    }
    
    func makeQuestionResultViewController(result: QuestionResult<String, String>, completion: @escaping () -> Void) -> UIViewController {
        let viewModel = QuestionResultViewModel(playerName: result.playerName, time: result.time.formattedTime, answer: result.answer, correctAnswer: result.rightAnswer)
        let view = QuestionResultView(viewModel: viewModel, selection: completion)
        let viewController = UIHostingController(rootView: view)
        
        return viewController
    }
    
    func makeRoundResultViewController(players: [Player<String, String>], question: String, correctAnswer: String, completion: @escaping () -> Void) -> UIViewController {
        let viewModel = RoundResultViewModel(players: players, question: question, correctAnswer: correctAnswer)
        let view = RoundResultView(viewModel: viewModel, action: completion)
        let viewController = UIHostingController(rootView: view)
        return viewController
    }
    
    func makeGameResultViewController(result: GameResult<String, String>) -> UIViewController {
        let viewModel = GameResultViewModel<String, String>(players: result.players, correctAnswers: result.correctAnswers)
        let view = GameResultView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        return viewController
    }
}
