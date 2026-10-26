//
//  FavoritesViewController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 17/10/26.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var favoritesTableView: UITableView!
    
    let model = FavoritesModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoritesTableView.reloadData()
    }

    private func setUpView(){
        title = "Favoritos"
        view.backgroundColor = .systemBackground
        favoritesTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: FavoritesTableViewCell.reuseIdentifier)
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self
        favoritesTableView.rowHeight = UITableView.automaticDimension
        favoritesTableView.estimatedRowHeight = 75
    }

    func showDeleteAlert(at indexPath: IndexPath, completion: @escaping (Bool) -> Void){
        let favoriteCharacter = model.getFavoriteCharacter(index: indexPath)
        let title = "Eliminar favorito"
        let message = "Seguro que quieres eliminar a \(favoriteCharacter.alias)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
            completion(false)
        }
        let deleteAction = UIAlertAction(title: "Eliminar", style: .destructive) { [weak self] _ in
            guard let self = self else {
                completion(false)
                return
            }
            
            self.model.removeCharacters(at: indexPath)
            self.favoritesTableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        present(alert, animated: true)
        
    }

}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.reuseIdentifier, for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        let favorite = model.getFavoriteCharacter(index: indexPath)
        cell.configuration(with: favorite)
        return cell
    }
    


}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favoriteDatail =  CharactersDetailViewController()
        favoriteDatail.character = favoriteCharacters[indexPath.row]
        self.navigationController?.pushViewController(favoriteDatail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteFavorite = UIContextualAction(style: .destructive, title: "Eliminar Favorito") { _, _, complention in
//            self.model.removeCharacters(at: indexPath)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            complention(true)
            //NOS LLEVAMOS EL FUNCIONAMIENTO DE ELIMINAR LA ALERTA PREVENTIVA
            self.showDeleteAlert(at: indexPath, completion: complention)
        }
        deleteFavorite.image = UIImage(systemName: "trash")
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteFavorite])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}
