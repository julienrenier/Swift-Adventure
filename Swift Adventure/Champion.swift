//
//  Classe.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

/// A champion who can attack or heal other champion in the game.
class Champion {
    /// Champion's name.
    let name: String
    /// Champion's class name.
    let classeName: ClassName
    /// Champion beginning health.
    var health: Int
    /// Champion's beginning demaged.
    var weaponDamage: Int
    /// All the champions created name from the beginning.
    static var names = [String]()
    
    /// All champion's classes.
    enum ClassName: String {
        case fighter = "Combattant", dwarf = "Nain", colossus = "Colosse", magus = "Mage"
    }
    
    /// All champion's factions.
    enum Faction {
        case enemy, ally
    }
    
    // MARK: - Interface
    
    /// Print all classes in the game.
    static func printClassDescription() {
        print("\nVoici les classes disponible:")
        print(" Nain: Puissant mais pas très résistant")
        print(" Mage: Soigne ses alliés")
        print(" Colosse: Très résistant mais ne fait pas très mal")
        print(" Combattant: Un personnage hybride")
    }
    
    // MARK: - Gameplay
    
    /// Attack the target.
    /// - parameter target: The target for this attack.
    /// - returns: If the target is dead.
    func useWeapon(target: Champion) -> Bool {
        print("\n\(name) va attaquer \(target.name) et lui infliger \(weaponDamage) points de dommage.")
        target.health -= weaponDamage
        if (target.health <= 0) {
            print("La cible est morte!")
            return true
        }
        return false
    }
    
    /// The champion try to get a better weapon.
    func evolve() {
        if arc4random_uniform(100) >= 75 {
            let bonus = arc4random_uniform(4) + 1
            weaponDamage += bonus.hashValue
            print("Chanceux ! \(name) à gagné \(bonus) points sur son arme. 🎁")
        }
    }

    // MARK: - Initialisation

    init(_ name: String, classe: ClassName, health: Int, weaponDamage: Int) {
        self.name = name
        self.classeName = classe
        self.health = health
        self.weaponDamage = weaponDamage
        Champion.names.append(name)
    }
    
    //MARK: - Operators
    
    static func == (left: Champion, right: Champion) -> Bool {
        if left.name.lowercased() == right.name.lowercased() {
            return true
        }
        return false
    }
    
    static func != (left: Champion, right: Champion) -> Bool {
        if left.name.lowercased() != right.name.lowercased() {
            return true
        }
        return false
    }
}
