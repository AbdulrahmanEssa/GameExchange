//
//  TitleSwitchView.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 08/04/2021.
//

import UIKit


public protocol TitleSwitchViewDelegate : AnyObject {
    func titleSwitch(_ view: TitleSwitchView, didToggleSwitchTitled title: String?, isOn: Bool)
}

public class TitleSwitchView : TitleAccessoryView
{
    public var delegate: TitleSwitchViewDelegate?
    
    public var isOn : Bool = false{
        didSet{
            switchControl.isOn = isOn
        }
    }
    
    lazy var switchControl : UISwitch = {
        let sc = UISwitch()
        sc.translatesAutoresizingMaskIntoConstraints = false;
        sc.addTarget(self, action: #selector(toggle), for: .valueChanged)
        return sc
    }()
    
    override func setupLayout() {
        super.setupLayout()
        
        addSubview(switchControl)
        
        addConstraints([
            switchControl.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0),
            switchControl.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 10),
            switchControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            switchControl.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -0),
        ])
    }
    
    @objc
    func toggle()
    {
        delegate?.titleSwitch(self, didToggleSwitchTitled: title, isOn: switchControl.isOn)
    }
}

public class TitleSwitchTableViewCell : UITableViewCell {
    public static let id = "TitleSwitchTableViewCell"
}
