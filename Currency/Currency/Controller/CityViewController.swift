//
//  CityViewController.swift
//  Currency
//
//  Created by Ouriel Bennathan on 29/10/2020.
//  Copyright © 2020 Ouriel Bennathan. All rights reserved.
//

import UIKit
protocol transferArrayDelegate {
    func transferArray(array :[Change])
}
class CityViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var citiesTableView: UITableView!
    var statu = false
    var countriesListArray = [Change]()
    var citySelectedArray = [Change]()
    var transferArrayDelegate : transferArrayDelegate!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesListArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "countriesList", for: indexPath) as? TableViewCell{
            cell.configureCell2(change: countriesListArray[indexPath.row])
            if(countriesListArray[indexPath.row].statut){
                cell.checkboxButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                countriesListArray[indexPath.row].statut = false
            }
            else {
                cell.checkboxButton.setImage(UIImage(systemName: "circle"), for: .normal)
                countriesListArray[indexPath.row].statut = true
                
            }
        return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createCountriesListArray()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mycell = tableView.cellForRow(at: indexPath) as! TableViewCell
        if(countriesListArray[indexPath.row].statut){
            mycell.checkboxButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            countriesListArray[indexPath.row].statut = false
            citySelectedArray.append(countriesListArray[indexPath.row])
        }
        else {
            if (citySelectedArray.count  > 1){
                mycell.checkboxButton.setImage(UIImage(systemName: "circle"), for: .normal)
                var i = getIndex(str: countriesListArray[indexPath.row].name)
                citySelectedArray.remove(at: i)
                countriesListArray[indexPath.row].statut = true
            }
        }
        //transferArrayDelegate.transferArray(array: citySelectedArray)
        
    }
    
    func createCountriesListArray() {
        countriesListArray.append(Change(image: UIImage(named: "IsraelFlag") ?? UIImage(),name: "Israel", currency: "₪", rate: "1,00", statut: true))
        countriesListArray.append(Change(image: UIImage(named: "franceFlag") ?? UIImage(),name: "France", currency: "€", rate: "1,00", statut: false))
        countriesListArray.append(Change(image: UIImage(named: "usFlag") ?? UIImage(),name: "United State", currency: "$", rate: "1,00", statut: false))
    }
    
    func getIndex(str :String)->Int{
        var counter = citySelectedArray.count
        for i in 0...counter {
            if (citySelectedArray[i].name == str){
                return i
            }
        }
        return 0
    }
    
    
    
}
