//
//  StatsTableViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class StatsTableViewController: UITableViewController {
    let bgImage = UIImage(named: "flight-1831329_1280")
    
    let post = ["항공", "여객", "화물"]
    let urlName = ["항공" : "NumberOfFlight", "여객" : "NumberOfPassenger", "화물" : "TonsOfCargo"]
    
    let url = "http://openapi.airport.kr/openapi/service/AviationStatsByCountry/getTotal"
    let key = "?serviceKey=HK%2FAjOVzmL%2BcwzaN%2BLp4GK%2FeAPo%2BSnXoEUyQdtJAoif3MSkh94fmqLGGx%2BrtKEVY%2F8gz2BudoufnWL7Q6jXnzg%3D%3D"

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: bgImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = post[indexPath.row]

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            let indexPath = self.tableView.indexPathForSelectedRow
            if let statsDetailViewController = segue.destination as? StatsDetailTableViewController {
                var parserURL = url + urlName[post[(indexPath?.row)!]]! + key
                if UserDefaults.standard.object(forKey: "dateFilter") != nil {
                    parserURL = parserURL + "&from_month=" + (UserDefaults.standard.object(forKey: "dateFilter") as! String) + "&to_month=" + (UserDefaults.standard.object(forKey: "dateFilter") as! String)
                } else {
                    parserURL = parserURL + "&from_month=201704&to_month=201704"
                }
                
                if UserDefaults.standard.object(forKey: "filter1") != nil {
                    parserURL += ("&periodicity=" + (UserDefaults.standard.object(forKey: "filter1") as! String))
                }
                
                if UserDefaults.standard.object(forKey: "filter2") != nil {
                    if post[(indexPath?.row)!] == "여객" {
                        parserURL += ("&passenger_type=" + (UserDefaults.standard.object(forKey: "filter2") as! String))
                    } else {
                        parserURL += ("&pax_cargo=" + (UserDefaults.standard.object(forKey: "filter2") as! String))
                    }
                }
                
                if UserDefaults.standard.object(forKey: "filter3") != nil && post[(indexPath?.row)!] == "화물" {
                    parserURL += ("&baggage_type=" + (UserDefaults.standard.object(forKey: "filter3") as! String))
                }
                
                statsDetailViewController.parserURL = parserURL
                statsDetailViewController.dataStyle = post[(indexPath?.row)!]
            }
        }
    }
}
