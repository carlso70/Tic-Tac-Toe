//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Jimmy Carlson on 10/27/15.
//  Copyright © 2015 Jimmy Carlson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //1 = circles 2 = crosses
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var gameActive = true
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive == true { //checks if button pressed is nil
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "o"), forState: .Normal)
                
                activePlayer = 2
                
                gameState[sender.tag] = 2
                
            } else {
                
                sender.setImage(UIImage(named: "X"), forState: .Normal)
                
                activePlayer = 1
                
                gameState[sender.tag] = 1
            }
            
            checkForWinner()
        }
    }
    
    func checkForWinner() {
        
        for combination in winningCombos {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                if gameState[combination[0]] == 1 {
                    
                    gameActive = false
                    
                    gameOverLabel.text = "X's have won!"
                    
                } else {
                    
                    gameActive = false
                    
                    gameOverLabel.text = "O's have won!"
                    
                }
                
                playAgainButton.hidden = false
                
                gameOverLabel.hidden = false
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 560,self.gameOverLabel.center.y)
                    
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 560,self.playAgainButton.center.y)
                })
                
                }
            
            if gameActive == true {
                
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        
                        gameActive = true
                        
                    }
                }
                
                if gameActive == false{
                    gameOverLabel.text = "It's a draw!"
                    
                    gameOverLabel.hidden = false
                    
                    playAgainButton.hidden = false
                    
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 560,self.playAgainButton.center.y)
                    
                    self.gameOverLabel.center = CGPointMake(self.playAgainButton.center.x + 560,self.playAgainButton.center.y)
                    
                }; 
            }
        }
        
    }
    
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 560, gameOverLabel.center.y) //preparing for sliding animation
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(gameOverLabel.center.x - 560, gameOverLabel.center.y) //preparing for sliding animation
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ { //9 is the number of buttons
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 560, gameOverLabel.center.y) //preparing for sliding animation
        
        playAgainButton.hidden = true
        
        playAgainButton.center = CGPointMake(gameOverLabel.center.x - 560, gameOverLabel.center.y) //preparing for sliding animation
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

