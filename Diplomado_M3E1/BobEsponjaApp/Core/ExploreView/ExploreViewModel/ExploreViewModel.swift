//
//  ExploreViewModel.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 06/11/26.
//

import Foundation

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
    
    func getNumberOfSetions() -> Int {
        sections.count
    }
    
//    func getNumberOF
}
