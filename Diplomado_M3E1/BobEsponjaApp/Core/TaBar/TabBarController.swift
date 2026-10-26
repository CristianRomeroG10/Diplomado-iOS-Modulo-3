//
//  TabBarController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 17/10/26.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        
        //MARK: First View
        //Instanciamos El viewController
        let characterViewController = CharacterViewController()
        //Embebemos el viewController en un navigation Controller
        let characterNavigation = UINavigationController(rootViewController: characterViewController)
        characterNavigation.tabBarItem.title = "Personajes"
        characterNavigation.tabBarItem.image = UIImage(systemName: "person.2.circle")
        characterNavigation.tabBarItem.selectedImage = UIImage(systemName: "person.2.circle.fill")
        
        
        //MARK: Third View
        //Instanciamos El viewController
        let favoriteViewController = FavoritesViewController()
        //Embebemos el viewController en un navigation Controller
        let favoritesNavigation = UINavigationController(rootViewController: favoriteViewController)
        favoritesNavigation.tabBarItem.title = "Favorites"
        favoritesNavigation.tabBarItem.image = UIImage(systemName: "heart.circle")
        favoritesNavigation.tabBarItem.selectedImage = UIImage(systemName: "heart.circle.fill")
        
        //MARK: ViewControllers ARRAY
        let viewControllers: [UIViewController] = [characterNavigation, favoritesNavigation]
        self.viewControllers = viewControllers
        self.selectedIndex = 0
    }
    
    

}
