//
//  ExploreDetailViewModel.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 07/11/26.
//

import Foundation

class ExploreDetailViewModel {

    private let item: ExploreItem
    
    init(item: ExploreItem) {
        self.item = item
    }
    
    var name: String {item.name}
    var imageName: String {item.imageName}
    var description: String {item.description}
    var showSecretFormula: Bool {item.hasSecretFormula == true}
    
    var information: [ExploreDetailInfo] {
        var rows: [ExploreDetailInfo] = []
        
        if let owner = item.owner {
            rows.append(ExploreDetailInfo(
                title: "Propietario",
                value: owner))
        }
        if let firstAppearance = item.firstAppearance{
            rows.append(ExploreDetailInfo(
                title: "Primera aparición",
                value: firstAppearance))
        }
        if let capacity = item.capacity {
            rows.append(ExploreDetailInfo(
                title: "Capacidad",
                value: "\(capacity) personas"))
        }
        if let residents = item.residents, !residents.isEmpty {
            rows.append(ExploreDetailInfo(
                title: "Residentes",
                value: residents.joined(separator: ", ")))
        }
        
        if let material = item.material {
            rows.append(ExploreDetailInfo(
                title: "Material",
                value: material))
        }
        if let specialAbility = item.specialAbility {
            rows.append(ExploreDetailInfo(title: "Habilidad Especial", value: specialAbility))
        }
        
        return rows
        
    }
}
