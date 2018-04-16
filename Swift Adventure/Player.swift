//
//  Player.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Player {
    let name: String
    var characters = [Character]()

    // MARK: - Interface

    func printInfo() {
        print("\n \(name)")
        for character in characters {
            print("    \(character.name) -> \(character.classe) -> \(character.health) ❤️")
        }
    }

    // MARK: - Gameplay

    func createAllCharacters() {
        print("\nDis moi en plus sur ton equipe.\n")
        for number in 0..<3 {
            print("\nLa classe du Membre numero \(number + 1): ")
            switch getClasse() {
            case .combattant:
                print("Quel est le nom de ce valereux combattant ?")
                characters.append(Combattant(getName()))
            case .nain:
                print("Il faut lui trouver un petit nom.")
                characters.append(Nain(getName()))
            case .colosse:
                print("Wow il faut lui trouver un nom a sa taille!")
                characters.append(Colosse(getName()))
            }
        }
    }

    // MARK: - Initialisation

    init(_ name: String) {
        self.name = name
        createAllCharacters()
    }
}
