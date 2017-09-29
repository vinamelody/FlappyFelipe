//
//  MovementComponent.swift
//  Flappy Felipe
//
//  Created by Vina Rianti on 29/9/17.
//  Copyright © 2017 Vina Melody. All rights reserved.
//

import SpriteKit
import GameplayKit

class MovementComponent: GKComponent {
    let spriteComponent: SpriteComponent
    
    let impulse: CGFloat = 400
    
    var velocity = CGPoint.zero
    let gravity: CGFloat = -1500
    
    var playableStart: CGFloat = 0
    
    init(entity: GKEntity) {
        self.spriteComponent = entity.component(ofType: SpriteComponent.self)!
        super.init()
    }
    
    func applyMovement(_ seconds: TimeInterval) {
        let spriteNode = spriteComponent.node
        
        // Apply gravity
        let gravityStep = CGPoint(x: 0, y: gravity) * CGFloat(seconds)
        velocity += gravityStep
        
        // Apple velocity
        let velocityStep = velocity * CGFloat(seconds)
        spriteNode.position += velocityStep
        
        // Temporary ground hit
        if spriteNode.position.y - spriteNode.size.height / 2 < playableStart {
            spriteNode.position = CGPoint(x: spriteNode.position.x, y: playableStart + spriteNode.size.height / 2)
        }
    }
    
    func applyImpulse(_ lastUpdateTime: TimeInterval) {
        velocity = CGPoint(x: 0, y: impulse)
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        if entity as? PlayerEntity != nil {
            applyMovement(seconds)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
