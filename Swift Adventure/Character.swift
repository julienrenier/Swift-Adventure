//
//  Classe.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Character {
    let name: String
    let classe: ClasseName
    var health: Int
    var weaponDamage: Int
    static var names = [String]()
    
    enum ClasseName: String {
        case combattant, nain, colosse
    }
    
    // MARK: - Gameplay
    
    ///
    /// nom, type, description
    /// return bool, explique le retour
    func attack(target: Character) -> Bool {
        print("\n\(name) va attaquer \(target.name) et lui infliger \(weaponDamage) points de dommage.")
        target.health -= weaponDamage
        if (target.health <= 0) {
            print("La cible est morte!")
            return true
        }
        return false
    }
    
    //config pourcentage
    func evolve() {
        if arc4random_uniform(100) >= 80 {
            let bonus = arc4random_uniform(4) + 1
            weaponDamage += bonus.hashValue
            print("Chanceux ! \(name) à gagné \(bonus) points de dommage. 🎁")
        }
    }

    // MARK: - Initialisation

    init(_ name: String, classe: ClasseName, health: Int, weaponDamage: Int) {
        self.name = name
        self.classe = classe
        self.health = health
        self.weaponDamage = weaponDamage
        Character.names.append(name)
    }
    
    //MARK: - Operators
    
    static func == (left: Character, right: Character) -> Bool {
        if left.name.lowercased() == right.name.lowercased() {
            return true
        }
        return false
    }
    
    static func != (left: Character, right: Character) -> Bool {
        if left.name.lowercased() != right.name.lowercased() {
            return true
        }
        return false
    }
}
