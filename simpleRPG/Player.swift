//
//  Player.swift
//  simpleRPG
//
//  Created by Lance Douglas on 4/13/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import Foundation

class Player: Character {
	// MARK: Variables
	private var _name = "Player"
	var name: String {
		get {
			return _name
		}
	}
	private var _inventory = [String]()
	var inventory: [String] {
		return _inventory
	}
	// MARK: Initializers
	convenience init(name: String, hp: Int, atkPwr: Int) {
		self.init(hp: hp, atkPwr: atkPwr)
		_name = name
	}
	
	func addItemToInventory(item: String) {
		_inventory.append(item)
	}
	
}