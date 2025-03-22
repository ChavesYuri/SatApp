import Foundation
import XCTest
@testable import SatApp

final class SingleAnswerQuestionViewModelTest: XCTestCase {
    func test_init_playerHasScoredOne_titleDoesNotHaveSuffix() {
        let sut = SingleAnswerQuestionViewModel(question: "A question", score: 1)
        
        XCTAssertEqual(sut.title, "You've won 1 round")
    }
    
    func test_init_playerHasScoredZero_titleHasSuffix() {
        let sut = SingleAnswerQuestionViewModel(question: "A question", score: 0)
        
        XCTAssertEqual(sut.title, "You've won 0 rounds")
    }
    
    func test_init_playerHasScoredMoreThanOne_titleHasSuffix() {
        let sut = SingleAnswerQuestionViewModel(question: "A question", score: 3)
        
        XCTAssertEqual(sut.title, "You've won 3 rounds")
    }
}
