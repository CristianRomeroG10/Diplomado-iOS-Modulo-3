//
//  exploreManager.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 06/11/26.
//

import Foundation

enum LocalJSONError: LocalizedError {
    case fileNotFound(String)
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound(let name):
            return "No se encontró el archivo: \(name)"
        }
    }
}


final class ExploreManager {
    
    func loadExplore() throws -> ExploreResponse {
        guard let url = Bundle.main.url(forResource: "explore", withExtension: "json") else {
            throw LocalJSONError.fileNotFound("explore.json")
        }
        
        let data = try Data(contentsOf: url)
        let decode = try JSONDecoder().decode(ExploreResponse.self, from: data)
        return decode
    }
    
}
