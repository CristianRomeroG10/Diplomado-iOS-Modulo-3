//
//  ExploreModel.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 06/11/26.
//

import Foundation

enum ExploreSection: String, Codable {
    case vehicles
    case houses
    case objects
    
    var title: String {
        switch self {
        case .vehicles:
            "vehiculos"
        case .houses:
            "Casas"
        case  .objects: "Objetos especiales"
        }
    }
}

struct ExploreResponse: Codable {
    let sections: [ExploreSectionData]
}

struct ExploreSectionData: Codable {
    let id: ExploreSection
    let title: String
    var items: [ExploreItem]
}

struct ExploreItem: Codable {
    let id: String
    let name: String
    let imageName: String
    let description: String
    let owner: String?
    let firstAppearance: String?
    
    //Vehiculos
    let capacity: Int?
    
    //casas
    let address: String?
    let residents: [String]?
    let hasSecretFormula: Bool?
    
    //Objetos
    let material: String?
    let specialAbility: String?
}
