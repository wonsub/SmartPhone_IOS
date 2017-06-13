//
//  StatsDetailTableViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class StatsDetailTableViewController: UITableViewController, XMLParserDelegate {
    let bgImage = UIImage(named: "flight-1831329_1280")
    var parserURL : String = ""
    var dataStyle : String = ""
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var country = NSMutableString()
    var dataNum = NSMutableString()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: bgImage)

        beginParsing()
    }
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf:(URL(string: parserURL))!)!
        parser.delegate = self
        parser.parse()
        self.tableView.reloadData()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements = [:]
            country = NSMutableString()
            country = ""
            dataNum = NSMutableString()
            dataNum = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "country") {
            country.append(string)
        } else if dataStyle == "항공" {
            if element.isEqual(to: "flights") {
                dataNum.append(string)
            }
        } else if dataStyle == "여객" {
            if element.isEqual(to: "passenger") {
                dataNum.append(string)
            }
        } else if dataStyle == "화물" {
            if element.isEqual(to: "baggage") {
                dataNum.append(string)
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        if (elementName as NSString).isEqual(to: "item") {
            if !country.isEqual(nil) {
                elements.setObject(country, forKey: "country" as NSCopying)
            }
            if !dataNum.isEqual(nil) {
                switch dataStyle {
                case "항공":
                    elements.setObject(dataNum, forKey: "flights" as NSCopying)
                    break
                case "여객":
                    elements.setObject(dataNum, forKey: "passenger" as NSCopying)
                    break
                case "화물":
                    elements.setObject(dataNum, forKey: "baggage" as NSCopying)
                    break
                default:
                    break
                }
            }
            posts.add(elements)
        }
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

        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey : "country") as! NSString as String
        switch dataStyle {
        case "항공":
            cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey : "flights") as! NSString as String
            break
        case "여객":
            cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey : "passenger") as! NSString as String
            break
        case "화물":
            cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey : "baggage") as! NSString as String
            break
        default:
            break
        }

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
