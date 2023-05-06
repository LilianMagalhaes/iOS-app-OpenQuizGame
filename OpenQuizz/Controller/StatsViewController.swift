//
//  StatsViewController.swift
//  OpenQuizz
//
//  Created by Lilian MAGALHAES on 2023-03-18.
//

import UIKit

class StatsViewController: UIViewController {
    
    @IBOutlet weak var totalMatchesPlayedLabel: UILabel!
    @IBOutlet weak var topScorePlayerLabel: UILabel!
    @IBOutlet weak var topScoreLabel: UILabel!
    
    @IBOutlet weak var topPlayerLabel1: UILabel!
    @IBOutlet weak var topScoreLabel1: UILabel!
    @IBOutlet weak var topPlayerLabel2: UILabel!
    @IBOutlet weak var topScoreLabel2: UILabel!
    @IBOutlet weak var topPlayerLabel3: UILabel!
    @IBOutlet weak var topScoreLabel3: UILabel!
    @IBOutlet weak var topPlayerLabel4: UILabel!
    @IBOutlet weak var topScoreLabel4: UILabel!
    @IBOutlet weak var topPlayerLabel5: UILabel!
    @IBOutlet weak var topScoreLabel5: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let totalMatches = GameConfig.shared.totalMatchesPlayed {
            totalMatchesPlayedLabel.text = "\(totalMatches)"
        }
        
        func apply(playerLabel: UILabel, scoreLabel: UILabel, name: String, score: Int) {
            playerLabel.text = name
            scoreLabel.text = "\(score)"
        }
        
        let playersList = GameConfig.shared.sortPlayersByScore()
        switch playersList.count {
        case 1:
            if let topPlayer1 = GameConfig.shared.getTopPlayer(index: 0, topFiveArray: playersList) {
                apply(playerLabel: topPlayerLabel1, scoreLabel: topScoreLabel1, name: topPlayer1.playerName, score: topPlayer1.score)
                apply(playerLabel: topScorePlayerLabel , scoreLabel: topScoreLabel, name: topPlayer1.playerName, score: topPlayer1.score)
            }
        case 2:
            if let topPlayer2 = GameConfig.shared.getTopPlayer(index: 1, topFiveArray: playersList) {
                apply(playerLabel: topPlayerLabel2, scoreLabel: topScoreLabel2, name: topPlayer2.playerName, score: topPlayer2.score)
            }
        case 3:
            if let topPlayer3 = GameConfig.shared.getTopPlayer(index: 2, topFiveArray: playersList) {
                apply(playerLabel: topPlayerLabel3, scoreLabel: topScoreLabel3, name: topPlayer3.playerName, score: topPlayer3.score)
            }
        case 4:
            if let topPlayer4 = GameConfig.shared.getTopPlayer(index: 3, topFiveArray: playersList) {
                apply(playerLabel: topPlayerLabel4, scoreLabel: topScoreLabel4, name: topPlayer4.playerName, score: topPlayer4.score)
            }
        case 5:
            if let topPlayer5 = GameConfig.shared.getTopPlayer(index: 4, topFiveArray: playersList) {
                apply(playerLabel: topPlayerLabel5, scoreLabel: topScoreLabel5, name: topPlayer5.playerName, score: topPlayer5.score)
            }
        default:
            break
        }
    }
}
