//
//  GameScene.swift
//  solomission Shared
//
//  Created by adnan on 14/01/24.
//

import SpriteKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "myufo")
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "space")
        background.size = self.size
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        player.setScale(0.8)
        player.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.2)
        player.zPosition = 2
        self.addChild(player)
    }
    
    func bulletFire(){
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.setScale(1)
        bullet.position = player.position
        bullet.zPosition = 1
        self.addChild(bullet)
        
        let bulletMove = SKAction.moveTo(y: self.size.height + bullet.size.height, duration: 1)
        let bulletDelete = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([bulletMove,bulletDelete])
        bullet.run(bulletSequence)
            
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bulletFire()
    }
}


