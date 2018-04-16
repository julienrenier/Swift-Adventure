//
//  Game.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

class Game {
    var players = [Player]()

    // MARK: - Interface

    func printLunch() {
        print("\nBonjour, bienvenue dans Swift Adventure! 🗺")
    }

    // MARK: - Gameplay

    func addPlayer(number: Int) {
        print("\nCe jeu est un jeu multijoueurs, il va donc falloir que vous me passiez vos noms.")
        for _ in 0..<number {
            print("\nJoueur \(players.count + 1): ", terminator: "")
            players.append(Player(getName()))
        }
    }

    // MARK: - Initialisation

    init(playerNumber: Int = 2) {
        printLunch()
        addPlayer(number: playerNumber)
        for player in players {
            player.printInfo()
        }
    }
}
