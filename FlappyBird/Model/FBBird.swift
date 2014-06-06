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
    var textures:Array = [];
    for index in 1...4{
        var texture = SKTexture(imageNamed: "bird-0\(index)")
        texture.filteringMode = SKTextureFilteringMode.Nearest
        textures.append(texture)
    }
    super.init(texture: textures[0] as SKTexture);
    
    var anim = SKAction.animateWithTextures(textures, timePerFrame: 0.1)
    var flap = SKAction.repeatActionForever(anim)
    self.runAction(flap)
    
    self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.height / 2.0)
    self.physicsBody.dynamic = true
    //暂时不知道枚举怎么处理。。。
    self.physicsBody.categoryBitMask  = bird_mask
    self.physicsBody.contactTestBitMask = pipe_mask | grand_mask;
    self.physicsBody.collisionBitMask = grand_mask | pipe_mask;
    }
    
    init(texture: SKTexture!, color: UIColor!, size: CGSize)
    {
        super.init(texture:texture,color:color,size:size)
    }
}
