import Foundation
import XCTest
@testable import SatApp

final class SingSingleSelectionOptionStoreTests: XCTestCase {
    func test_init_cannotSubmit() {
        let sut = SingleSelectionOptionStore(options: ["Op1"])
        
        XCTAssertFalse(sut.canSubmit())
    }
    
    func test_selectFirstOption_canSubmit() {
        var sut = SingleSelectionOptionStore(options: ["Op1", "Op2"])
        
        sut.select(at: 0)
        
        XCTAssertTrue(sut.canSubmit())
        XCTAssertTrue(sut.options[0].isSelected)
        XCTAssertFalse(sut.options[1].isSelected)
    }
    
    func test_selectFirstOptionTwice_firstOptionIsSelected() {
        var sut = SingleSelectionOptionStore(options: ["Op1", "Op2"])
        
        sut.select(at: 0)
        sut.select(at: 0)
        
        XCTAssertTrue(sut.options[0].isSelected)
    }
    
    func test_selectFirstOptionAndThenSelectSecondOption_secondOptionIsSelected() {
        var sut = SingleSelectionOptionStore(options: ["Op1", "Op2"])
        
        sut.select(at: 0)
        sut.select(at: 1)
        
        XCTAssertFalse(sut.options[0].isSelected)
        XCTAssertTrue(sut.options[1].isSelected)
    }
}
