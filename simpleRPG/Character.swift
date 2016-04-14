//
//  Character.swift
//  simpleRPG
//
//  Created by Lance Douglas on 4/13/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import Foundation

class Character {
	// MARK: Variables
	private var _hp: Int = 100
	private var _atkPwr: Int = 10
	var hp: Int {
		get {
			return _hp
		}
	}
	var atkPwr: Int {
		get {
			return _atkPwr
		}
	}
	var isAlive: Bool {
		get {
			if hp <= 0 {
				return false
			} else {
				return true
			}
		}
	}
	// MARK: Initializers
	init(hp: Int, atkPwr: Int) {
		self._hp = hp
		self._atkPwr = atkPwr
	}
	// MARK: Functions
	func attemptAttack(atkPwr: Int) -> Bool {
		self._hp -= atkPwr
		
		return true
	}

	
}