//
//  ViewController.swift
//  simpleRPG
//
//  Created by Lance Douglas on 4/13/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: Variables
	@IBOutlet weak var printLbl: UILabel!
	@IBOutlet weak var playerHP: UILabel!
	@IBOutlet weak var enemyHP: UILabel!
	@IBOutlet weak var chest: UIButton!
	@IBOutlet weak var enem1: UIImageView!
	@IBOutlet weak var enem2: UIImageView!
	@IBOutlet weak var killCounter: UILabel!
	@IBOutlet weak var attackBtn: UIButton!
	var player: Player!
	var enemy: Enemy!
	var chestMsg: String?
	var enemiesKilled = 0
	

	// MARK: Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		player = Player(name: "RabidWarfare", hp: 110, atkPwr: 20)
		playerHP.text = "\(player.hp) HP"
	}
	//
	func generateRandomEnemy() {
		let rand = Int(arc4random_uniform(2))
		if rand == 0 {
			enemy = Kimara(hp: 50, atkPwr: 20)
			enem1.hidden = false
		} else {
			enemy = DevilWizard(hp: 60, atkPwr: 15)
			enem2.hidden = false
		}
		printLbl.text = "\(enemy.type) appeared!"
		enemyHP.text = String(enemy.hp)
	}
	//
	@IBAction func attackBtn(sender: UIButton) {
		if enemy == nil {
			generateRandomEnemy()
		} else {
			if enemy.attemptAttack(player.atkPwr) {
				printLbl.text = "Attacked \(enemy.type) for \(player.atkPwr) HP!"
				enemy.hp - player.atkPwr
				enemyHP.text = String(enemy.hp)
			} else {
				printLbl.text = "Attack was Unsuccessful!"
			}
			if !enemy.isAlive {
				killedEnemy()
			}
		}
	}
	//
	func killedEnemy() {
		enemyHP.text = ""
		printLbl.text = "Killed \(enemy.type).  Open Chest!"
		enem1.hidden = true
		enem2.hidden = true
		chest.hidden = false
		if let loot = enemy.dropLoot() {
			chestMsg = "\(player.name) found \(loot)"
			player.addItemToInventory(loot)
		}
		enemy = nil
		enemiesKilled += 1
		killCounter.text = "Enemies Killed: \(enemiesKilled)"
		attackBtn.userInteractionEnabled = false
	}
	//
	@IBAction func chestBtn(sender: UIButton) {
		printLbl.text = chestMsg
		chest.hidden = true
		NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
		let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
		print(delay)
		dispatch_after(delay, dispatch_get_main_queue()) {
			self.attackBtn.userInteractionEnabled = true
		}
		
	}
	//

}

