//
//  WajihaButton.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public class WajihaButton : UIButton
{
    public lazy var defaultBackgroundColor : UIColor = colors.buttonBackground
    public lazy var highlightedBackgroundColor: UIColor = colors.buttonBackgroundTapped
    public lazy var defaultTextColor : UIColor = colors.buttonText
    public lazy var highlightedTextColor : UIColor = colors.buttonTextTapped
    public lazy var animated : Bool = false
    
    public override var isHighlighted: Bool {
        didSet{
            highlight()
        }
    }
    
    convenience init() {
        self.init(frame: .zero)
        
        layer.cornerRadius = 8
        titleLabel?.font = fonts.buttonTitle
        backgroundColor = colors.buttonBackground
    }
    
    private func highlight()
    {
        if (animated)
        {
            setTitleColor(defaultTextColor, for: .normal)
            setTitleColor(highlightedTextColor, for: .highlighted)
            
            UIView.animate(withDuration: 0.2,delay: 0.0, options: .allowUserInteraction) {
                let v = self
                v.backgroundColor = v.isHighlighted ? v.highlightedBackgroundColor : v.defaultBackgroundColor
            }
        }
    }
}
