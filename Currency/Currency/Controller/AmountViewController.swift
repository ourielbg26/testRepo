//
//  AmountViewController.swift
//  Currency
//
//  Created by Ouriel Bennathan on 20/10/2020.
//  Copyright © 2020 Ouriel Bennathan. All rights reserved.
//

import UIKit
protocol convertDelegate {
    func transferAmount(finalAmount :String)
}
class AmountViewController: UIViewController {

    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet var button: [UIButton]!
    var finalNum : String = ""
    var num2 = ""
    var convertDelegate : convertDelegate!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePage()
    }
    func configurePage(){
        for button in button {
            button.layer.cornerRadius = 20
        }
    }

  
    
    @IBAction func convertButton(_ sender: Any) {
        //convertDelegate.transferAmount(finalAmount: finalNum)
        navigationController?.popViewController(animated: true)
    }

    @IBAction func numTapped(_ sender: UIButton) {
        let numTap = sender.title(for: .normal)
        num2 = (num2 + numTap!)
        spaceInNum()
        if ((numLabel.text?.count)! < 12){ numLabel.text = finalNum}
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        if ((numLabel.text?.count)! > 1) {
            num2 = String(num2.prefix(num2.count-1))
            spaceInNum()
            numLabel.text = finalNum
        }
        if ((numLabel.text?.count)! == 1){numLabel.text = "0"; num2 = ""}
    }
    
    func spaceInNum  (){
        var counter = 0
        var str2 = ""
        for i in String(num2.reversed()){
            if (counter == 3){str2 = str2 + " " + String(i); counter = 1}
            else {str2 = str2 + String(i); counter += 1}
            }
        finalNum = String(str2.reversed())
    }
}
