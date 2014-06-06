//
//  GameOverScene.swift
//  FlappyBird
//
//  Created by fmj on 14-6-6.
//  Copyright (c) 2014年 fmj. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene {
    var fbDelegate:scenceDelegate!;
    init(size:CGSize,delegate:scenceDelegate)
    {
        super.init(size:size)
        
        fbDelegate = delegate
        var label = SKLabelNode(fontNamed:"Arial")
        label.fontSize = 42;
        label.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame))
        label.text = "GAME　OVER!"
        self.addChild(label)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.fbDelegate.newGame()
    }
}
