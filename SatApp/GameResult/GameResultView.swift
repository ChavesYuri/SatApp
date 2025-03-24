import SwiftUI

struct GameResultItem<Question: Hashable, Answer: Equatable> {
    let question: Question
    let correctAnswer: Answer
    let players: [PlayerAnswer]
    
    struct PlayerAnswer {
        let name: String
        let answer: Answer
        let time: TimeInterval
        let isCorrect: Bool
    }
}

struct GameResultView: View {
    let viewModel: GameResultViewModel<String, String>
    
    var body: some View {
        VStack(alignment: .leading) {
            GameResultHeatherView(
                winnerName: viewModel.winnerName,
                noWinnerTitle: viewModel.noWinnerTitle)
            
            Text(viewModel.scoreTitle)
                .padding(.horizontal)
                .fontWeight(.bold)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewModel.playerScores, id: \.self) {
                        Text($0)
                            .padding()
                            .font(.system(size: 14))
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8)
                     }
                     .listStyle(.plain)
                }.padding(.horizontal)
            }.frame(height: 50)
            
            List(viewModel.items.indices, id: \.self) { position in
                Section(header: Text(viewModel.items[position].question)
                    .font(Font.system(.title3))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)) {
                        ForEach(viewModel.items[position].players.indices, id: \.self) { i in
                            let player = viewModel.items[position].players[i]
                            PlayerQuestionResultCell(
                                name: player.name,
                                answer: player.answer,
                                time: "\(player.time)",
                                isCorrect: player.isCorrect)
                        }
                    }
            }.listStyle(.plain)
        }
    }
}

#Preview {
    GameResultView(viewModel: .init(
        players: [
            .init(id: UUID(), name: "First player", answers: ["Q1": .init(answer: "A1", time: 1.2), "Q2": .init(answer: "A1", time: 1.3)], score: 2)
        ],
        correctAnswers: ["Q1": "A1", "Q2": "A2"]))
}
