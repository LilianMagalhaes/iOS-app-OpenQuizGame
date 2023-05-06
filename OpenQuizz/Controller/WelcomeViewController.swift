//
//  WelcomeViewController.swift
//  OpenQuizz
//
//  Created by Lilian MAGALHAES on 2023-03-18.
//

import UIKit

class WelcomeViewController: UIViewController {
    var name: String = ""
    
    @IBOutlet weak var gameStatsButton: UIButton!
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showWelcomeMessage()
    }
    
    
    func showWelcomeMessage () {
        welcomeMessageLabel.text = "Welcome\n\n \(name)\n\n to Open Quiz!"
    }
    @IBAction func goToGameQuizz(_ sender: Any) {
        performSegue(withIdentifier: "segueToQuizz", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToQuizz" {
            let quizzVC = segue.destination as? QuizzViewController
            quizzVC?.name = name
        }
    }
}
