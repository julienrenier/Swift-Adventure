//
//  Magus.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/19/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

/// A class champion who can heal his ally.
class Magus: Champion {
    
    // MARK: - Gameplay
    
    /// Heal the target.
    /// - parameter target: The target who will be heal.
    /// - returns: If the target is dead.
    override func useWeapon(target: Champion) -> Bool {
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
        super.init(name, classe: .magus, health: 75, weaponDamage: 15)
    }
}
