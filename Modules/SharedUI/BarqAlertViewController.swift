//
//  WajihaAlertViewController.swift
//  SharedUI
//
//  Created by Abdulrahman Essa on 31/03/2021.
//

import UIKit

public protocol WajihaAlertViewControllerDelegate : AnyObject {
    func WajihaAlertView(_ controller : WajihaAlertViewController, didTapButtonWith title: String?)
    func WajihaAlertView(didTapOutsideAlertContainerOn controller : WajihaAlertViewController)
}

public class WajihaAlertViewController : UIViewController
{
    let ui = WajihaAlertView()
    
    public weak var delegate : WajihaAlertViewControllerDelegate?
    
    public override func loadView() {
        super.loadView()
        view = ui
        ui.delegate = self
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WajihaAlertViewController : WajihaAlertViewDelegate {
    public func WajihaAlert(_ view: WajihaAlertView, didTapButtonWith title: String?) {
        delegate?.WajihaAlertView(self, didTapButtonWith: title)
    }
    
    public func WajihaAlert(didTapOutsideAlertContainerOn view: WajihaAlertView) {
        delegate?.WajihaAlertView(didTapOutsideAlertContainerOn: self)
    }
}

public protocol WajihaAlertViewDelegate : AnyObject {
    func WajihaAlert(_ view : WajihaAlertView, didTapButtonWith title: String?)
    func WajihaAlert(didTapOutsideAlertContainerOn view : WajihaAlertView)
}

public class WajihaAlertView : UIView
{
    public struct Entity{
        let title: String?
        let subtitle: String?
        let leftButtonStyle: ButtonStyle
        /// set nil to remove button
        let leftButtonTitle: String?
        let rightButtonStyle: ButtonStyle
        /// set nil to remove button
        let rightButtonTitle: String?
        
        static let demo = Entity(title: "DELETE PAYMENT", subtitle: "Do you really want to delete this payment method?", leftButtonStyle: .danger, leftButtonTitle: "YES", rightButtonStyle: .normal, rightButtonTitle: "NO")
    }
    
    public enum ButtonStyle {
        case normal;
        case danger;
    }
    
    public var entity : Entity?{
        didSet{
            reloadData()
        }
    }
    
    public weak var delegate : WajihaAlertViewDelegate?
    
    lazy var alertContainer : UIView = {
        let v = UIView()
        v.backgroundColor = colors.background
        v.layer.cornerRadius = 16
        v.translatesAutoresizingMaskIntoConstraints = false;
        return v
    }()
    
    lazy var titleLabel : UILabel = {
        let l = UILabel()
        l.text = "END SHIFT"
        l.font = fonts.title
        l.textColor = colors.warning
        l.numberOfLines = 1
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var subtitleLabel : UILabel = {
        let l = UILabel()
        l.text = "You can not end the shift with an order assigned to you."
        l.font = fonts.subtitle
        l.textColor = colors.title
        l.numberOfLines = 0
        l.textAlignment = .left
        l.minimumScaleFactor = 1
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var leftButton : WajihaButton = {
        let bb = WajihaButton()
        bb.setTitle("Visit ApplePay", for: .normal)
        bb.setTitleColor(colors.contrast, for: .normal)
        bb.backgroundColor = colors.warning
        bb.titleLabel?.font = fonts.cardAnnotation
        bb.titleLabel?.textAlignment = .center
        bb.layer.cornerRadius = 8
        bb.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        bb.animated = false
        bb.addTarget(self, action: #selector(onTapButton(sender:)), for: .touchUpInside)
        bb.translatesAutoresizingMaskIntoConstraints = false
        return bb
    }()
    
    lazy var rightButton : WajihaButton = {
        let bb = WajihaButton()
        bb.setTitle("Dismiss", for: .normal)
        bb.setTitleColor(colors.contrast, for: .normal)
        bb.backgroundColor = colors.warning
        bb.titleLabel?.font = fonts.cardAnnotation
        bb.titleLabel?.textAlignment = .center
        bb.layer.cornerRadius = 8
        bb.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 10, bottom: 0, right: 10)
        bb.animated = false
        bb.addTarget(self, action: #selector(onTapButton(sender:)), for: .touchUpInside)
        bb.translatesAutoresizingMaskIntoConstraints = false
        return bb
    }()
    
    lazy var buttonsStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillProportionally
        sv.spacing = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.3)
        setupLayout()
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapOutOfContainer(sender:)))
        tap.delegate = self
        addGestureRecognizer(tap)
    }
    
    private func setupLayout()
    {
        addSubview(alertContainer)
        
        addConstraints([
            alertContainer.topAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            alertContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            alertContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            alertContainer.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            alertContainer.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            alertContainer.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
        ])
        
        buttonsStack.addArrangedSubviews([leftButton, rightButton])
        
        alertContainer.addSubviews([titleLabel, subtitleLabel, buttonsStack])
        
        alertContainer.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: alertContainer.topAnchor, constant: 25),
            titleLabel.leadingAnchor.constraint(equalTo: alertContainer.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: alertContainer.trailingAnchor, constant: -25),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -0),
            
            buttonsStack.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 25),
            buttonsStack.leadingAnchor.constraint(equalTo: alertContainer.leadingAnchor, constant: 25),
            buttonsStack.trailingAnchor.constraint(equalTo: alertContainer.trailingAnchor, constant: -25),
            buttonsStack.bottomAnchor.constraint(equalTo: alertContainer.bottomAnchor, constant: -25),
        ])
    }
    
    @objc func onTapButton(sender: WajihaButton)
    {
        delegate?.WajihaAlert(self, didTapButtonWith: sender.titleLabel?.text)
    }
    
    @objc
    func onTapOutOfContainer(sender: UIGestureRecognizer)
    {
        delegate?.WajihaAlert(didTapOutsideAlertContainerOn: self)
        print("out of bounds tap")
    }
    
    private func reloadData()
    {
        guard let e = entity else {return}
        
        titleLabel.text = e.title
        subtitleLabel.text = e.subtitle
        
        leftButton.setTitle(e.leftButtonTitle, for: .normal)
        rightButton.setTitle(e.rightButtonTitle, for: .normal)
        
        switch e.leftButtonStyle {
            case .normal:
                leftButton.backgroundColor = colors.tertiary
            case .danger:
                leftButton.backgroundColor = colors.warning
        }
        
        switch e.rightButtonStyle {
            case .normal:
                rightButton.backgroundColor = colors.tertiary
            case .danger:
                rightButton.backgroundColor = colors.warning
        }
    }
}


extension WajihaAlertView: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: alertContainer) == true {
            return false
        }
        return true
    }
}

// Access Points
public extension WajihaAlertViewController
{
}
