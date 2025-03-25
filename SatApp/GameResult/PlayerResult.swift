import Foundation

struct PlayerResult<Question: Hashable, Answer: Equatable>: Hashable {
    let id: AnyHashable
    let name: String
    let answers: [Question: (answer: Answer, time: TimeInterval)]
    let score: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension PlayerResult {
    static func == (lhs: PlayerResult<Question, Answer>, rhs: PlayerResult<Question, Answer>) -> Bool {
        lhs.id == rhs.id
    }
}
