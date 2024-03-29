//
//  Nain.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

/// A class champion with a lot of damage but with a little life.
class Dwarf: Champion {

    // MARK: - Initialisation
    
    init(_ name: String) {
        super.init(name, classe: .dwarf, health: 50, weaponDamage: 20)
    }
}
