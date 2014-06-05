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
        
        newGame();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    func newGame()
    {
        //怎么开始一局新的游戏？。。。
        lblScore.text = "0"
        if(scene){
            scene.removeFromParent();
        }
        
        score = 0;
        scene = FlappyBirdScene(size:CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.height));
        scene.fbDelegate = self;
        scene.scaleMode = .AspectFill
        if let view = self.view as? SKView{
            view.showsFPS = true;
            view.showsNodeCount = true;
            view.ignoresSiblingOrder = true
            view.presentScene(scene);
        }
    }
    
    func increaseScore()
    {
        score = score+1;
        lblScore.text = "\(score)"
        
    }

    func gameOver()
    {
        scene.view.paused = true;
        scene.gameOvered = true;
        lblScore.text = "GAME OVER"
    }
}

