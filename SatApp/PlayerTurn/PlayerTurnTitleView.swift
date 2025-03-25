import SwiftUI

struct PlayerTurnTitleView: View {
    let name: String
    let questionNumber: String
    let warningTitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(PlayerTurnViewModel.playerTurnTitlePrefix)
                .font(.title) +
            Text(name)
                .font(.title).fontWeight(.bold).foregroundColor(.blue) +
            Text(PlayerTurnViewModel.playerTurnTitleTurnSuffix)
                .font(.title).fontWeight(.bold).foregroundColor(.blue) +
            Text(PlayerTurnViewModel.playerTurnTitleAnswerQuestionNumberPrefix)
                .font(.title) +
            Text(questionNumber)
                .font(.title).fontWeight(.bold).foregroundColor(.red)
            
            Text(warningTitle)
                .font(.caption)
                .padding(.vertical)
                .foregroundColor(.gray)
            
        }.padding()
    }
}

#Preview {
    PlayerTurnTitleView(name: "A name", questionNumber: "1", warningTitle: "A warning message")
}
