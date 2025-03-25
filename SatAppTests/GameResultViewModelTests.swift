import Foundation
import XCTest
import QuizEngine_iOS
@testable import SatApp

final class GameResultViewModelTests: XCTestCase {
    func test_init_withNoWinner_configuresInitialValues() {
        let player01 = Player<String, String>(
            name: "First player",
            score: 1,
            answers: [
                "Q1": ("A1", 1.0),
                "Q2": ("A1", 1.5)
            ])
        let player02 = Player<String, String>(
            name: "Second player",
            score: 1,
            answers: [
                "Q1": ("A1", 1.2),
                "Q2": ("A2", 1.7)
            ])
        let correctAnswers = ["Q1": "A1", "Q2": "A2"]
        
        let sut = GameResultViewModel(players: [player01, player02], correctAnswers: correctAnswers)
        
        XCTAssertEqual(sut.scoreTitle, "Scores:")
        XCTAssertEqual(sut.playerScores, ["Player: \(player01.name) • Score: \(player01.score)", "Player: \(player02.name) • Score: \(player02.score)"])
        XCTAssertEqual(sut.items.count, 2)
        XCTAssertEqual(sut.noWinnerTitle, "There was no winner since no one scored 3 points")
        XCTAssertNil(sut.winnerName)
    }
    
    func test_init_withWinner_configuresInitialValues() {
        let player01 = Player<String, String>(
            name: "First player",
            score: 3,
            answers: [
                "Q1": ("A1", 1.0),
                "Q2": ("A2", 1.5),
                "Q3": ("A3", 1.5)
            ])
        let player02 = Player<String, String>(
            name: "Second player",
            score: 1,
            answers: [
                "Q1": ("A1", 1.2),
                "Q2": ("A2", 1.7),
                "Q3": ("A2", 1.2)
            ])
        let correctAnswers = ["Q1": "A1", "Q2": "A2", "Q3": "A3"]
        let sut = GameResultViewModel<String, String>(players: [player01, player02], correctAnswers: correctAnswers)
        
        XCTAssertNotNil(sut.winnerName)
    }
}
