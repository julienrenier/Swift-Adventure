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
    
    // MARK: - Selector
    
    func selectCharacter() -> Character {
        print("\nChoisissez votre champion pour ce tour \(name) !")
        printInfo()
        if let championName = readLine(), let champion = characters.first(where: { (character) -> Bool in
            return character.name.lowercased() == championName.trimmingCharacters(in: .whitespaces).lowercased()
        }) {
            print("\(champion.name) combattra pour vous.")
            return champion
        }
        print("Ce n'est pas un champion possible, réessaye.")
        return selectCharacter()
    }
    
    func selectTarget(ennemies players: [Player]) -> (Player, Character) {
        print("\nChoisissez votre cible 🎯")
        for player in players where player != self {
            player.printInfo()
        }
        let championName = readLine()
        for player in players where player != self {
            if let championName = championName, let target = player.characters.first(where: { (character) -> Bool in
                return character.name.lowercased() == championName.trimmingCharacters(in: .whitespaces).lowercased()
            }) {
                return (player, target)
            }
        }
        print("Ce n'est pas une cible possible, réessaye.")
        return selectTarget(ennemies: players)
    }

    // MARK: - Gameplay

    func createAllCharacters() {
        print("\nDis moi en plus sur ton equipe. ")
        for number in 0..<3 {
            print("\nLa classe du membre numero \(number + 1): ")
            switch Game.getClasse() {
            case .fighter:
                print("Quel est le nom de ce valereux combattant ?")
                characters.append(Fighter(Game.getUniqueName(strings: Character.names)))
            case .dwarf:
                print("Il faut lui trouver un petit nom.")
                characters.append(Dwarf(Game.getUniqueName(strings: Character.names)))
            case .colossus:
                print("Wow il faut lui trouver un nom a sa taille!")
                characters.append(Colossus(Game.getUniqueName(strings: Character.names)))
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
        if left.name.lowercased() == right.name.lowercased() {
            return true
        }
        return false
    }
    
    static func != (left: Player, right: Player) -> Bool {
        if left.name.lowercased() != right.name.lowercased() {
            return true
        }
        return false
    }
}
