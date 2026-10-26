//
//  CharactersTableViewCell.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 17/10/26.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    static let reuseIdentifier = "CharacterCell"
    
    private let characterImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .label
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .secondaryLabel
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterImage.layer.cornerRadius = characterImage.bounds.width/2
    }
    
    func setUpView(){
        accessoryType = .disclosureIndicator
        let textStack = UIStackView(arrangedSubviews: [
            nameLabel,
            detailLabel
        ])
        textStack.axis = .vertical
        textStack.spacing = 2
        textStack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(characterImage)
        contentView.addSubview(textStack)
        let margins = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            // Imagen de tamaño fijo, centrada verticalmente.
                    characterImage.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
                    characterImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                    characterImage.widthAnchor.constraint(equalToConstant: 55),
                    characterImage.heightAnchor.constraint(equalToConstant: 55),

                    // La fila debe tener espacio suficiente para la imagen.
                    characterImage.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor,constant: 10),
                    characterImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,constant: -10),

                    // Los textos determinan la altura si necesitan más espacio.
                    textStack.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor,constant: 12),
                    textStack.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
                    textStack.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
                    textStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -10)
        ])
    }
    
    func configure(with character: CharactersModel){
        characterImage.image = UIImage(named: character.image)
        nameLabel.text = character.alias
        detailLabel.text = "\(character.species) · \(character.occupation)"
    }
    
    
}

