//
//  HomeViewController.swift
//  HomePage
//
//  Created by Abdulrahman Essa on 01/10/2021.
//

import UIKit
import SharedUI
import Games

public class HomeViewController : UIViewController
{
    var ui = HomeView()
    let latestReleaseController = GameListViewController.list(page: 1, itemLimit: 1)
    let topTenController = GameListViewController.singleRow(page: 1, itemLimit: 0, viewMode: .cover)
    
    public override func loadView() {
        super.loadView()
        view = ui
        addChild(latestReleaseController)
        addChild(topTenController)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        ui.entity = .init(sections: [.init(header: nil,
                                           cells: [
                                            .labelHeader(text: "Latest Release", alignment: .center),
                                            .custom(view: latestReleaseController.view, size: .fullWidth(height: .multiItem(items: 2))),
                                            .labelHeader(text: "Top 10 this month", alignment: .left),
                                            .custom(view: topTenController.view, size: .fullWidth(height: .multiItem(items: 1.5))),
                                            .labelHeader(text: "Top 10 this month", alignment: .left),
                                            .custom(view: topTenController.view, size: .fullWidth(height: .multiItem(items: 1.5))),
                                            .labelHeader(text: "Top 10 this month", alignment: .left),
                                            .custom(view: topTenController.view, size: .fullWidth(height: .multiItem(items: 1.5))),
                                           ],
                                           footer: nil)])
        hideNavbarIfFirstController()
    }
}


class HomeView: UIView
{
    struct Entity {
        let sections: [SectionEntity]?
    }
    
    struct SectionEntity{
        let header : UIView?
        let cells : [CellEntity]?
        let footer : UIView?
    }
    
    enum CellEntity {
        case labelHeader(text : String, alignment: NSTextAlignment)
        case custom(view: UIView, size: UICollectionViewFlowLayout.CellSize)
    }
    
    
    var entity : Entity? {
        didSet{
            reloadData()
        }
    }
    
    var defaultSingleItemHeight: CGFloat = 50 {
        didSet{
            flowLayout.itemSize.height = defaultSingleItemHeight
        }
    }
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = colors.void
        cv.register(LabelHeaderCollectionViewCell.self, forCellWithReuseIdentifier: LabelHeaderCollectionViewCell.id)
        cv.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.id)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var flowLayout : UICollectionViewFlowLayout = {
        var fl = UICollectionViewFlowLayout()
        fl.scrollDirection = .vertical
        fl.minimumInteritemSpacing = 5
        fl.minimumLineSpacing = 5
        fl.itemSize = CGSize(width: 135, height: 168)
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

extension HomeView : UICollectionViewDelegate
{
    
}

extension HomeView : UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return entity?.sections?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entity?.sections?[section].cells?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : UICollectionViewCell!
        let view : UIView!
        let item = entity?.sections?[indexPath.section].cells?[indexPath.row]
        
        switch item {
        case .labelHeader(text: let t, alignment: let a):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelHeaderCollectionViewCell.id, for: indexPath)
            let labelHeader : LabelHeader = {
                let lh = LabelHeader()
                lh.text = t
                lh.alignment = a
                lh.translatesAutoresizingMaskIntoConstraints = false
                return lh
            }()
            view = labelHeader
        case .custom(view: let v, size: _):
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.id, for: indexPath)
            view = v
            view.translatesAutoresizingMaskIntoConstraints = false
        case .none:
            cell = UICollectionViewCell()
            view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        cell.contentView.subviews.first(where: {$0.tag == 999})?.removeFromSuperview()
        
        view.tag = 999
        
        cell.contentView.addSubview(view)
        cell.contentView.addConstraints([
            view.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 5),
            view.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor, constant: 5),
            view.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor, constant: -5),
            view.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -5),
        ])
        return cell;
    }
}

extension HomeView : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let item = entity?.sections?[indexPath.section].cells?[indexPath.row] else {return CGSize(width: 0, height: 0)}
        switch item {
        case .labelHeader(text: _, alignment: _):
            return flowLayout.getCellSize(size: .fullWidth(height: .multiItem(items: 0.25)))
        case .custom(view: _, size: let s):
            return flowLayout.getCellSize(size: s)
        }
    }
}

class CustomCollectionViewCell : UICollectionViewCell {
    static let id = "CustomCollectionViewCell"
}

class LabelHeader : UIView
{
    var text : String = "Header" {
        didSet{
            label.text = text
        }
    }
    
    var alignment : NSTextAlignment = .left {
        didSet{
            label.textAlignment = alignment
        }
    }
    
    lazy var label : UILabel = {
        let lbl = UILabel()
        lbl.text = "Header"
        lbl.font = fonts.title
        lbl.textColor = colors.title
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        lbl.minimumScaleFactor = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubview(label)
        
        addConstraints([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
}

class LabelHeaderCollectionViewCell : UICollectionViewCell{
    static let id = "LabelHeaderCollectionViewCell"
}
