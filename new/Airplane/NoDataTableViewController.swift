//
//  NoDataTableViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class NoDataTableViewController: UITableViewController {
    let bgImage = UIImage(named: "flight-1831329_1280")

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: bgImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cargoSegue" {
            let controller = segue.destination as! StatsOptionViewController
            controller.dataStyle = "cargo"
        } else if segue.identifier == "flightSegue" {
            let controller = segue.destination as! StatsOptionViewController
            controller.dataStyle = "flight"
        } else if segue.identifier == "passengerSegue" {
            let controller = segue.destination as! StatsOptionViewController
            controller.dataStyle = "passenger"
        } else if segue.identifier == "dateSegue" {
            let controller = segue.destination as! StatsOptionViewController
            controller.dataStyle = "date"
        }
    }
}
