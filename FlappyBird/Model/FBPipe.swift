//
//  FBPipe.swift
//  FlappyBird
//
//  Created by fmj on 14-6-5.
//  Copyright (c) 2014年 fmj. All rights reserved.
//

import UIKit
import SpriteKit

var pipeGrap:CGFloat = 110

class FBPipe: SKSpriteNode {
    @lazy var pipeTextureUp = SKTexture(imageNamed: "PipeUp")
    @lazy var pipeTextureDown = SKTexture(imageNamed: "PipeDown")
    init(size:CGSize,block:() -> Void){
        super.init(color:UIColor.clearColor(),size:size);
        self.position = CGPoint(x: self.frame.size.width+pipeTextureDown.size().width*2, y:0)
            
        pipeTextureUp.filteringMode = SKTextureFilteringMode.Nearest
        pipeTextureDown.filteringMode = SKTextureFilteringMode.Nearest
        var frameHeight = self.frame.size.height;
        var height = UInt32( self.frame.size.height / 4 )
        //这块是有问题的，需要根据高度来计算
        var randomHight = arc4random() % height + height-50;
        
        var pipeDown = SKSpriteNode(texture: self.pipeTextureDown)
        pipeDown.setScale(2.0)
        pipeDown.position = CGPointMake(0.0, CGFloat(randomHight) + pipeDown.size.height + CGFloat(pipeGrap))
        pipeDown.physicsBody = SKPhysicsBody(rectangleOfSize: pipeDown.size)
        pipeDown.physicsBody.dynamic = false
        pipeDown.physicsBody.categoryBitMask  = pipe_mask
        self.addChild(pipeDown)
        
        var pipeUp = SKSpriteNode(texture: self.pipeTextureUp)
        pipeUp.setScale(2.0)
        pipeUp.position = CGPointMake(0.0, CGFloat(randomHight))
        pipeUp.physicsBody = SKPhysicsBody(rectangleOfSize: pipeUp.size)
        pipeUp.physicsBody.dynamic = false
        pipeUp.physicsBody.categoryBitMask  = pipe_mask
        self.addChild(pipeUp)
        
        
        var distanceToMove = CGFloat(self.frame.size.width + 4.0 * pipeTextureUp.size().width);
        var movePipes = SKAction.moveByX(-distanceToMove, y:0.0, duration:NSTimeInterval(0.01 * distanceToMove));
        var removePipes = SKAction.removeFromParent();
        var blockAction = SKAction.runBlock(block);
        var action = SKAction.sequence([movePipes,blockAction,removePipes]);
        self.runAction(action);
       
    }
    init(texture: SKTexture!, color: UIColor!, size: CGSize)
    {
        super.init(texture:texture,color:color,size:size)
    }
}
