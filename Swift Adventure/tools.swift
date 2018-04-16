//
//  tools.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

func getClasse() -> ClasseName {
    print("Combattant, Nain ou Colosse ?")
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

func getString() -> String {
    if let string = readLine() {
        return string
    }
    exit(84)
}

func getInt() -> Int {
    if let int = Int(readLine()!) {
        return int
    }
    exit(84)
}
