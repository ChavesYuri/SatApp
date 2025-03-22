import Foundation

struct SingleSelectionOption {
    let text: String
    var isSelected: Bool

    init(text: String, isSelected: Bool = false) {
        self.text = text
        self.isSelected = isSelected
    }

    mutating func select() {
        isSelected = true
    }

    mutating func unselect() {
        isSelected = false
    }
}
