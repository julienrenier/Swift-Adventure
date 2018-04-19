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

    private func addPlayer(number: Int) {
        print("\nCe jeu est un jeu multijoueurs, il va donc falloir que vous me passiez vos noms.")
        for _ in 0..<number {
            print("\nJoueur \(players.count + 1): ", terminator: "")
            players.append(Player(Game.getUniqueString()))
        }
    }
    
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
    
    static func getClasse() -> Character.ClassName? {
        print("Combattant, Nain ou Colosse ?")
        let input = readLine()?.trimmingCharacters(in: .whitespaces).lowercased()
        guard let className = Character.ClassName(rawValue: input!) else {
            return getClasse()
        }
        return className
    }
    
    static func getUniqueString(strings: [String] = [String]()) -> String {
        if let newString = readLine(), !strings.contains(newString) {
            return newString.trimmingCharacters(in: .whitespaces)
        }
        print("Ce nom existe déjà, réessaye.")
        return getUniqueString(strings: strings)
    }

    // MARK: - Initialisation

    //TODO minimum player ask
    init(playerNumber: Int) {
        printLunch()
        addPlayer(number: playerNumber)
        for player in players {
            player.printInfo()
        }
        loading()
    }
}
