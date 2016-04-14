//
//  Kimara.swift
//  simpleRPG
//
//  Created by Lance Douglas on 4/13/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import Foundation

class Kimara: Enemy {
	
	let IMMUNE_MAX = 15
	
	override var loot: [String] {
		return ["Gold Coins", "Silver Buckler", "Strong Sword"]
	}
	
	override var type: String {
		return "Kimara"
	}
	
	override func attemptAttack(atkPwr: Int) -> Bool {
		if atkPwr >= IMMUNE_MAX {
			return super.attemptAttack(atkPwr)
		}
		return false
	}
	
}