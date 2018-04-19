//
//  Game.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Game {
    private var players = [Player]()

    // MARK: - Interface

    private func printLunch() {
        print("\nBonjour, bienvenue dans Swift Adventure! 🗺")
        print("Ecrivez le nombre de personnes qui prendront part à cette partie.")
    }
    
    private func loading() {
        print("\nChargement..")
        for _ in 0...25 {
            print("*", terminator: "")
            usleep(100000)
        }
        print("")
    }

    // MARK: - Gameplay
    
    func play() {
        var end = players.count
        
        while (end > 1) {
            for player in players {
                let champion = player.selectCharacter()
                let (ennemie, target) = player.selectTarget(ennemies: players)
                champion.evolve()
                if champion.attack(target: target) {
                    ennemie.characters.remove(at: ennemie.characters.index(where: { $0 == target })!)
                    if ennemie.characters.isEmpty {
                        end -= 1
                    }
                }
            }
        }
        if let winner = players.first {
            print("Bravo \(winner.name) la victoire vous appartient.")
        }
    }
    
    // MARK: - Getter
    
    static func getClasse() -> Character.ClassName {
        print("Combattant, Nain ou Colosse ?")
        guard let input = readLine()?.trimmingCharacters(in: .whitespaces).capitalized,
            let className = Character.ClassName(rawValue: input) else {
            return getClasse()
        }
        return className
    }
    
    static func getUniqueName(strings: [String] = [String]()) -> String {
        if let newString = readLine()?.trimmingCharacters(in: .whitespaces).capitalized,
            newString != "", !strings.contains(newString) {
            return newString
        }
        print("Ce nom n'est pas disponible, réessaye.")
        return getUniqueName(strings: strings)
    }

    // MARK: - Initialisation
    
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
