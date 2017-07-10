//
//  ViewController.swift
//  RPS
//
//  Created by einar on 27/04/2017.
//  Copyright © 2017 einar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI(gameState: GameState.start)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI(gameState: GameState) {
        switch gameState {
            
        case .start:
            appSign.text = gameState.message
            gameStatus.text = "Rock, Paper, Scissor"
            view.backgroundColor = UIColor.gray
            playAgain.isHidden = true
            rock.isHidden = false
            scissor.isHidden = false
            paper.isHidden = false
        case .loose:
            //appSign.text = gameState.message
            view.backgroundColor = UIColor.blue
            playAgain.isHidden = false
        case .win:
            //appSign.text = gameState.message
            view.backgroundColor = UIColor.red
            playAgain.isHidden = false
        case .draw:
            //appSign.text = gameState.message
            view.backgroundColor = UIColor.gray
            playAgain.isHidden = false
        }
        
        
    }
    
    func playGame(game : Sign) {
        let computer = randomSign()
        let myGame : GameState = game.play(computer)
        appSign.text = computer.emoji
        gameStatus.text = myGame.message
        updateUI(gameState: myGame)
        
        switch game {
            case .paper:
                rock.isHidden = true
                scissor.isHidden = true
            case .scissor:
                rock.isHidden = true
                paper.isHidden = true
            case .rock:
                paper.isHidden = true
                scissor.isHidden = true
            
        }
        
    }
    
  

    @IBOutlet weak var appSign: UILabel!

    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissor: UIButton!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func rockButton(_ sender: UIButton) {
        
        let myGame = Sign.rock
        playGame(game: myGame)
    }
    
    @IBAction func paperButton(_ sender: UIButton) {
        let myGame = Sign.paper
        playGame(game: myGame)
        
    }
    
    @IBAction func scissorButton(_ sender: UIButton) {
        let myGame = Sign.scissor
        playGame(game: myGame)
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        updateUI(gameState: GameState.start)
    }
}

