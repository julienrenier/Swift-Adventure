//
//  Combattant.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Combattant: Character {

    init(_ name: String) {
        super.init(name, classe: .combattant, health: 100, weaponDamage: 10)
    }
}
