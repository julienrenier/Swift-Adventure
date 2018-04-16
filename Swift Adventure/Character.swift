//
//  Classe.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

enum ClasseName {
    case combattant, nain, colosse
}

class Character {
    let name: String
    let classe: ClasseName
    var health: Int
    var weaponDamage: Int
    
    // MARK: - Gameplay
    
    func attack(target: Character) -> Bool {
        print("\(name) va attaquer \(target.name) et lui infliger \(weaponDamage) dommage.")
        target.health -= weaponDamage
        if (target.health <= 0) {
            print("La cible est morte!")
            return true
        }
        return false
    }

    // MARK: - Initialisation

    init(_ name: String, classe: ClasseName, health: Int, weaponDamage: Int) {
        self.name = name
        self.classe = classe
        self.health = health
        self.weaponDamage = weaponDamage
    }
    
    //MARK: - Operators
    
    static func == (left: Character, right: Character) -> Bool {
        if left.name == right.name {
            return true
        }
        return false
    }
    
    static func != (left: Character, right: Character) -> Bool {
        if left.name != right.name {
            return true
        }
        return false
    }
}
