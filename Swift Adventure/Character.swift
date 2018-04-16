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

    // MARK: - Initialisation

    init(_ name: String, classe: ClasseName, health: Int, weaponDamage: Int) {
        self.name = name
        self.classe = classe
        self.health = health
        self.weaponDamage = weaponDamage
    }
}
