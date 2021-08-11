//
//  WajihaKeyboard.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit


public protocol WajihaKeyboardDelegate : AnyObject {
    func WajihaKeyboard(_ view: WajihaKeyboard, didTap key: String)
}

/// Customizable on-screen keyboard view
public class WajihaKeyboard : UIView
{
    public struct Entity {
        
        public init(keyboardType: WajihaKeyboard.WajihaKeyboardType, keySpacing: CGFloat, keysPerRow: CGFloat, keysPerColumn: CGFloat?) {
            self.keyboardType = keyboardType
            self.keySpacing = keySpacing
            self.keysPerRow = keysPerRow
            self.keysPerColumn = keysPerColumn
        }
        
        public let keyboardType : WajihaKeyboardType
        public let keySpacing: CGFloat
        public let keysPerRow: CGFloat
        /// Setting this to anything but nil makes sure your the keyboard is resized to fit the view frame, and never scrollable.
        public let keysPerColumn: CGFloat?
    }
    
    public override var bounds: CGRect{
        didSet{
            setNeedsLayout()
            reloadData()
        }
    }
    
    public enum WajihaKeyboardType {
        case normal
        case numpad
        case custom(keys: [String])
        
        var keys : [String]  {
            switch self
            {
                case .normal:
                    return ["Not Yet Implemented"]
                    
                case .numpad:
                    return["1", "2","3","4","5","6","7","8","9", WajihaKeyboard.EMPTY,"0",WajihaKeyboard.BACKSPACE]
                    
                case .custom(keys: let k):
                    return k
            }
        }
    }
    
    public var entity : Entity? = .init(keyboardType: .numpad, keySpacing: 10, keysPerRow: 3, keysPerColumn: 4){
        didSet{
            reloadData()
        }
    }
    
    public weak var delegate : WajihaKeyboardDelegate?
    
    public static let BACKSPACE = "←"
    public static let EMPTY = ""
    
    lazy var collectionView : UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        cv.register(WajihaKeyboardKeyCell.self, forCellWithReuseIdentifier: WajihaKeyboardKeyCell.id)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = colors.void
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var flowlayout : UICollectionViewFlowLayout = {
        let fl = UICollectionViewFlowLayout()
        return fl
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.void
        setupLayout()

    }
    
    func setupLayout()
    {
        addSubview(collectionView)

        addConstraints([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -0),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0),
        ])
    }
    
    func reloadData()
    {
        guard let e = entity else {return}
        
        flowlayout.minimumLineSpacing = e.keySpacing
        flowlayout.minimumInteritemSpacing = e.keySpacing
        
        // Calculate Width
        var frameWidth = frame.width
        if (frameWidth == 0) { frameWidth = UIScreen.main.bounds.width}
        let panelWidth = frameWidth - (e.keySpacing * CGFloat(e.keysPerRow))
        let itemWidth = panelWidth / e.keysPerRow
        
        // if keysPerColumn is provided, calculate height
        var itemHeight : CGFloat!
        if (e.keysPerColumn != nil)
        {
            var frameHeight = frame.height
            if (frameHeight == 0) { frameHeight = UIScreen.main.bounds.height / 2}
            let panelHeight = frameHeight - (e.keySpacing * CGFloat (e.keysPerColumn ?? e.keysPerRow))
            itemHeight = panelHeight / (e.keysPerColumn ?? e.keysPerRow)
        }
        else
        {
            itemHeight = itemWidth/2
        }

        flowlayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
//        collectionView.reloadData()
    }
}

extension WajihaKeyboard : UICollectionViewDelegate
{
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.WajihaKeyboard(self, didTap: entity!.keyboardType.keys[indexPath.row])
    }
}

extension WajihaKeyboard : UICollectionViewDataSource
{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return entity?.keyboardType.keys.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WajihaKeyboardKeyCell.id, for: indexPath) as! WajihaKeyboardKeyCell
        
        let key = entity?.keyboardType.keys[indexPath.row]
        
        if (key == WajihaKeyboard.EMPTY)
        {
            cell.isUserInteractionEnabled = false;
            cell.backgroundColor = .clear
        }
        else
        {
            cell.backgroundColor = colors.background
            cell.layer.borderWidth = 1
            cell.layer.borderColor = colors.separator.cgColor
            cell.layer.cornerRadius = 8
            
            let keyLabel : UILabel = {
                let l = UILabel()
                l.text = key
                l.font = fonts.buttonTitle
                l.textColor = colors.title
                l.numberOfLines = 1
                l.textAlignment = .center
                l.minimumScaleFactor = 0.5
                l.translatesAutoresizingMaskIntoConstraints = false
                return l
            }()
            
            subviews.first(where: {$0.tag == 999})?.removeFromSuperview()
            keyLabel.tag = 999
            
            cell.addSubview(keyLabel)
            cell.addConstraints([
                keyLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0),
                keyLabel.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 0),
                keyLabel.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: 0),
                keyLabel.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0),
            ])
        }
        
        return cell
    }
}

public class WajihaKeyboardKeyCell : UICollectionViewCell
{
    public static let id = "WajihaKeyboardKey"
    
    public override var isSelected: Bool{
        didSet{
            selected()
        }
    }
    
    private func selected()
    {
        let v = self

        UIView.animate(withDuration: 0.12, delay: 0.0, options: .allowUserInteraction, animations: {
            v.backgroundColor = v.isSelected ? v.colors.primary : v.colors.background
        }, completion: { (bool) in
            UIView.animate(withDuration: 0.1, delay: 0.0, options: [.allowUserInteraction], animations: {
                v.backgroundColor = v.colors.background
            })
        })
    }
}
