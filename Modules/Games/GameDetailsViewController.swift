//
//  GameDetailsViewController.swift
//  Games
//
//  Created by Abdulrahman Essa on 17/08/2021.
//

import UIKit

public class GameDetailsViewController : UIViewController
{
    var ui = UIView()
    
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


class GameDetailsView : UIView
{
    struct Entity {
        
    }
    
    var entity: Entity? {
        didSet{
            reloadData()
        }
    }
    
    convenience init()
    {
        self.init(frame: .zero)
        
        setupLayout()
    }
    
    func setupLayout()
    {
        
    }
    
    func reloadData()
    {
        guard let e = entity else {return}
        
        
    }
}
