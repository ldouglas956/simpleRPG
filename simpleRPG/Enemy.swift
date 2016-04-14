//
//  Enemy.swift
//  simpleRPG
//
//  Created by Lance Douglas on 4/13/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import Foundation

class Enemy: Character {
	var loot: [String] {
		return ["Rusty Dagger", "Cracked Buckler"]
	}
	
	var type: String {
		return "Grunt"
	}
	
	func dropLoot() -> String? {
		let rand = Int(arc4random_uniform(UInt32(loot.count)))
		return loot[rand]
	}
	
}