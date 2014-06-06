//
//  FBGrand.swift
//  FlappyBird
//
//  Created by fmj on 14-6-5.
//  Copyright (c) 2014年 fmj. All rights reserved.
//

import UIKit
import SpriteKit

class FBGrand: SKSpriteNode {
    //两个背景都使用这个类:
    //position如何计算？
    init(image:String, timer:CGFloat, physicsBody:Bool){
        var texture = SKTexture(imageNamed: image)
        texture.filteringMode = SKTextureFilteringMode.Nearest
        
        var moveAction = SKAction.moveByX(-texture.size().width, y: 0, duration: NSTimeInterval(timer * texture.size().width))
        var resetAction = SKAction.moveByX(texture.size().width, y: 0, duration: 0.0)
        var groupAction = SKAction.repeatActionForever(SKAction.sequence([moveAction,resetAction]))
        
        super.init(color:UIColor.clearColor(),size:texture.size());
       
        var sprite = SKSpriteNode(texture:texture)
        sprite.setScale(2.0)
        sprite.position = CGPointMake(0,sprite.size.height / 2.0)
        sprite.runAction(groupAction)
        self.addChild(sprite)
        
        var sprite1 = SKSpriteNode(texture:texture)
        sprite1.setScale(2.0)
        sprite1.position = CGPointMake(sprite.size.width,sprite.size.height / 2.0)
        sprite1.runAction(groupAction)
        self.addChild(sprite1)
        var size = self.size
        if physicsBody{
            //还没有搞太明白这个坐标系，真晕
            self.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, self.frame.size.height * 4.0))
            self.physicsBody.dynamic = false
            self.physicsBody.categoryBitMask  = grand_mask
        }
    }
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize)
    {
        super.init(texture:texture,color:color,size:size)
    }
}
