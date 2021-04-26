//
//  PlayerInfoViewController.swift
//  ProjectThree
//
//  Created by Kirk S. Baguley on 11/18/20.
//  Copyright © 2020 Kirk S. Baguley. All rights reserved.
//

import UIKit

class PlayerInfoViewController: UIViewController {
    
    @IBOutlet var fnameLabel: UILabel!
    @IBOutlet var lnameLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    @IBOutlet var heightftLabel: UILabel!
    @IBOutlet var heightinLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    
    var player: Player! {
        didSet {
            navigationItem.title = player.lname
        }
    }
    
    var store: PlayerStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fnameLabel.text = player.fname
        lnameLabel.text = player.lname
        positionLabel.text = player.position
        heightftLabel.text = "\(player.heightft ?? 6)"
        heightinLabel.text = "\(player.heightin ?? 7)"
        weightLabel.text = "\(player.weight ?? 220)"
    }
}
