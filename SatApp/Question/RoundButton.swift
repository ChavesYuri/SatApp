import SwiftUI

struct RoundButton: View {
    let title: String
    let foregroundColor: Color = .white
    let backgroundColor: Color = .blue
    let cornerRadius: CGFloat = 25
    let action: () -> Void

    var body: some View {
        HStack {
            Spacer().frame(width: 5)

            Button {
                action()
            } label: {
                HStack {
                    Spacer()
                    VStack(spacing: -10) {
                        Text(title)
                            .font(Font.custom("MyriadPro-Semibold", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(foregroundColor)
                            .padding()
                    }
                    
                    Spacer()
                }
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
            }
            .buttonStyle(PlainButtonStyle())

            Spacer().frame(width: 5)
        }.padding(.bottom)
    }
}

#Preview {
    RoundButton(title: "A Title", action: { })
}
