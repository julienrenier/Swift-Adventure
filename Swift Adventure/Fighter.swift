//
//  Combattant.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Fighter: Character {

    // MARK: - Initialisation
    
    init(_ name: String) {
        super.init(name, classe: .fighter, health: 100, weaponDamage: 10)
    }
}
