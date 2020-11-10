//
//  ViewController.swift
//  Currency
//
//  Created by Ouriel Bennathan on 16/10/2020.
//  Copyright © 2020 Ouriel Bennathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var CurrencyTableView: UITableView!
    var sum = "1,00"
    var countrieSelectedArray = [Change]()
    let AddCitySegueIdentifier = "AddCitySegueIdentifier"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrieSelectedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "currencyIdentifier", for: indexPath) as? TableViewCell{
            cell.configureCell(change: countrieSelectedArray[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 75
       }
    
    override func viewDidLoad(){
        title = "Currency"
        super.viewDidLoad()
        createCountrieSelectedArray()
    }
    func createCountrieSelectedArray() {
        if (countrieSelectedArray.count == 0){
            countrieSelectedArray.append(Change(image: UIImage(named: "IsraelFlag") ?? UIImage(),name: "Israel", currency: "₪", rate: "1,00", statut: true))
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == AddCitySegueIdentifier {
            if let viewController = segue.destination as?
                CityViewController {
                viewController.citySelectedArray = countrieSelectedArray
            }
        }
        
    }
    
}
extension ViewController : convertDelegate{
    func transferAmount (finalAmount :String){
        sum = finalAmount
    }
}
    
extension ViewController : transferArrayDelegate{
    func transferArray(array: [Change]) {
        countrieSelectedArray = array
    }
}
    
    
    
    





