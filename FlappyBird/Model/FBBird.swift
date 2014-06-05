//
//  FBBird.swift
//  FlappyBird
//
//  Created by fmj on 14-6-5.
//  Copyright (c) 2014年 fmj. All rights reserved.
//

import UIKit
import SpriteKit

class FBBird: SKSpriteNode {
   init(){
    var birdTexture1 = SKTexture(imageNamed: "bird-01")
    birdTexture1.filteringMode = SKTextureFilteringMode.Nearest
    var birdTexture2 = SKTexture(imageNamed: "bird-02")
    birdTexture2.filteringMode = SKTextureFilteringMode.Nearest
    var birdTexture3 = SKTexture(imageNamed: "bird-03")
    birdTexture3.filteringMode = SKTextureFilteringMode.Nearest
    var birdTexture4 = SKTexture(imageNamed: "bird-04")
    birdTexture4.filteringMode = SKTextureFilteringMode.Nearest
    
    super.init(texture: birdTexture1);
    
    var size = self.size;
    
    var anim = SKAction.animateWithTextures([birdTexture1, birdTexture2,birdTexture3,birdTexture4], timePerFrame: 0.1)
    var flap = SKAction.repeatActionForever(anim)

    self.setScale(1.0)
    self.runAction(flap)
    
    
    self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height / 2.0)
    self.physicsBody.dynamic = true
    self.physicsBody.allowsRotation = false
    
    //暂时不知道枚举怎么处理。。。
    self.physicsBody.categoryBitMask  = 1
    self.physicsBody.contactTestBitMask = 2|4;
    }
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize)
    {
        super.init(texture:texture,color:color,size:size)
    }
}
