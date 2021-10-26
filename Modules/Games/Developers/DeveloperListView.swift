//
//  DeveloperListView.swift
//  Developers
//
//  Created by Abdulrahman Essa on 11/10/2021.
//

import UIKit
import SharedUI

class DeveloperListView : UIView
{
    struct Entity {
        let sections: [SectionEntity]?
        
        static let demo = Entity(sections: [.init(
                                                header: nil,
                                                cells:
                                                    [
                                                        .icon(
                                                            entity: .init(
                                                                name: "From Software",
                                                                icon: ThemeManager.instance.theme.assets.placeholderDeveloperIcon)),
                                                        .icon(
                                                            entity: .init(
                                                                name: "From Software",
                                                                icon: ThemeManager.instance.theme.assets.placeholderDeveloperIcon)),
                                                        .icon(
                                                            entity: .init(
                                                                name: "From Software",
                                                                icon: ThemeManager.instance.theme.assets.placeholderDeveloperIcon)),
                                                        .icon(
                                                            entity: .init(
                                                                name: "From Software",
                                                                icon: ThemeManager.instance.theme.assets.placeholderDeveloperIcon)),
                                                        .icon(
                                                            entity: .init(
                                                                name: "From Software",
                                                                icon: ThemeManager.instance.theme.assets.placeholderDeveloperIcon)),
                                                    ],
                                                
                                                footer: nil)]
        )
    }
    
    struct SectionEntity{
        let header : UIView?
        let cells : [CellEntity]?
        let footer : UIView?
    }
    
    enum CellEntity {
        case label(entity: DeveloperListingEntity)
        case icon(entity: DeveloperListingEntity)
    }
    
    var entity : Entity? {
        didSet{
            reloadData()
        }
    }
    
    private lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = colors.void
        cv.register(CaptionedImageCollectionViewCell.self, forCellWithReuseIdentifier: CaptionedImageCollectionViewCell.id)
        cv.register(LabelHeaderCollectionViewCell.self, forCellWithReuseIdentifier: LabelHeaderCollectionViewCell.id)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private lazy var flowLayout : UICollectionViewFlowLayout = {
        var fl = UICollectionViewFlowLayout()
        fl.scrollDirection = .vertical
        fl.minimumInteritemSpacing = 5
        fl.minimumLineSpacing = 5
        fl.itemSize = CGSize(width: 110, height: 160)
        return fl
    }()
    
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.void
        
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubview(collectionView)
        
        addConstraints([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0),
        ])
    }
    
    private func reloadData()
    {
        collectionView.reloadData()
        
    }
}

extension DeveloperListView : UICollectionViewDelegate
{
    
}

extension DeveloperListView : UICollectionViewDataSource
{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return entity?.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entity?.sections?[section].cells?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = entity?.sections?[indexPath.section].cells?[indexPath.row] else {return UICollectionViewCell()}
        
        let cell : UICollectionViewCell!
        let view : UIView!
        
        switch item{
        case .icon(entity: let e):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CaptionedImageCollectionViewCell.id, for: indexPath)
            
            let captionedImageView: CaptionedImageView = {
                let civ = CaptionedImageView()
                civ.imageView.layer.masksToBounds = true
                civ.imageView.clipsToBounds = true
                civ.imageView.layer.cornerRadius = 50
                civ.entity = .init(caption: e.name, image: e.icon)
                civ.translatesAutoresizingMaskIntoConstraints = false
                return civ
            }()
                
                view = captionedImageView
        case .label(entity: let e):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelHeaderCollectionViewCell.id, for: indexPath)
            
            let labelHeader : LabelHeader = {
                let lh = LabelHeader()
                lh.title = e.name
                lh.translatesAutoresizingMaskIntoConstraints = false
                return lh
            }()
            
            view = labelHeader
        }
        
        cell.backgroundColor = colors.void
        
        cell.contentView.subviews.first(where: {$0.tag == 999})?.removeFromSuperview()
        
        view.tag = 999
        
        cell.contentView.addSubview(view)
        cell.contentView.addConstraints([
            view.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -0),
            view.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -0),
        ])
        return cell;
    }
}

extension DeveloperListView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let item = entity?.sections?[indexPath.section].cells?[indexPath.row] else {return flowLayout.itemSize}
        
        switch item {
        case .icon(entity: _):
            return flowLayout.getCellSize(size: .quarterWidth(height: .singleItem))
        case .label(entity: _):
            return flowLayout.getCellSize(size: .fullWidth(height: .multiItem(items: 1)))
        }
    }
}
