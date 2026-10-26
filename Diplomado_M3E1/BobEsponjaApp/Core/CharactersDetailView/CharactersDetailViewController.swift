//
//  CharactersDetailViewController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 23/10/26.
//

import UIKit

class CharactersDetailViewController: UIViewController {
    
    var character = CharactersModel(image: "", alias: "", name: "", lastName: "", species: "", occupation: "", description: "")
    
    private let characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let specieLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let occupationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(characterImage)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(specieLabel)
        contentView.addSubview(occupationLabel)
        contentView.addSubview(descriptionLabel)
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            characterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            characterImage.heightAnchor.constraint(equalToConstant: 300),
            
            fullNameLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 32),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: -16),
            
            specieLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 32),
            specieLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            specieLabel.widthAnchor.constraint(equalToConstant: 180),
            
            occupationLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 32),
            occupationLabel.leadingAnchor.constraint(equalTo: specieLabel.trailingAnchor, constant: 16),
            occupationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: specieLabel.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
        
        title = character.alias
        characterImage.image = UIImage(named: character.image)
        fullNameLabel.text = "Nombre Completo: \(character.fullName)"
        specieLabel.text = "Especie: \(character.species)"
        occupationLabel.text = " Ocupación: \(character.occupation)"
        descriptionLabel.text = character.description
    }


}
