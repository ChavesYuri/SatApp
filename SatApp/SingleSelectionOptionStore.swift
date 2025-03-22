import Foundation

struct SingleSelectionOptionStore {
    var options: [SingleSelectionOption]
    
    init(options: [String]) {
        self.options = options.map { SingleSelectionOption.init(text: $0) }
    }
    
    mutating func select(at index: Int) {
        guard !options[index].isSelected else { return }
        
        guard let selectedIndex = options.firstIndex(where: { $0.isSelected }) else {
            options[index].select()
            return
        }
        
        options[selectedIndex].unselect()
        options[index].select()
    }
    
    func canSubmit() -> Bool {
        options.first(where: { $0.isSelected }) != nil
    }
    
    func selectedOptionText() -> String? {
        options.first(where: { $0.isSelected })?.text
    }
}
