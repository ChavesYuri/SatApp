//
//  SceneDelegate.swift
//  SatApp

import UIKit
import QuizEngine_iOS

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private lazy var navigationController = UINavigationController()
    
    var game: Game<String, String, NavigationControllerRouter>?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        startTriviaGame()
        configureWindow()
    }
    
    private func startTriviaGame() {
        let q1 = "A right triangle has legs of length 6 and 8. What is the length of the hypotenuse?"
        let q2 = "A bag contains 5 red balls, 3 blue balls, and 2 green balls. If one ball is chosen at random, what is the probability that it is blue?"
        let q3 = "A car travels 180 miles in 3 hours. What is its average speed in miles per hour?"
        let q4 = "A shirt originally costs $40 and is on sale for 25% off. What is the sale price"
        
        let factory = GameViewControllerFactory(options: [
            q1: ["10", "12", "14", "8"],
            q2: ["1/2", "1/5", "3/10", "3/9", "2/5"],
            q3: ["30", "50", "60", "40", "45"],
            q4: ["$25", "$28", "$30", "$32", "$35"]])
        let correctAnswers = [q1: "10", q2: "3/10", q3: "60", q4: "$30"]
        let router = NavigationControllerRouter(navigationController: navigationController, factory: factory)
        let players = [Player<String, String>(name: "Yuri"), Player<String, String>(name: "John")]
        game = startGame(players: players, questions: [q1, q2, q3, q4], router: router, correctAnswers: correctAnswers)
    }
    
    func configureWindow() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
