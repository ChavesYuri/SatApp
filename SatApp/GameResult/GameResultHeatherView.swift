import SwiftUI

struct GameResultHeatherView: View {
    let winnerName: String?
    let noWinnerTitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(GameResultViewModel.gameResultTitle)
                .font(.title)
                .fontWeight(.bold)
            
            if let winnerName = winnerName {
                Text(winnerName)
                    .font(.title3)
                    .fontWeight(.medium) +
                
                Text(GameResultViewModel.winnerTitleSuffix)
            } else {
                Text(noWinnerTitle)
                    .font(.title3)
                    .fontWeight(.medium)
            }
            
            
        }.padding()
    }
}

#Preview {
    GameResultHeatherView(winnerName: "A name", noWinnerTitle: "There's no winner at this time")
}
