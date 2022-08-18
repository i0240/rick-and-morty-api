//
//  SecondViewController.swift
//  Home work#12
//
//  Created by Mac on 07.01.2022.
//  Copyright © 2022 Mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var liveView: UIView!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var episodesView: UIImageView!
    
    var cat: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = cat?.name
        statusLabel.text = cat?.status
        speciesLabel.text = cat?.species
        origin.text = cat?.origin.name
        createdLabel.text = cat?.created
        if cat?.status == "Alive" {
            liveView.backgroundColor = .green
        }
        else if cat?.status == "Dead" {
            liveView.backgroundColor = .red
        }
        else {
            liveView.backgroundColor = .gray
        }
        
        if let url = URL(string: (cat?.image)!) {
            myImage.af_setImage(withURL: url)
        }
    }
}
