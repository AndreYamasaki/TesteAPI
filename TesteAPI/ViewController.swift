//
//  ViewController.swift
//  TesteAPI
//
//  Created by user191918 on 5/15/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var tableCountrie: UITableView!
    var countries = [Country] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableCountrie.dataSource = self
        let service = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        service.getCountryNameFrom(endPoint: "all")
        service.completionHandler { [weak self] (countries, status, message) in
            if status {
                guard let self = self else {return}
                guard let _countries = countries else {return}
                self.countries = _countries
                self.tableCountrie.reloadData()
            }
        }
    }
    
}
        
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "countryCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countryCell")
        }
        let country = countries[indexPath.row]
        cell?.textLabel?.text = (country.name ?? "") + " " + (country.countryCode ?? "")
        cell?.detailTextLabel?.text = country.capital ?? ""
        return cell!
    }
}
