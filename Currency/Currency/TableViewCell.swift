//
//  TableViewCell.swift
//  Currency
//
//  Created by Ouriel Bennathan on 19/10/2020.
//  Copyright © 2020 Ouriel Bennathan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var flagCountrie: UIImageView!
    
    @IBOutlet weak var countrieName: UILabel!
    
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var flag2: UIImageView!
    
    @IBOutlet weak var countriesName2: UILabel!
    func configureCell(logo: UIImageView) {
//        logo.layer.frame = logo.layer.frame.insetBy(dx: 0, dy: 0)
//        logo.layer.borderColor = UIColor.black.cgColor
//        logo.layer.cornerRadius = logo.frame.height
//        logo.layer.masksToBounds = false
//        logo.clipsToBounds = true
//        logo.layer.borderWidth = 1
//        logo.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    func configureCell (change : Change){
        countrieName.text = change.name
        flagCountrie.image = change.image
        rateLabel.text = change.rate + change.currency
    }
    func configureCell2 (change : Change){
        countriesName2.text = change.name
        flag2.image = change.image
    }
    
}

