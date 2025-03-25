import SwiftUI

struct PlayerRoundAnswer: Hashable {
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
                .init(name: "a name"),
                .init(name: "a second name")
            ],
            question: "Q1",
            correctAnswer: "A1"),
        action: {}
    )
}

#Preview {
    RoundResultView(
        viewModel: .init(
            players: [
                .init(name: "A name"),
                .init(name: "a second name")
            ],
            question: "Q1",
            correctAnswer: "A1"),
        action: {}
    ).preferredColorScheme(.dark)
}
