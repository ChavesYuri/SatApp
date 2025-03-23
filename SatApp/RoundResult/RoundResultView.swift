import SwiftUI

struct Player: Hashable {
    let name: String
    let answer: String
    let time: TimeInterval
}

struct RoundResultView: View {
    let viewModel: RoundResultViewModel
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundResultHeader(winner: viewModel.winner)
            
            List(viewModel.allPlayers, id: \.self) { player in
                PlayerResultCell(player: player, isAnswerCorrect: viewModel.isAnswerCorrect)
            }.listStyle(PlainListStyle())
            
            RoundButton(title: "Next", action: action)
        }
    }
}

#Preview {
    RoundResultView(
        viewModel: .init(
            players: [
                .init(name: "A first name", answer: "A2", time: 1.9),
                .init(name: "A second name", answer: "A2", time: 1.2),
                .init(name: "A third name", answer: "A1", time: 1.3),
                .init(name: "A forth name", answer: "A2", time: 1.1)
            ],
            correctAnswer: "A1"),
        action: {}
    )
}

#Preview {
    RoundResultView(
        viewModel: .init(
            players: [
                .init(name: "A first name", answer: "A2", time: 1.9),
                .init(name: "A second name", answer: "A2", time: 1.2),
                .init(name: "A third name", answer: "A1", time: 1.3),
                .init(name: "A forth name", answer: "A2", time: 1.1)
            ],
            correctAnswer: "A1"),
        action: {}
    ).preferredColorScheme(.dark)
}
