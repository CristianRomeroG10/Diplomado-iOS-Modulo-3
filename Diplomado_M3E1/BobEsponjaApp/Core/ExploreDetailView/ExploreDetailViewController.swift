//
//  ExploreDetailViewController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 07/11/26.
//

import UIKit

class ExploreDetailViewController: UIViewController {
    
    let viewModel: ExploreDetailViewModel
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: ExploreDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private lazy var secretFormulaButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "ver formula secreta"
        configuration.image = UIImage(systemName: "lock.fill")
        configuration.imagePadding = 8
        configuration.cornerStyle = .large
        
        let button = UIButton(configuration: configuration)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        configurationView()
    }
    
    func setUpViews(){
        view.backgroundColor = .systemBackground

        view.addSubview(scrollView)
        scrollView.addSubview(contentStack)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            scrollView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            scrollView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor
            ),
            scrollView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),

            contentStack.topAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.topAnchor,
                constant: 20
            ),
            contentStack.leadingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.leadingAnchor,
                constant: 20
            ),
            contentStack.trailingAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.trailingAnchor,
                constant: -20
            ),
            contentStack.bottomAnchor.constraint(
                equalTo: scrollView.contentLayoutGuide.bottomAnchor,
                constant: -24
            ),
            contentStack.widthAnchor.constraint(
                equalTo: scrollView.frameLayoutGuide.widthAnchor,
                constant: -40
            ),

            itemImageView.heightAnchor.constraint(
                equalToConstant: 240
            )
        ])

        contentStack.addArrangedSubview(itemImageView)
        contentStack.addArrangedSubview(nameLabel)
        contentStack.addArrangedSubview(descriptionLabel)
    }
    
    func configurationView(){
        title = viewModel.name
        navigationItem.largeTitleDisplayMode = .never
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        itemImageView.image = UIImage(named: viewModel.imageName) ?? UIImage(systemName: "photo")
        configurateInformation()
        configureSecretFormulaButton()
    }
    
    func configurateInformation(){
        guard !viewModel.information.isEmpty else {return}
        
        let titleLabel = UILabel()
        titleLabel.text = "información"
        titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        contentStack.addArrangedSubview(titleLabel)
        
        for information in viewModel.information {
            let infoView = makeInformationView(title: information.title, value: information.value)
            contentStack.addArrangedSubview(infoView)
        }
        
    }
    
    private func makeInformationView(title: String,value: String) -> UIView {

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textColor = .secondaryLabel

        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .systemFont(
            ofSize: 16,
            weight: .medium
        )
        valueLabel.numberOfLines = 0

        let stack = UIStackView(
            arrangedSubviews: [titleLabel, valueLabel]
        )
        stack.axis = .vertical
        stack.spacing = 4

        return stack
    }
    
    private func configureSecretFormulaButton(){
        guard viewModel.showSecretFormula else {return}
        
        contentStack.addArrangedSubview(secretFormulaButton)
        
        secretFormulaButton.heightAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
    }
    
   
}
