import SwiftUI

struct PlayerResultCell: View {
    let player: PlayerRoundAnswer
    let isAnswerCorrect: (String) -> Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(RoundResultViewModel.playerTitle)
                    .foregroundColor(Color(UIColor.secondaryLabel)) +
                Text("\(player.name)")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(RoundResultViewModel.timeTakenTitle)
                    .foregroundColor(Color(UIColor.secondaryLabel)) +
                Text(player.time.formattedTime)
                
                Text(RoundResultViewModel.answerTitle)
                    .foregroundColor(Color(UIColor.secondaryLabel)) +
                Text("\(player.answer)")
            }
            
            Spacer()
            let isCorrect = isAnswerCorrect(player.answer)
            Image(systemName: isCorrect ? "checkmark" : "xmark").resizable().frame(width: 12, height: 12)
                .foregroundColor(isCorrect ? .green : .red)
        }
    }
}

#Preview {
    PlayerResultCell(player: .init(name: "A name", answer: "A1", time: 19), isAnswerCorrect: { _ in false })
}
