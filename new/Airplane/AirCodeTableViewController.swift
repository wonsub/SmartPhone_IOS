//
//  AirCodeTableViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class AirCodeTableViewController: UITableViewController {
    var posts = NSMutableArray()
    let bgImage = UIImage(named: "aerial_photograph_cloud_sea_sky_white_blue_okinawa_antomasako-626556")

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(AirCodeTableViewController.reloadTable(_:)), name: NSNotification.Name(rawValue : "reloadTable"), object: nil)
        
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
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"cityCode") as! NSString as String
        
        cell.detailTextLabel?.text = ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "cityEng") as! NSString as String) + " / " + ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "cityKor") as! NSString as String)

        return cell
    }
    
    func reloadTable(_ notification : Notification) {
        posts = notification.userInfo?["posts"] as! NSMutableArray
        self.tableView.reloadData()
    }

}
