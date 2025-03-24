import Foundation
import XCTest
@testable import SatApp

final class GameResultViewModelTests: XCTestCase {
    func test_init_withNoWinner_configuresInitialValues() {
        let playerOne = PlayerResult(id: UUID(), name: "First player", answers: ["Q1": .init(answer: "A1", time: 1.0), "Q2": .init(answer: "A1", time: 1.5)], score: 1)
        let playerTwo = PlayerResult(id: UUID(), name: "Second player", answers: ["Q1": .init(answer: "A1", time: 1.2), "Q2": .init(answer: "A2", time: 1.7)], score: 1)
        let players = [playerOne, playerTwo]
        let sut = GameResultViewModel<String, String>(players: players, correctAnswers: ["Q1": "A1", "Q2": "A2"])
        
        XCTAssertEqual(sut.scoreTitle, "Scores:")
        XCTAssertEqual(sut.playerScores, ["Player: \(playerOne.name) • Score: \(playerOne.score)", "Player: \(playerTwo.name) • Score: \(playerTwo.score)"])
        XCTAssertEqual(sut.items.count, 2)
        XCTAssertEqual(sut.noWinnerTitle, "There was no winner since no one scored 3 points")
        XCTAssertNil(sut.winnerName)
    }
    
    func test_init_withWinner_configuresInitialValues() {
        let playerOne = PlayerResult(id: UUID(), name: "First player", answers: ["Q1": .init(answer: "A1", time: 1.0), "Q2": .init(answer: "A2", time: 1.5), "Q3": .init(answer: "A3", time: 1.5)], score: 3)
        let playerTwo = PlayerResult(id: UUID(), name: "Second player", answers: ["Q1": .init(answer: "A1", time: 1.2), "Q2": .init(answer: "A2", time: 1.7), "Q3": .init(answer: "A2", time: 1.2)], score: 1)
        let players = [playerOne, playerTwo]
        let sut = GameResultViewModel<String, String>(players: players, correctAnswers: ["Q1": "A1", "Q2": "A2", "Q3": "A3"])
        
        XCTAssertNotNil(sut.winnerName)
    }
}
