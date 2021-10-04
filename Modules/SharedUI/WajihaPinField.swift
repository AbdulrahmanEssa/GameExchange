//
//  WajihaPinField.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public protocol WajihaPinFieldDelegate : AnyObject {
    func wajihaPinField(_ view: WajihaPinField, didReachMaxCharacters string: String)
    func wajihaPinField(didTap view: WajihaPinField)
}

public class WajihaPinField : UIView
{
    public struct Appearance {
        public init(font: UIFont? = nil, textColor: UIColor? = nil, backColor: UIColor? = nil, highlightedTextColor: UIColor? = nil, highlightedBackColor: UIColor? = nil, borderWidth: CGFloat? = nil, borderColor: CGColor? = nil, highlightedBorderColor: CGColor? = nil, cornerRadius: CGFloat? = nil) {
            self.font = font
            self.textColor = textColor
            self.backColor = backColor
            self.highlightedTextColor = highlightedTextColor
            self.highlightedBackColor = highlightedBackColor
            self.borderWidth = borderWidth
            self.borderColor = borderColor
            self.highlightedBorderColor = highlightedBorderColor
            self.cornerRadius = cornerRadius
        }
        
        public var font : UIFont?
        public var textColor: UIColor?
        public var backColor: UIColor?
        public var highlightedTextColor: UIColor?
        public var highlightedBackColor : UIColor?
        public var borderWidth: CGFloat?
        public var borderColor: CGColor?
        public var highlightedBorderColor: CGColor?
        public var cornerRadius: CGFloat?
    }
    
    public lazy var appearance : Appearance = .init(font: fonts.buttonTitle.withSize(100), textColor: colors.title, backColor: colors.background, highlightedTextColor: colors.primary, highlightedBackColor: colors.background, borderWidth: 2, borderColor: colors.separator.cgColor, highlightedBorderColor: colors.primary.cgColor, cornerRadius: 20)
    {
        didSet{
            reloadAppearance()
        }
    }
    
    public weak var delegate : WajihaPinFieldDelegate?
    
    public lazy var maxLength: Int = 4
    {
        didSet{
            reloadView()
        }
    }
    
    public lazy var cellSpacing : CGFloat = 10
    {
        didSet{
            stackView.spacing = cellSpacing
        }
    }
    
    public lazy var placeholder: String = "*"
    {
        didSet{
            reloadText()
        }
    }
    
    public lazy var text: String = ""
    {
        didSet{
            reloadText()
        }
    }
    
    private lazy var highlightedLabel : UILabel? = labels.first
    
    private var selected = false
    
    private var labels : [UILabel] = []
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.contentMode = .center
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    convenience init()
    {
        self.init(frame: .zero)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        addGestureRecognizer(tap)
        
        backgroundColor = colors.void
        
        setupLayout()
    }
    
    private func setupLayout()
    {
        addSubview(stackView)
        reloadView()
        
        addConstraints([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -0),
        ])
    }
    
    @objc
    func onTap()
    {
//        delegate?.wajihaPinField(didTap: self)
    }
    
    func reloadText()
    {
        let txt = String(text.prefix(maxLength))
        var i = 0
        
        for label in labels {
            
            label.text = (i < txt.count) ? String(txt[txt.index(txt.startIndex, offsetBy: i)]) : placeholder
            i += 1
        }
        
        if(txt.count < labels.count)
        {
            highlightedLabel = labels[txt.count]
        }
        else
        {
            highlightedLabel = nil
        }
        
        if txt.count == maxLength {
//            delegate?.wajihaPinField(self, didReachMaxCharacters: text)
        }
        
        reloadAppearance()
    }
    
    func reloadView()
    {
        // remove label views
        for label in labels{
            label.removeFromSuperview()
        }
        // remove label references
        labels = []
        
        // create new labels
        for _ in 1...maxLength
        {
            let label : UILabel = {
                let l = UILabel()
                l.text = placeholder
                l.font = appearance.font
                l.textColor = appearance.textColor
                l.textAlignment = .center
                l.adjustsFontSizeToFitWidth = true
                l.numberOfLines = 1
                l.minimumScaleFactor = 0.001
                l.clipsToBounds = true
                l.translatesAutoresizingMaskIntoConstraints = false
                return l
            }()
            stackView.addArrangedSubview(label)
            labels.append(label)
        }
        
        // populate labels
        reloadText()
    }
    
    
    
    func reloadAppearance()
    {
        for label in labels{
            label.textColor = appearance.textColor
            label.backgroundColor = appearance.backColor
            label.layer.borderColor = appearance.borderColor
            label.layer.borderWidth = appearance.borderWidth ?? 0
            label.layer.cornerRadius = appearance.cornerRadius ?? 0
            label.font = appearance.font
        }
        
        guard selected else {return}
        guard text.count < labels.count else {return}
        
        guard let hl = highlightedLabel else {return}
        
        hl.backgroundColor = appearance.highlightedBackColor
        hl.layer.borderColor = appearance.highlightedBorderColor
        hl.textColor = appearance.highlightedTextColor
    }
    
    public func playAnimation()
    {
        UIView.animate(withDuration: 0.2, delay: 0, options: []) {
            self.stackView.spacing = -10
        } completion: { (bool) in
            UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                self.stackView.spacing = 10
            }, completion: nil)
        }

    }
}

extension WajihaPinField : SelectableView
{
    public func isSelected() -> Bool {
        return selected
    }
    
    public func becomeSelected() {
        selected = true
        reloadAppearance()
    }
    
    public func becomeUnselected() {
        selected = false
        reloadAppearance()
    }
}
