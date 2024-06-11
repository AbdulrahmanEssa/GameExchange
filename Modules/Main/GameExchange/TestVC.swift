//
//  TestVC.swift
//  GameExchange
//
//  Created by Abdulrahman Essa on 17/10/2021.
//

import UIKit
import SharedUI
import SwiftUI

public class TestVC : UIViewController
{
    private var ui = TestView()
    
    public override func loadView() {
        super.loadView()
        view = ui
    }
       
    public override func viewDidLoad() {
        super.viewDidLoad()
        //        ui.entity = .demo
        hideNavbarIfFirstController()
    }
}

class TestView : UIView
{
    struct Entity {
        
    }
    
    var entity: Entity? {
        didSet{
            reloadData()
        }
    }
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 0
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var paragraphView: ParagraphView = {
        let pv = ParagraphView()
        pv.entity = .demo
        pv.translatesAutoresizingMaskIntoConstraints = false
        return pv
    }()

    
    convenience init()
    {
        self.init(frame: .zero)
        
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubview(stackView)
        backgroundColor = colors.background
        stackView.addArrangedSubview(paragraphView)
        addConstraints([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -0),
//            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -0),
        ])
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        
    }
}

class ParagraphView : UIView
{
    struct Entity {
        var title : String?
        var description : String?
        var expanded : Bool
        
        static let demo = Entity(title: "Description",
                                 description: "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \r\nSimultaneous storytelling from three unique perspectives: \r\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \r\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.",
                                 expanded: false)
    }
    
    private lazy var collapseButton : UIButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(didTapCollapse), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false;
        return btn;
    }()
    
    private lazy var collapseView: ReadMoreView = {
        let rmv = ReadMoreView()
        rmv.translatesAutoresizingMaskIntoConstraints = false
        return rmv
    }()
    
    private lazy var titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Description"
        lbl.font = fonts.title
        lbl.textColor = colors.title
        lbl.numberOfLines = 1
        lbl.textAlignment = .left
        lbl.minimumScaleFactor = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \r\nSimultaneous storytelling from three unique perspectives: \r\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \r\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged."
        lbl.font = fonts.paragraph
        lbl.textColor = colors.title
        lbl.numberOfLines = 2
        lbl.textAlignment = .left
        lbl.minimumScaleFactor = 1
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var entity: Entity? {
        didSet{
            reloadData()
        }
    }
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.background
        setupLayout()
    }
    
    @objc private func didTapCollapse() {
        if (entity != nil)
        {
            entity!.expanded = !entity!.expanded
            collapseView.entity = .init(isCollapsed: entity!.expanded)
        }
    }
    
    private func setupLayout()
    {
        addSubviews([titleLabel, descriptionLabel, collapseView, collapseButton])
        addConstraints([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            collapseView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: -10),
            collapseView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            collapseView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            collapseView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            
            collapseButton.topAnchor.constraint(equalTo: collapseView.topAnchor, constant: 0),
            collapseButton.leadingAnchor.constraint(equalTo: collapseView.leadingAnchor, constant: 0),
            collapseButton.trailingAnchor.constraint(equalTo: collapseView.trailingAnchor, constant: -0),
            collapseButton.bottomAnchor.constraint(equalTo: collapseView.bottomAnchor, constant: -0),
        ])
    }
    
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        titleLabel.text = e.title
        descriptionLabel.text = e.description
        UIView.animate(withDuration: 1.0, delay: 0, options: [.layoutSubviews], animations: {
            self.descriptionLabel.numberOfLines = e.expanded ? 0 : 4
            self.collapseView.layoutIfNeeded()
            self.descriptionLabel.layoutIfNeeded()
            self.layoutIfNeeded()
        }, completion: nil)
    }
}

class ReadMoreView : UIView
{
    struct Entity {
        var isCollapsed : Bool
    }
    
    var entity: Entity? {
        didSet{
            reloadData()
        }
    }
    
    private lazy var arrowView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.trySetImage(named: assets.arrowheadDown, withTint: colors.contrast)
        iv.layer.cornerRadius = 0
        iv.layer.borderWidth = 0
        iv.layer.borderColor = colors.separator.cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var separator : Separator = {
        let s = Separator()
        s.height = 1
        return s
    }()
    
    private var height : NSLayoutConstraint!
    
    convenience init()
    {
        self.init(frame: .zero)
        backgroundColor = .clear
        height = heightAnchor.constraint(equalToConstant: 20)
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubviews([arrowView, separator])
        
        addConstraints([
            arrowView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            arrowView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            arrowView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            arrowView.heightAnchor.constraint(equalToConstant: 20),
            arrowView.widthAnchor.constraint(equalTo: arrowView.heightAnchor, multiplier: 1),
            
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
        
        
    }
    
    override func draw(_ rect: CGRect) {
   
        
        separator.layer.shadowOpacity = 1
        separator.layer.shadowColor = UIColor.white.cgColor

//        let shadowSize: CGFloat = 20
//        let shadowDistance : CGFloat = -10
//        let contactRect = CGRect(x: -shadowSize, y: bounds.height - (shadowSize * 0.4) + shadowDistance, width: bounds.width + shadowSize * 2, height: shadowSize)
//        layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
//        layer.shadowRadius = 5
//        layer.shadowOpacity = 0.4
//
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.2
//        layer.shadowRadius = 8
//        layer.shadowOffset = .init(width: 0, height: 0)
//        layer.shouldRasterize = false
    }
    
    override func layoutSubviews() {
        UIView.animate(withDuration: 1) {
            
        }
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        let img = e.isCollapsed ? assets.arrowheadUp : assets.arrowheadDown
        
        arrowView.trySetImage(named: img, withTint: colors.contrast)
    }
}
