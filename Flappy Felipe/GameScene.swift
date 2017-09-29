//
//  GameScene.swift
//  Flappy Felipe
//
//  Created by Vina Rianti on 27/9/17.
//  Copyright © 2017 Vina Melody. All rights reserved.
//

import SpriteKit
import GameplayKit

enum Layer: CGFloat {
    case background
    case foreground
}

class GameScene: SKScene {
    
    let worldNode = SKNode()
    var playableStart: CGFloat = 0
    var playableHeight: CGFloat = 0
    
    override func didMove(to view: SKView) {
        addChild(worldNode)
        setupBackground()
        setupForeground()
    }
    
    func setupBackground() {
        let background = SKSpriteNode(imageNamed: "background.png")
        background.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        background.position = CGPoint(x: size.width / 2, y: size.height)
        background.zPosition = Layer.background.rawValue
        
        playableStart = size.height - background.size.height
        playableHeight = background.size.height
        
        worldNode.addChild(background)
    }
    
    func setupForeground() {
        let foreground = SKSpriteNode(imageNamed: "Ground.png")
        foreground.anchorPoint = CGPoint(x: 0.0, y: 1.0)
        foreground.position = CGPoint(x: 0, y: playableStart)
        foreground.zPosition = Layer.background.rawValue
        
        worldNode.addChild(foreground)
    }
}
