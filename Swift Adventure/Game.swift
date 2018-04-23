//
//  Game.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

/// The representation of a game.
class Game {
    /// All player's game.
    private var players = [Player]()

    // MARK: - Interface

    /// Print game presentation.
    private func printLunch() {
        print("\nBonjour, bienvenue dans Swift Adventure! 🗺")
        print("Ecrivez le nombre de personnes qui prendront part à cette partie.")
    }
    
    /// Perform and print the loading.
    private func loading() {
        print("\nChargement..")
        for _ in 0...25 {
            print("*", terminator: "")
            usleep(100000)
        }
        print("")
    }

    // MARK: - Gameplay
    
    /// Main loop game.
    func play() {
        var end = players.count
        var turns = 1
        
        while (end > 1) {
            for player in players where end > 1 {
                let champion = player.selectCharacter()
                let (ennemy, target) = champion.classeName == .magus ? player.selectTarget(players: players, faction: .ally)
                    : player.selectTarget(players: players, faction: .enemy)
                champion.evolve()
                if champion.useWeapon(target: target) {
                    ennemy.characters.remove(at: ennemy.characters.index(where: { $0 == target })!)
                    if ennemy.characters.count == 0 {
                        end -= 1
                    }
                }
            }
            turns += 1
        }
        if let winner = players.first {
            print("\nBravo \(winner.name) la victoire vous appartient. 🏅")
            print("Cette partie a pris \(turns) tours")
        }
    }
    
    // MARK: - Getter
    
    /// Get class from the input.
    static func getClasse() -> Champion.ClassName {
        print("Combattant, Nain, Colosse ou Mage ?")
        guard let input = readLine()?.trimmingCharacters(in: .whitespaces).capitalized,
            let className = Champion.ClassName(rawValue: input) else {
            return getClasse()
        }
        return className
    }
    
    /// Get an unique name from the imput.
    static func getUniqueName(strings: [String] = [String]()) -> String {
        if let newString = readLine()?.trimmingCharacters(in: .whitespaces).capitalized,
            newString != "", !strings.contains(newString) {
            return newString
        }
        print("Ce nom n'est pas disponible, réessaye.")
        return getUniqueName(strings: strings)
    }

    // MARK: - Initialisation
    
    /// Add player to the game.
    /// - parameter number: The number of player in the game.
    private func addPlayer(number: Int) {
        print("\nTrès bien, il va donc falloir que vous me passiez vos noms.")
        for _ in 0..<number {
            print("\nJoueur \(players.count + 1): ", terminator: "")
            players.append(Player(Game.getUniqueName()))
        }
    }

    init() {
        printLunch()
        guard let input = readLine(), let playerNumber = Int(input), playerNumber > 1 else {
            print("Le jeu ne peut pas s'initialiser avec cette valeur")
            exit(84)
        }
        addPlayer(number: playerNumber)
        for player in players {
            player.printInfo()
        }
        loading()
    }
}
