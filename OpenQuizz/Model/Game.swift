//
//  Game.swift
//  OpenQuizz
//
//  Created by Lilian MAGALHAES on 2023-02-20.
//

import Foundation
class Game {
    var score = 0
    var player: Player
    
    private var questions = [Question]()
    private var currentIndex = 0

    var state: State = .ongoing

    enum State {
        case ongoing, over
    }

    var currentQuestion: Question {
        
        return questions[currentIndex]
    }
    
    init(player: Player) {
        self.player = player
    }
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
    
        QuestionManager.shared.get { (questions) in
            self.questions = questions
            self.state = .ongoing
            let name = Notification.Name(rawValue: "QuestionsLoaded")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)
        }
    }
    
    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }
 
    
    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            GameConfig.shared.totalMatchesPlayed! += 1
            self.player.score = self.score
            self.player.numberOfMatches += 1
            finishGame()
        }
    }

     func finishGame() {
        state = .over
    }
    
}
