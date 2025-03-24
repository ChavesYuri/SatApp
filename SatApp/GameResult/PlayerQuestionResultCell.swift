import SwiftUI

struct PlayerQuestionResultCell: View {
    let name: String
    let answer: String
    let time: String
    let isCorrect: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(GameResultViewModel.resultCellTitle)
                    .foregroundColor(Color(UIColor.secondaryLabel)) +
                Text(name)
                
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(GameResultViewModel.answerCellTitle)
                    .foregroundColor(Color(UIColor.secondaryLabel)) +
                Text(answer)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(GameResultViewModel.timeTakenCellTitle)
                    .foregroundColor(Color(UIColor.secondaryLabel)) +
                Text(time)
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            Spacer()
            
            Image(systemName: isCorrect ? "checkmark" : "xmark").resizable().frame(width: 12, height: 12)
                .foregroundColor(isCorrect ? .green : .red)
        }
    }
}

#Preview {
    PlayerQuestionResultCell(name: "A name", answer: "An answer", time: "A time", isCorrect: false)
}
