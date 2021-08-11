//
//  SliderView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 29/04/2021.
//

import UIKit

class SliderView: UIView
{
    lazy var container : UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false;
        return v
    }()
    
    lazy var slidedView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false;
        return v
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        addSubview(container)
        container.addSubview(slidedView)
        addConstraints([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            
            
        ])
    }
}
