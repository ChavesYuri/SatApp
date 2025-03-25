import Foundation
import Combine

final class SingleAnswerQuestionViewModel: ObservableObject {
    private let question: String
    private let score: Int
    
    @Published var elapsedTime: TimeInterval = 0
    private var cancellable: AnyCancellable?
    
    init(question: String, score: Int) {
        self.question = question
        self.score = score
    }
    
    var title: String {
        let suffix = "s"
        let roundsWon = "You've won \(score) round"
        
        return score == 1 ? roundsWon : [roundsWon, suffix].joined()
    }
    
    var questionTitle: String { question }
    
    func startTimer() {
        cancellable = Timer.publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateOnMainThread()
            }
    }
    
    func stopTimer() {
        cancellable?.cancel()
        cancellable = nil
    }
    
    private func updateOnMainThread() {
        DispatchQueue.main.async {
            self.elapsedTime += 0.1
        }
    }
}

extension SingleAnswerQuestionViewModel {
    static let buttonTitle = "Select"
    static let timerTitle = "Timer: "
}
