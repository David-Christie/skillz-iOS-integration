//
//  StartViewController.swift
//  War Card Game
//
//  Created by David Christie on 20/10/2015.
//  Copyright © 2015 David Christie. All rights reserved.
//

import UIKit


class StartViewController: UIViewController {

    @IBOutlet weak var playGameButton: UIButton!
    
    
    @IBAction func playGameButtonTapped(sender: UIButton) {
        performSegueWithIdentifier("segueToGameScreen", sender: playGameButton)
    }
}