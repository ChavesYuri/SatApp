import SwiftUI

struct PlayerTurnUIView: View {
    
    let viewModel: PlayerTurnViewModel
    let selection: () -> Void
    
    var body: some View {
        VStack {
            ScrollView {
                PlayerTurnTitleView(
                    name: viewModel.name,
                    questionNumber: viewModel.number,
                    warningTitle: viewModel.warningTitle)
            }.padding(.vertical, 1)
            
            RoundButton(title: "Go to question", action: selection)
        }
    }
}

#Preview {
    PlayerTurnUIView(viewModel: .init(questionNumber: 1, playerName: "A name"), selection: {})
}

#Preview {
    PlayerTurnUIView(viewModel: .init(questionNumber: 1, playerName: "A name"), selection: {}).preferredColorScheme(.dark)
}
