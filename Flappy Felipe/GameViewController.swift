//
//  GameViewController.swift
//  Flappy Felipe
//
//  Created by Vina Rianti on 27/9/17.
//  Copyright © 2017 Vina Melody. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // 1. Setting the scene size right
        if let skView = self.view as? SKView {
            if skView.scene == nil {
                let aspectRatio = skView.bounds.size.height / skView.bounds.size.width
                let scene = GameScene(size: CGSize(width: 320, height: 320 * aspectRatio))
                
                skView.showsFPS = false
                skView.showsNodeCount = false
                skView.showsPhysics = false
                skView.ignoresSiblingOrder = true
                
                scene.scaleMode = .aspectFit
                skView.presentScene(scene)
            }
        }
        // 1. end
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
