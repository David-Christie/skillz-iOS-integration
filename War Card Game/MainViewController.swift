//
//  ViewController.swift
//  War Card Game
//
//  Created by David Christie on 19/10/2015.
//  Copyright © 2015 David Christie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //@IBOutlet weak var playGameButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var dealCardsButton: UIButton!
    @IBOutlet weak var playerScoreLabel: UILabel!
    var playerScore : Int = 0
    @IBOutlet weak var enemyScoreLabel: UILabel!
    var enemyScore : Int = 0
    var counter : Int = 0
    //@IBOutlet weak var gameResultLabel: UILabel!
    //@IBOutlet weak var endGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueToGameOverScreen") {
            let svc = segue.destinationViewController as! EndViewController;
            
            svc.playerScore = playerScore
            svc.enemyScore = enemyScore
            
        }
    }

    @IBAction func dealCardsButtonTapped(sender: UIButton) {
        
        let firstCardValue : UInt32 = arc4random_uniform(13) + 1
        let firstCardSuit : UInt32 = arc4random_uniform(4) + 1
        var firstCardImageURI : String = ""
        let secondCardValue : UInt32 = arc4random_uniform(13) + 1
        let secondCardSuit : UInt32 = arc4random_uniform(4) + 1
        var secondCardImageURI : String = ""
        /*
        if(Skillz.skillzInstance().tournamentIsInProgress) {
            firstCardValue = Skillz.skillzInstance().
        }
        */
        for index in 1...2 {
            if(index == 1) {
                firstCardImageURI = generateImageFileName(firstCardValue, suit: firstCardSuit)
            }
            else {
                secondCardImageURI = generateImageFileName(secondCardValue, suit: secondCardSuit)
            }
        }
        
        firstCardImageView.image = UIImage(named : firstCardImageURI)
        secondCardImageView.image = UIImage(named : secondCardImageURI)
        
        if(firstCardValue > secondCardValue) {
            playerScore++
            playerScoreLabel.text = String(playerScore)
        }
        else if(secondCardValue > firstCardValue) {
            enemyScore++
            enemyScoreLabel.text = String(enemyScore)
        }
        
        if(Skillz.skillzInstance().tournamentIsInProgress) {
            Skillz.skillzInstance().updatePlayersCurrentScore(playerScore)
        }
        
        if(++counter == 10) {
            endGame()
        }
    }
    
    func generateImageFileName(value : UInt32, suit : UInt32) -> String {
        var vlaueString : String = ""
        var suitString : String = ""
        
        if(value == 1) {
            vlaueString = "ace"
        }
        else if(value == 11) {
            vlaueString = "jack"
        }
        else if(value == 12) {
            vlaueString = "queen"
        }
        else if(value == 13) {
            vlaueString = "king"
        }
        else {
            vlaueString = String(value)
        }
        
        if(suit == 1) {
            suitString = "hearts"
        }
        else if(suit == 2) {
            suitString = "diamonds"
        }
        else if(suit == 3) {
            suitString = "clubs"
        }
        else if(suit == 4) {
            suitString = "spades"
        }
    
        return String(format: "%@_of_%@", arguments: [vlaueString, suitString])
    }
    
    func endGame() {
        performSegueWithIdentifier("segueToGameOverScreen", sender: self)
        
        
        /*
        if(playerScore > enemyScore) {
            gameResultLabel.text = "Conrgatulations, you won!"
        }
        else if(enemyScore > playerScore) {
            gameResultLabel.text = "Commiserations, you lost"
        }
        else {
            gameResultLabel.text = "The game was a tie"
        }
        */
    }
    
    /*
    @IBAction func playGameButtonTapped(sender: UIButton) {
        performSegueWithIdentifier("segueToGameScreen", sender: playGameButton)
    }
    */
    /*
    @IBAction func endGameButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier("segueToStartScreen", sender: self)
    }
    */
}

