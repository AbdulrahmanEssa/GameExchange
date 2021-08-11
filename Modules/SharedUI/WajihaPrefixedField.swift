//
//  WajihaPrefixedField.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public protocol WajihaPrefixedFieldDelegate : AnyObject {
    func WajihaPrefixedField(_ view: WajihaPrefixedField, didSend text: String)
}

public class WajihaPrefixedField : UIView
{
    public var prefixText: String = ""
    {
        didSet {
            prefixLabel.text = prefixText
        }
    }
    
    public var placeholder: String = ""
    {
        didSet{
            reloadData()
        }
    }
    
    public var text: String = ""
    {
        didSet {
            reloadData()
        }
    }
    
    public var valid: Bool = false
    {
        didSet{
            setIndicator(valid: valid)
        }
    }
    
    public var buttonText: String = "Send"
    {
        didSet{
            sendButton.setTitle(buttonText, for: .normal)
        }
    }
        
    public weak var delegate: WajihaPrefixedFieldDelegate?
    
    public var selected = false
    
    lazy var validationIndicator : UIView = {
        let v = UIView()
        v.backgroundColor = colors.warning
        v.layer.cornerRadius = 2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var prefixLabel : UILabel = {
        let l = UILabel()
        l.text = "+966"
        l.font = fonts.textField
        l.textColor = colors.subtitle
        l.numberOfLines = 1
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var separator : UIView = {
        let v = UIView()
        v.backgroundColor = colors.separator
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var fieldLabel : UILabel = {
        let l = UILabel()
        l.text = "536277660"
        l.font = fonts.textField
        l.textColor = colors.placeholder
        l.numberOfLines = 1
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var sendButton : WajihaButton = {
        let bb = WajihaButton()
        bb.setTitle("SEND", for: .normal)
        bb.backgroundColor = colors.primary
        bb.setTitleColor(colors.tertiary, for: .normal)
        bb.addTarget(self, action: #selector(send), for: .touchUpInside)
        bb.translatesAutoresizingMaskIntoConstraints = false
        return bb
    }()
    
    
    convenience init()
    {
        self.init(frame: .zero)
        
        backgroundColor = colors.void
        
        setupLayout()
    }
    
    func setupLayout()
    {
        addSubviews([validationIndicator, prefixLabel, separator, fieldLabel, sendButton])

        addConstraints([
            
            heightAnchor.constraint(equalToConstant: 56),
            
            validationIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            validationIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            validationIndicator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            validationIndicator.widthAnchor.constraint(equalToConstant: 5),
            
            prefixLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            prefixLabel.leadingAnchor.constraint(equalTo: validationIndicator.trailingAnchor, constant: 10),
            prefixLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            
            separator.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            separator.leadingAnchor.constraint(equalTo: prefixLabel.trailingAnchor, constant: 15),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            separator.widthAnchor.constraint(equalToConstant: 1),
            
            fieldLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            fieldLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 15),
            fieldLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
            
            sendButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0),
            sendButton.leadingAnchor.constraint(equalTo: fieldLabel.trailingAnchor, constant: 0),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            sendButton.heightAnchor.constraint(equalToConstant: 45),
            sendButton.widthAnchor.constraint(equalToConstant: 95),
        ])
        
        prefixLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        sendButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    @objc
    func send()
    {
        delegate?.WajihaPrefixedField(self, didSend: text)
    }
    
    func setIndicator(valid: Bool)
    {
        UIView.animate(withDuration: 0.35) {
            self.validationIndicator.backgroundColor = valid ? self.colors.valid : self.colors.warning
        }
    }
    
    func reloadData()
    {
                
        if(text == "")
        {
            fieldLabel.text = placeholder
            fieldLabel.textColor = colors.placeholder
        }
        else
        {
            fieldLabel.text = text
            fieldLabel.textColor = colors.title
        }
    }
}

extension WajihaPrefixedField : SelectableView
{
    public func isSelected() -> Bool {
        return selected
    }
    
    public func becomeSelected() {
        selected = true
    }
    
    public func becomeUnselected() {
        selected = false
    }
}
