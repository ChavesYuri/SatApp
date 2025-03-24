import Foundation

struct PlayerResult<Question: Hashable, Answer: Equatable>: Hashable {
    let id: AnyHashable
    let name: String
    let answers: [Question: PlayerAnswer]
    let score: Int
    
    struct PlayerAnswer: Equatable {
        let answer: Answer
        let time: TimeInterval
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
