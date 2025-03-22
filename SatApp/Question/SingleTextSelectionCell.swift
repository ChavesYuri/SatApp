import SwiftUI

struct SingleTextSelectionCell: View {
    @Binding var option: SingleSelectionOption
    let selection: () -> Void

    var body: some View {
        Button(action: selection) {
            HStack {
                Circle()
                    .strokeBorder(option.isSelected ? .blue : Color(UIColor.lightGray), lineWidth: 2.0)
                    .overlay(
                        Circle()
                            .fill(option.isSelected ? .blue : Color.clear)
                            .frame(width: 12.0, height: 12.0)
                    )
                    .frame(width: 25.0, height: 25.0)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 3))

                Text(option.text)
                    .font(.headline)
                    .foregroundColor(option.isSelected ? Color(UIColor.label) : Color(UIColor.lightGray))
            }
        }.padding()
    }
}

#Preview {
    SingleTextSelectionCell(option: .constant(.init(text: "A text")), selection: {})
}
