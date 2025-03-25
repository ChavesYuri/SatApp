import Foundation

public protocol Router {
    associatedtype Question: Hashable
    associatedtype Answer: Equatable
    
    typealias AnswerCallback = (Answer, TimeInterval) -> Void
    func routeToPlayerTurn(player: Player<Question, Answer>, questionNumber: Int, _ onStart: @escaping () -> Void)
    func routeToQuestionScreen(_ question: Question, player: Player<Question, Answer>, _ answer: @escaping AnswerCallback)
    func routeToQuestionResult(questionResult: QuestionResult<Question, Answer>, completion: @escaping () -> Void)
    func routeToRoundResult(players: [Player<Question, Answer>], question: Question, correctAnswer: Answer, completion: @escaping () -> Void)
    func routeToGameResult(_ result: GameResult<Question, Answer>)
}
