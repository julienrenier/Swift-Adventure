//
//  Player.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

/// A player in swift adventure.
class Player {
    /// Player's name.
    let name: String
    /// Player's champions.
    var characters = [Champion]()

    // MARK: - Interface

    /// Print all info about his champions.
    func printInfo() {
        print("\n\(name)")
        for character in characters {
            print("    \(character.name) -> \(character.classeName.rawValue) -> \(character.health) ❤️")
        }
    }
    
    // MARK: - Selector
    
    /// Select the player's choice champion.
    /// - returns: A player's character.
    func selectCharacter() -> Champion {
        print("-----------------------------------------------------")
        print("\nChoisissez votre champion pour ce tour \(name) ! 🏆")
        printInfo()
        if let championName = readLine(), let champion = characters.first(where: { (character) -> Bool in
            return character.name.capitalized == championName.trimmingCharacters(in: .whitespaces).capitalized
        }) {
            print("\(champion.name) combattra pour vous.")
            return champion
        }
        print("Ce n'est pas un champion possible, réessaye.")
        return selectCharacter()
    }
    
    /// Select a target regarding the selected champion.
    /// - parameters:
    ///     - players: All the players in the game.
    ///     - faction: Character.Faction for the selected champion.
    /// - returns: The player and his targeted champion.
    func selectTarget(players: [Player], faction: Champion.Faction) -> (Player, Champion) {
        print("\nChoisissez votre cible 🎯")
        if faction == .ally {
            printInfo()
            if let championName = readLine()?.trimmingCharacters(in: .whitespaces).capitalized, let target = characters.first(where: { (character) -> Bool in
                return character.name.capitalized == championName
            }) {
                return (self, target)
            }
        } else {
            for player in players where player != self {
                player.printInfo()
            }
            let championName = readLine()?.trimmingCharacters(in: .whitespaces).capitalized
            for player in players where player != self {
                if let championName = championName, let target = player.characters.first(where: { (character) -> Bool in
                    return character.name.capitalized == championName
                }) {
                    return (player, target)
                }
            }
        }
        print("Ce n'est pas une cible possible, réessaye.")
        return selectTarget(players: players, faction: faction)
    }

    // MARK: - Initialisation
    
    /// Create all necessary player's champion.
    private func createAllCharacters() {
        print("\nDis moi en plus sur ton equipe. ")
        Champion.printClassDescription()
        for number in 0..<3 {
            print("\nLa classe du membre numero \(number + 1): ")
            switch Game.getClasse() {
            case .fighter:
                print("Quel est le nom de ce valereux combattant ?")
                characters.append(Fighter(Game.getUniqueName(strings: Champion.names)))
            case .dwarf:
                print("Il faut lui trouver un petit nom.")
                characters.append(Dwarf(Game.getUniqueName(strings: Champion.names)))
            case .colossus:
                print("Wow il faut lui trouver un nom a sa taille !")
                characters.append(Colossus(Game.getUniqueName(strings: Champion.names)))
            case .magus:
                print("Il nous faut un nom qui inspire la confiance !")
                characters.append(Magus(Game.getUniqueName(strings: Champion.names)))
            }
        }
    }

    init(_ name: String) {
        self.name = name
        createAllCharacters()
    }
    
    // MARK: Operators
    
    static func == (left: Player, right: Player) -> Bool {
        if left.name.capitalized == right.name.capitalized {
            return true
        }
        return false
    }
    
    static func != (left: Player, right: Player) -> Bool {
        if left.name.capitalized != right.name.capitalized {
            return true
        }
        return false
    }
}
