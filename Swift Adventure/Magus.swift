//
//  Magus.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/19/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Magus: Character {
    
    // MARK: - Gameplay
    
    override func attack(target: Character) -> Bool {
        print("\n\(name) va soigner \(target.name) et lui donner \(weaponDamage) points de vie.")
        target.health += weaponDamage
        if (target.health <= 0) {
            print("La cible est morte!")
            return true
        }
        return false
    }
    
    // MARK: - Initialisation
    
    init(_ name: String) {
        super.init(name, classe: .dwarf, health: 75, weaponDamage: 15)
    }
}
