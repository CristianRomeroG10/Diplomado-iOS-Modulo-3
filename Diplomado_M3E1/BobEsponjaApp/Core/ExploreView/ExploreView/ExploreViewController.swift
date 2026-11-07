//
//  ExploreViewController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 06/11/26.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private let viewModel = ExploreViewModel()
    private var isMovingItem = false
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayOut())
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        title = "Explore"
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: ExploreCollectionViewCell.reuseIdentifier)
        collectionView.register(ExploreSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ExploreSectionHeader.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let longPress = UILongPressGestureRecognizer(
            target: self,
            action: #selector(handelLongPress(gesture: )))
        collectionView.addGestureRecognizer(longPress)
    }
    
    @objc private func handelLongPress(gesture: UILongPressGestureRecognizer) {
        let location = gesture.location(in: collectionView)
        
        switch gesture.state {
        case .began:
            guard let indexPath = collectionView.indexPathForItem(at: location) else {return}
            isMovingItem = collectionView.beginInteractiveMovementForItem(at: indexPath)
        case .changed where isMovingItem:
            collectionView.updateInteractiveMovementTargetPosition(location)
        case .ended where isMovingItem:
            collectionView.endInteractiveMovement()
            isMovingItem = false
        case.cancelled where isMovingItem:
            collectionView.cancelInteractiveMovement()
            isMovingItem = false
        default:
            break
        }
    }
    
    
}

extension ExploreViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.getNumberOfSetions()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getNumberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCollectionViewCell.reuseIdentifier, for: indexPath) as? ExploreCollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = viewModel.getItem(at: indexPath)
        cell.configure(with: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: ExploreSectionHeader.reuseIdentifier, for: indexPath) as? ExploreSectionHeader {
            header.configure(with: viewModel.getTitle(for: indexPath.section))
            return header
        }else {
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        viewModel.getSectionType(at: indexPath.section) == .objects
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        viewModel.moveItem(from: sourceIndexPath, to: destinationIndexPath)
    }
    
}

extension ExploreViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.getItem(at: indexPath)
        let detailViewModel = ExploreDetailViewModel(item: item)
        let detailVC = ExploreDetailViewController(viewModel: detailViewModel)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveOfItemFromOriginalIndexPath originalIndexPath: IndexPath, atCurrentIndexPath currentIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        if proposedIndexPath.section == originalIndexPath.section{
            return proposedIndexPath
        }
        return currentIndexPath
    }
}

extension ExploreViewController {
    func makeLayOut() -> UICollectionViewLayout{
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self else { return nil }
           
            guard let type = self.viewModel.getSectionType(at: sectionIndex) else { return nil }
            let section: NSCollectionLayoutSection
            
            switch type {
            case .vehicles:
                section = self.makeVehiculesSection()
            case .houses:
                section = self.makeHousesSection()
            case .objects:
                section = self.makeObjectsSection()
            }
            
            section.contentInsets = NSDirectionalEdgeInsets(
                top: 12,
                leading: 16,
                bottom: 24,
                trailing: 16)
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(50))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            section.boundarySupplementaryItems = [header]
            return section
        }
    
    }
    func makeVehiculesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(260),
            heightDimension: .absolute(220))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func makeHousesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(170))
        
        let topItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let bottomItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(210),
            heightDimension: .absolute(352)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [topItem, bottomItem])
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 12
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    func makeObjectsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 3.0),
            heightDimension: .fractionalHeight(1)
        )
        
        let items = (0..<3).map { _ in
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 0,
                leading: 4,
                bottom: 0,
                trailing: 4)
            return item
        }
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(170)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: items)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        return section
    }
}

extension ExploreViewController: ExploreViewModelDelegate {
    func exploreDidload() {
        collectionView.reloadData()
    }
    
    func exploreDidFail(with error: any Error) {
        print("Error al cargar Explorar: \(error.localizedDescription)")
    }
    
    
}
