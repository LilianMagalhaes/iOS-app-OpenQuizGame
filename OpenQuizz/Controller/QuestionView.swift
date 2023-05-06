//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Lilian MAGALHAES on 2023-02-25.
//

import UIKit

class QuestionView: UIView {
    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!
    
    enum Style {
            case correct, incorrect, standard
        }
    
    var title = "" {
        didSet {
            label.text = title
        }
    }
    
        var style: Style = .standard {
            didSet {
                setStyle(style)
            }
        }
    
    private func setStyle (_ style: Style) {
            switch style {
            case .correct:
                backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 1)
                icon.image = UIImage(named: "Icon Correct")
                icon.isHidden = false
            case .incorrect:
                backgroundColor = UIColor(red: 243/255.0, green: 135/255.0, blue: 148/255.0, alpha: 1)
                icon.image = UIImage(named: "Icon Error")
                icon.isHidden = false
            case .standard:
                backgroundColor = UIColor(red: 191/255.0, green: 196/255.0, blue: 201/255.0, alpha: 1)
                icon.isHidden = true
            }
        }
        
    
}
