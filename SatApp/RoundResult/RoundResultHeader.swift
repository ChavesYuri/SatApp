import SwiftUI

struct RoundResultHeader: View {
    let winner: PlayerRoundAnswer?
    
    var body: some View {
        VStack {
            if let winner = winner {
                HStack {
                    Text(RoundResultViewModel.roundWinnerTitle)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .font(.headline) +
                    
                    Text(winner.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }.padding()
                
            } else {
                Group {
                    Text(RoundResultViewModel.tieResultPrefixTitle)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .font(.headline) +
                    
                    Text(RoundResultViewModel.tiesResultSuffix)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }.padding()
            }
        }
    }
}

#Preview {
    RoundResultHeader(winner: nil)
}
