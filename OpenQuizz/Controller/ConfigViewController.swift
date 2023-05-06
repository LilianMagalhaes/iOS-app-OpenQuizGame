//
//  ConfigViewController.swift
//  OpenQuizz
//
//  Created by Lilian MAGALHAES on 2023-03-18.
//

import UIKit

class ConfigViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    
   
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        userNameTextField.resignFirstResponder ()
    }
    
    
    @IBAction func createPlayer(_ sender: Any) {
        
        let player = Player(playerName: name)
        GameConfig.shared.save(player: player)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "goToMainTabBar") , object: nil, userInfo: ["name":  name])
    }
    
}

