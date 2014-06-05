//
//  FlappyBirdScene.swift
//  FlappyBird
//
//  Created by fmj on 14-6-5.
//  Copyright (c) 2014年 fmj. All rights reserved.
//

import UIKit
import SpriteKit

var sky_z_index:CGFloat =  1.0
var pipe_z_index:CGFloat = 3.0
var ground_z_index:CGFloat = 5.0
var bird_z_index:CGFloat = 7.0


protocol scenceDelegate {
    func increaseScore()
    func gameOver();
    func newGame();
}

class FlappyBirdScene: SKScene ,SKPhysicsContactDelegate{
    var bird = FBBird()
    var grand:FBGrand!
    var sky:FBGrand!
    var fbDelegate:scenceDelegate!
    var gameOvered:Bool = false
    
    init(size:CGSize)
    {
        super.init(size:size)
    }
   
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake( 0.0, -5.0 )
        self.showBackgound()
        self.showPipe()
        self.showBird()
    }
    
    func showPipe()
    {
        //此处仅仅做闭包的测试
        var blockAction = SKAction.runBlock(
            {[]() in
                var pipe = FBPipe(size:self.frame.size,
                {() in
                    self.fbDelegate.increaseScore()
                });
                pipe.zPosition = pipe_z_index
                self.addChild(pipe);
            })
        var delayAction = SKAction.waitForDuration(NSTimeInterval(1.8))
        var sequeAction = SKAction.sequence([blockAction, delayAction])
        var action = SKAction.repeatActionForever(sequeAction)
        self.runAction( action )
    }
    
    func showBird()
    {
        bird.zPosition = bird_z_index
        bird.position = CGPoint(x: 120, y:self.frame.size.height * 0.6)
        self.addChild(bird);
    }
    
    func showBackgound()
    {
        var skyColor = SKColor(red: 81.0/255.0, green: 192.0/255.0, blue: 201.0/255.0, alpha: 1.0)
        self.backgroundColor = skyColor
        
        grand =  FBGrand(image:"land",timer:0.02,physicsBody:true);
        grand.position = CGPointMake(0,-grand.size.height)
        grand.zPosition = ground_z_index
        
        self.addChild(grand);
        
        sky = FBGrand(image:"sky",timer:0.1,physicsBody:false)
        sky.position = CGPointMake(0,grand.size.height)
        sky.zPosition = sky_z_index
        self.addChild(sky);
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        if gameOvered
        {
            gameOvered = false;
            self.fbDelegate.newGame();
            return;
        }
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            bird.physicsBody.velocity = CGVectorMake(0, 0)
            bird.physicsBody.applyImpulse(CGVectorMake(0, 6))
            
        }
    }
    
    func clamp(min: CGFloat, max: CGFloat, value: CGFloat) -> CGFloat {
        if( value > max ) {
            return max;
        } else if( value < min ) {
            return min;
        } else {
            return value;
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        //println(currentTime)
        bird.zRotation = self.clamp( -1, max: 0.5, value: bird.physicsBody.velocity.dy * ( bird.physicsBody.velocity.dy < 0 ? 0.003 : 0.001 ) );
    }
    
    func didBeginContact(contact: SKPhysicsContact!)
    {
        self.fbDelegate.gameOver();
        
    }
    
}
