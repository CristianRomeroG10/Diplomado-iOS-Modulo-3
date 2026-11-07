//
//  ExploreViewModel.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 06/11/26.
//

import UIKit

protocol ExploreViewModelDelegate: AnyObject {
    func exploreDidload()
    func exploreDidFail(with error: Error)
}

final class ExploreViewModel {
    
    weak var delegate: ExploreViewModelDelegate?
    private let manager: ExploreManager
    private var sections: [ExploreSectionData] = []
    
    
    init(manager: ExploreManager = ExploreManager()){
        self.manager = manager
        loadData()
    }
    
    func loadData(){
        do{
            let response = try manager.loadExplore()
            sections = response.sections
            delegate?.exploreDidload()
        }catch {
            delegate?.exploreDidFail(with: error)
        }
    }
    
    //Cuando una funcion que retorna un valor tiene una sola linea podemos omitir el return ya que se pone en automatico
    func getNumberOfSetions() -> Int {
        sections.count
    }
    
    func getNumberOfItems(in section: Int) -> Int {
        return sections[section].items.count
    }
    
    func getTitle(for section: Int) -> String {
        sections[section].title
    }
    
    func getItem(at indexPath: IndexPath) -> ExploreItem {
        sections[indexPath.section].items[indexPath.item]
    }
    
    func getSectionType(at section: Int) -> ExploreSection? {
        sections[section].id
    }
}
