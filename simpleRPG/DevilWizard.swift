//
//  DevilWizard.swift
//  simpleRPG
//
//  Created by Lance Douglas on 4/13/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
	
	override var loot: [String] {
		return ["Magic Wand", "Dark Amulet", "Salted Pork"]
	}
	
	override var type: String {
		return "Devil Wizard"
	}
	
}