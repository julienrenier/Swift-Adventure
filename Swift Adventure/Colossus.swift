//
//  Colosse.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Colossus: Champion {
    
    // MARK: - Initialisation
    
    init(_ name: String) {
        super.init(name, classe: .colossus, health: 150, weaponDamage: 5)
    }
}
