//
//  Colosse.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Colosse: Character {
    init(_ name: String) {
        super.init(name, classe: .colosse, health: 300, weaponDamage: 2)
    }
}
