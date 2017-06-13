//
//  RealTimeViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class RealTimeViewController: UIViewController {
    @IBOutlet weak var startText: UITextField!
    @IBOutlet weak var deptText: UITextField!
    @IBOutlet weak var flightText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchSegue" {
            if let realTimeTableViewController = segue.destination as? RealTimeTableViewController {
                realTimeTableViewController.fromCity = startText.text
                realTimeTableViewController.toCity = deptText.text
                realTimeTableViewController.airline = flightText.text
            }
        }
    }
}
