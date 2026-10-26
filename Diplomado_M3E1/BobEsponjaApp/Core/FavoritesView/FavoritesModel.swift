//
//  FavoritesModel.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 24/10/26.
//

import Foundation
import UIKit

class FavoritesModel{
    func getNumberOfRows() -> Int {
        favoriteCharacters.count
    }
    
    func getFavoriteCharacter(index: IndexPath) -> CharactersModel {
        favoriteCharacters[index.row]
    }
    
    func removeCharacters(at index: IndexPath) {
        favoriteCharacters.remove(at: index.row)
    }
}
