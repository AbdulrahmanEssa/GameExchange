//
//  DynamicCollectionView.swift
//  Games
//
//  Created by Abdulrahman Essa on 23/08/2021.
//

import UIKit
import SharedUI

protocol GameListViewDelegate : AnyObject{
    func gameList(_ view: GameListView, didSelectGameWith indexPath: IndexPath)
}

class GameListView : UIView
{
    struct Entity {
        let sections: [SectionEntity]?
        
        static let demo = Entity(sections: [
            .init(header: nil,
                  cells: [
                    .summary(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                    .cover(entity: .demo),
                  ],
                  footer: nil)
        ])
    }
     
    struct SectionEntity{
        let header : UIView?
        let cells : [CellEntity]?
        let footer : UIView?
    }
    
    enum CellEntity {
        case summary(entity: GameListingEntity)
        case cover(entity: GameListingEntity)
        case custom
    }
    
    var entity : Entity? {
        didSet{
            reloadData()
        }
    }
    
    var scrollDirection : UICollectionView.ScrollDirection = .vertical {
        didSet{
            flowLayout.scrollDirection = scrollDirection
        }
    }
    
    weak var delegate : GameListViewDelegate?
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = colors.void
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.register(GameCoverCollectionViewCell.self, forCellWithReuseIdentifier: GameCoverCollectionViewCell.id)
        cv.register(GameSummaryCollectionViewCell.self, forCellWithReuseIdentifier: GameSummaryCollectionViewCell.id)
        cv.delegate = self
        cv.dataSource = self
        cv.collectionViewLayout = flowLayout
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var flowLayout : UICollectionViewFlowLayout = {
        let cvl = UICollectionViewFlowLayout()
        cvl.itemSize = CGSize(width: 133, height: 166)
        cvl.minimumInteritemSpacing = 10
        cvl.minimumLineSpacing = 10
        cvl.scrollDirection = .horizontal
        return cvl
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.void
        
        setupLayout()
    }
    
    private func setupLayout()
    {
        
        print(UIScreen.main.bounds.width)
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
        collectionView.reloadData();
    }
}

extension GameListView: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.gameList(self, didSelectGameWith: indexPath)
    }
}

extension GameListView : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entity?.sections?[section].cells?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : UICollectionViewCell!
        var view : UIView!
        guard let item = entity?.sections?[indexPath.section].cells?[indexPath.item] else {return UICollectionViewCell()}
        
        switch item {
        case .cover(entity: let e):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameCoverCollectionViewCell.id, for: indexPath)
            
            let gamePosterView : GameCoverView = {
                let gpv = GameCoverView()
                gpv.entity = e
                gpv.translatesAutoresizingMaskIntoConstraints = false
                return gpv
            }()
            view = gamePosterView
        case .summary(entity: let e):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameSummaryCollectionViewCell.id, for: indexPath)
            
            let gameSummaryView: GameSummaryView = {
                let gsv = GameSummaryView()
                gsv.entity = e
                gsv.translatesAutoresizingMaskIntoConstraints = false
                return gsv
            }()
            view = gameSummaryView
        case .custom:
            cell = UICollectionViewCell()
        }
        
        cell.backgroundColor = .blue
        
        cell.subviews.first(where: {$0.tag == 999})?.removeFromSuperview()
        
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

extension GameListView : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size : CGSize!
        switch entity?.sections?[indexPath.section].cells?[indexPath.row] {
        case .cover(entity: _):
            let width = (bounds.width - (flowLayout.minimumInteritemSpacing * 2)) / 3
            size = CGSize(width: width, height: (width * 1.25) + 45)
        case .summary(entity: _):
            return flowLayout.getCellSize(size: .fullWidth(height: .multiItem(items: 2.1)))
        default:
            size = CGSize(width: 133, height: 166)
        }
        return size
    }
}

