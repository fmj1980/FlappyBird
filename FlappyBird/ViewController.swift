//
//  ViewController.swift
//  FlappyBird
//
//  Created by fmj on 14-6-5.
//  Copyright (c) 2014年 fmj. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, scenceDelegate{
    
    @IBOutlet var lblScore : UILabel
    var score:Int!;
    var scene:FlappyBirdScene!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let view = self.view as? SKView{
            view.showsFPS = true;
            view.showsNodeCount = true;
            view.ignoresSiblingOrder = true
            newGame()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func newGame()
    {
        lblScore.text = "0"
        score = 0;
        scene = FlappyBirdScene(size:CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height));
        scene.fbDelegate = self;
        scene.scaleMode = .AspectFill

        (self.view as SKView).presentScene(scene);
    }
    
    func increaseScore()
    {
        score = score+1;
        lblScore.text = "\(score)"
        
    }

    func gameOver()
    {
        var gameOverScene = GameOverScene(size:self.view.bounds.size,delegate:self);
        gameOverScene.fbDelegate = self;
        (self.view as SKView).presentScene(gameOverScene)
    }
}

