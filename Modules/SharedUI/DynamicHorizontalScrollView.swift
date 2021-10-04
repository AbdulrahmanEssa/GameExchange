//
//  DynamicHorizontalScrollView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 08/08/2021.
//

import Foundation

import UIKit

public class DynamicHorizontalScrollView : UIView
{
    public var views : [UIView]?
    {
        didSet{
            reloadData()
        }
    }
    
    public var spacing : CGFloat?{
        didSet{
            stackView.spacing = spacing ?? 0
        }
    }
    
    public var paginated : Bool = false {
        didSet{
            scrollView.isPagingEnabled = paginated
        }
    }
    
    public var showBars : Bool = false {
        didSet{
            scrollView.showsVerticalScrollIndicator = showBars
            scrollView.showsHorizontalScrollIndicator = showBars
        }
    }
    
    let scrollView : UIScrollView = {
        let sv = UIScrollView()
        sv.alwaysBounceHorizontal = false
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fill
        sv.spacing = 0
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = colors.background
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubviews([scrollView])
        scrollView.addSubview(stackView)
        
        addConstraints([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
        
        scrollView.addConstraints([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
        ])
    }
    
    private func reloadData()
    {
        stackView.subviews.forEach({$0.removeFromSuperview()})

        guard let views = views else {return}
        
        stackView.addArrangedSubviews(views)
    }
}
