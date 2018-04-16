//
//  tools.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

func getClasse() -> ClasseName {
    print("Combattant, Nain ou colosse ?")
    switch readLine()?.lowercased() {
    case "combattant":
        return .combattant
    case "nain":
        return .nain
    case "colosse":
        return .colosse
    default:
        exit(84)
    }
}

func getName() -> String {
    if let name = readLine() {
        return name
    }
    exit(84)
}
