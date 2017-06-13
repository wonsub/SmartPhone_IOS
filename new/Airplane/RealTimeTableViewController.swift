//
//  RealTimeTableViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class RealTimeTableViewController: UITableViewController, XMLParserDelegate {
    let bgImage = UIImage(named: "aerial_photograph_cloud_sea_sky_white_blue_okinawa_antomasako-626556")
    var fromCity : String? = ""
    var toCity : String? = ""
    var airline: String? = ""
    
    var selectedRowIndex: Int?
    //var data = Data?
    
    let postsname : [String] = ["항공편명", "항공사(영문)", "항공사(국문)", "기준공항코드","운항구간코드", "출발공항(영문)","출발공항(국문)","도착공항(영문)", "도착공항(영문)", "예정시간","변경시간", "게이트번호","출/도착코드","국내국제구분","항공편상태(영문)","항공편상태(국문)"]
    
    
    
    //var numOfRows = NSMutableString()
    //var pageNo = NSMutableString()
    //var totalCount = NSMutableString()
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var title1 = NSMutableString()
    var date = NSMutableString()
    
    
    var airFln = NSMutableString()
    var airlineEnglish = NSMutableString()
    var airlineKorean = NSMutableString()
    var airport = NSMutableString()
    var city = NSMutableString()
    var boardingEng = NSMutableString()
    var boardingKor = NSMutableString()
    var arrivedEng = NSMutableString()
    var arrivedKor = NSMutableString()
    var std = NSMutableString()
    var etd = NSMutableString()
    
    var gate = NSMutableString()
    var io = NSMutableString()
    var line = NSMutableString()
    var rmkEng = NSMutableString()
    var rmkKor = NSMutableString()

    override func viewDidLoad() {
        super.viewDidLoad()

        beginParsing()
    }
    
    func beginParsing(){
        posts = []
        
        parser = XMLParser(contentsOf:(NSURL(string:"http://openapi.airport.co.kr/service/rest/FlightStatusList/getFlightStatusList?serviceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&numOfRows=2000"))! as URL)!
        parser.delegate = self as XMLParserDelegate
        parser.parse()
        self.tableView.reloadData()
        
        tableView.backgroundView = UIImageView(image: bgImage)
    }
    
    func parser(_ pasrser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String]){
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item"){
            elements = NSMutableDictionary()
            elements = [:]
            title1 = NSMutableString()
            title1 = ""
            date = NSMutableString()
            date = ""
            
            airFln = NSMutableString()
            airlineEnglish = NSMutableString()
            airlineKorean = NSMutableString()
            airport = NSMutableString()
            city = NSMutableString()
            boardingEng = NSMutableString()
            boardingKor = NSMutableString()
            arrivedEng = NSMutableString()
            arrivedKor = NSMutableString()
            std = NSMutableString()
            etd = NSMutableString()
            
            gate = NSMutableString()
            io = NSMutableString()
            line = NSMutableString()
            rmkEng = NSMutableString()
            rmkKor = NSMutableString()
            
            airFln = ""
            airlineEnglish = ""
            airlineKorean = ""
            airport = ""
            city = ""
            boardingEng = ""
            boardingKor = ""
            arrivedEng = ""
            arrivedKor = ""
            std = ""
            etd = ""
            
            gate = ""
            io = ""
            line = ""
            rmkEng = ""
            rmkKor = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String){
        if element.isEqual(to: "airlineKorean"){
            airlineKorean.append(string)
        }else if element.isEqual(to: "airFln"){
            airFln.append(string)
        }else if element.isEqual(to: "line"){
            line.append(string)
        }else if element.isEqual(to: "boardingKor"){
            boardingKor.append(string)
        }else if element.isEqual(to: "arrivedKor"){
            arrivedKor.append(string)
        }else if element.isEqual(to: "rmkKor"){
            rmkKor.append(string)
        }else if element.isEqual(to: "std"){
            std.append(string)
        }else if element.isEqual(to: "etd"){
            etd.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?,qualifiedName qName: String?){
        if(elementName as NSString).isEqual(to: "item"){
            if !airlineKorean.isEqual(nil) {
                elements.setObject(airlineKorean, forKey: "airlineKorean" as NSCopying)
            }
            if !airFln.isEqual(nil){
                elements.setObject(airFln, forKey: "airFln" as NSCopying)
            }
            if !line.isEqual(nil){
                elements.setObject(line, forKey: "line" as NSCopying)
            }
            if !boardingKor.isEqual(nil){
                elements.setObject(boardingKor, forKey: "boardingKor" as NSCopying)
            }
            if !arrivedKor.isEqual(nil){
                elements.setObject(arrivedKor, forKey: "arrivedKor" as NSCopying)
            }
            
            
            if !rmkKor.isEqual(nil){
                elements.setObject(rmkKor, forKey: "rmkKor" as NSCopying)
            }
            
            if !std.isEqual(nil){
                elements.setObject(std, forKey: "std" as NSCopying)
            }
            if !etd.isEqual(nil){
                elements.setObject(etd, forKey: "etd" as NSCopying)
            }
            
            
            
            if (((airline != "") && (airlineKorean as String).range(of: airline!) != nil) || airline == "")
            {
                if (((fromCity != "") && (boardingKor as String).range(of: fromCity!) != nil) || fromCity == "")
                {
                    if (((toCity != "") && (arrivedKor as String).range(of: toCity!) != nil) || toCity == "")
                    {
                        posts.add(elements)
                    }
                }
                
            }
            
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
        
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"airFln") as! NSString as String
        cell.detailTextLabel?.text = (
            (posts.object (at: indexPath.row) as AnyObject).value(forKey: "airlineKorean") as! NSString as String)
            + " | " +
            ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "line") as! NSString as String)
            + " / " +
            ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "boardingKor") as! NSString as String)
            + " -> " +
            ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "arrivedKor") as! NSString as String)
            + "(" +
            ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "etd") as! NSString as String) +
            ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "rmkKor") as! NSString as String) +
        ")"

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            let indexPath = self.tableView.indexPathForSelectedRow
            if let realTimeDetailTableViewController = segue.destination as? RealTimeDetailTableViewController {
                realTimeDetailTableViewController.flightNum = (posts.object(at: (indexPath?.row)!) as AnyObject).value(forKey:"airFln") as! NSString as String
                realTimeDetailTableViewController.airline = (posts.object (at: (indexPath?.row)!) as AnyObject).value(forKey: "line") as! NSString as String
            }
        }
    }

}
