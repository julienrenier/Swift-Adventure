//
//  tools.swift
//  Swift Adventure
//
//  Created by Julien Renier on 4/10/18.
//  Copyright © 2018 Julien Renier. All rights reserved.
//

import Foundation

//mettre dans game static


//TODO
//promptClass
//Que anglais
//Ajouter index et racourcir le jeu
//Ajouter des couleurs/surbrillance/gras
//Doc
//Github
//Descriptif personnage
//Mage


func getClasse() -> Character.ClassName? {
    print("Combattant, Nain ou Colosse ?")
    let input = readLine()?.trimmingCharacters(in: .whitespaces).lowercased()
    guard let className = Character.ClassName(rawValue: input!) else {
        return getClasse()
    }
    return className
}

func getUniqueString(strings: [String] = [String]()) -> String {
    if let newString = readLine(), !strings.contains(newString) {
        return newString.trimmingCharacters(in: .whitespaces)
    }
    print("Ce nom existe déjà, réessaye.")
    return getUniqueString(strings: strings)
}
