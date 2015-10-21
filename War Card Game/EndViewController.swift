//
//  EndViewController.swift
//  War Card Game
//
//  Created by David Christie on 20/10/2015.
//  Copyright © 2015 David Christie. All rights reserved.
//

import UIKit


class EndViewController: UIViewController {

    @IBOutlet weak var gameResultLabel: UILabel!
    @IBOutlet weak var endGameButton: UIButton!
    var playerScore : Int!
    var enemyScore : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if(Skillz.skillzInstance().tournamentIsInProgress) {
            Skillz.skillzInstance().displayTournamentResultsWithScore(playerScore) {
                // This code is called when exiting the Skill portal
                NSLog("Reporting final score to Skillz")
                NSLog("Exiting the Skillz portal")
            }
        }
        
        if(playerScore > enemyScore) {
            gameResultLabel.text = "Conrgatulations, you won!"
        }
        else if(enemyScore > playerScore) {
            gameResultLabel.text = "Commiserations, you lost"
        }
        else {
            gameResultLabel.text = "The game was a tie"
        }
    }
    
    @IBAction func endGameButtonTapped(sender: UIButton) {
        performSegueWithIdentifier("segueToStartScreen", sender: self)
    }
}