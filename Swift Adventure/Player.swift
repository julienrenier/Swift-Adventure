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
        print("\n\(name)")
        for character in characters {
            print("    \(character.name) -> \(character.classe) -> \(character.health) ❤️")
        }
    }
    
    func selectCharacter() -> Character {
        print("Choisissez votre champion pour ce tour \(name) !")
        printInfo()
        let championName = getString()
        if let champion = characters.first(where: { (character) -> Bool in
            return character.name == championName
        }) {
            return champion
        }
        exit(84)
    }
    
    func selectTarget(ennemies players: [Player]) -> (Player, Character) {
        for player in players where player.name != name {
            player.printInfo()
        }
        let championName = getString()
        for player in players where player != self {
            if let target = player.characters.first(where: { (character) -> Bool in
                return character.name == championName
            }) {
                return (player, target)
            }
        }
        exit(84)
    }

    // MARK: - Gameplay

    func createAllCharacters() {
        print("\nDis moi en plus sur ton equipe.\n")
        for number in 0..<3 {
            print("\nLa classe du Membre numero \(number + 1): ")
            switch getClasse() {
            case .combattant:
                print("Quel est le nom de ce valereux combattant ?")
                characters.append(Combattant(getString()))
            case .nain:
                print("Il faut lui trouver un petit nom.")
                characters.append(Nain(getString()))
            case .colosse:
                print("Wow il faut lui trouver un nom a sa taille!")
                characters.append(Colosse(getString()))
            }
        }
    }

    // MARK: - Initialisation

    init(_ name: String) {
        self.name = name
        createAllCharacters()
    }
    
    // MARK: Operators
    
    static func == (left: Player, right: Player) -> Bool {
        if left.name == right.name {
            return true
        }
        return false
    }
    
    static func != (left: Player, right: Player) -> Bool {
        if left.name != right.name {
            return true
        }
        return false
    }
}
