//
//  RealTimeDetailTableViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class RealTimeDetailTableViewController: UITableViewController, XMLParserDelegate {
    let bgImage = UIImage(named: "aerial_photograph_cloud_sea_sky_white_blue_okinawa_antomasako-626556")
    var url:String?
    var condition:String?
    var airline:String?
    var flightNum:String?
    
    
    let domesticpostsname : [String] = ["항공편명", "항공사", "출발도시", "도착도시", "출발시각", "도착시각", "운항시작기간", "운항종료기간", "일","월", "화", "수", "목","금","토"]
    let internationalpostsname : [String] = ["항공편명", "항공사", "기준공항", "목표공항", "예정시간", "출/입국상태", "운항시작기간", "운항종료기간", "일","월", "화", "수", "목","금","토"]
    
    
    var posts : [String] = ["", "", "", "", "", "", "", "", "","", "", "", "","",""]
    
    
    var parser = XMLParser()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    
    var domesticNum = NSMutableString()
    var airlineKorean = NSMutableString()
    var startcity = NSMutableString()
    var arrivalcity = NSMutableString()
    
    var StartTime = NSMutableString()
    var ArrivalTime = NSMutableString()
    var Stdate = NSMutableString()
    var Eddate = NSMutableString()
    
    
    var Sun = NSMutableString()
    var Mon = NSMutableString()
    var Tue = NSMutableString()
    var Wed = NSMutableString()
    var Thu = NSMutableString()
    var Fri = NSMutableString()
    var Sat = NSMutableString()
    
    var internationalNum = NSMutableString()
    var airport = NSMutableString()
    var city = NSMutableString()
    var internationalIoType = NSMutableString()
    var internationalTime = NSMutableString()
    
    func beginParsing(){
        posts = []
        
        if(airline == "국내")
        {
            url = "http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList?serviceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D"
            condition = ("&schFlightNum=" + flightNum!)
        }
        else if (airline == "국제")
        {
            url = "http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList?serviceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D"
            condition = ("&schFlightNum=" + flightNum!)
            
        }
        
        parser = XMLParser(contentsOf:(NSURL(string:(url! + condition!)))! as URL)!
        
        parser.delegate = self
        parser.parse()
        self.tableView.reloadData()
    }
    
    func parser(_ pasrser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String]){
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item"){
            elements = NSMutableDictionary()
            elements = [:]
            
            posts = ["", "", "", "", "", "", "", "", "","", "", "", "","",""]
            
            domesticNum = NSMutableString()
            airlineKorean = NSMutableString()
            startcity = NSMutableString()
            arrivalcity = NSMutableString()
            
            StartTime = NSMutableString()
            ArrivalTime = NSMutableString()
            Stdate = NSMutableString()
            Eddate = NSMutableString()
            
            Sun = NSMutableString()
            Mon = NSMutableString()
            Tue = NSMutableString()
            Wed = NSMutableString()
            Thu = NSMutableString()
            Fri = NSMutableString()
            Sat = NSMutableString()
            
            internationalNum = NSMutableString()
            airport = NSMutableString()
            city = NSMutableString()
            
            domesticNum = ""
            airlineKorean = ""
            startcity = ""
            arrivalcity = ""
            
            StartTime = ""
            ArrivalTime = ""
            Stdate = ""
            Eddate = ""
            
            Sun = ""
            Mon = ""
            Tue = ""
            Wed = ""
            Thu = ""
            Fri = ""
            Sat = ""
            
            internationalNum = ""
            airport = ""
            city = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String){
        if(airline == "국내")
        {
            if element.isEqual(to: "domesticNum"){
                domesticNum.append(string)
            }else if element.isEqual(to: "airlineKorean"){
                airlineKorean.append(string)
            }else if element.isEqual(to: "startcity"){
                startcity.append(string)
            }else if element.isEqual(to: "arrivalcity"){
                arrivalcity.append(string)
            }else if element.isEqual(to: "domesticStartTime"){
                StartTime.append(string)
            }else if element.isEqual(to: "domesticArrivalTime"){
                ArrivalTime.append(string)
            }else if element.isEqual(to: "domesticStdate"){
                Stdate.append(string)
            }else if element.isEqual(to: "domesticEddate"){
                Eddate.append(string)
            }else if element.isEqual(to: "domesticSun"){
                Sun.append(string)
            }else if element.isEqual(to: "domesticMon"){
                Mon.append(string)
            }else if element.isEqual(to: "domesticTue"){
                Tue.append(string)
            }else if element.isEqual(to: "domesticWed"){
                Wed.append(string)
            }else if element.isEqual(to: "domesticThu"){
                Thu.append(string)
            }else if element.isEqual(to: "domesticFri"){
                Fri.append(string)
            }else if element.isEqual(to: "domesticSat"){
                Sat.append(string)
            }
            
        }else if (airline == "국제")
        {
            
            if element.isEqual(to: "internationalNum"){
                internationalNum.append(string)
            }else if element.isEqual(to: "airlineKorean"){
                airlineKorean.append(string)
            }else if element.isEqual(to: "airport"){
                airport.append(string)
            }else if element.isEqual(to: "city"){
                city.append(string)
            }else if element.isEqual(to: "internationalTime"){
                StartTime.append(string)
            }else if element.isEqual(to: "internationalIoType"){
                ArrivalTime.append(string)
            }else if element.isEqual(to: "internationalStdate"){
                Stdate.append(string)
            }else if element.isEqual(to: "internationalEddate"){
                Eddate.append(string)
            }else if element.isEqual(to: "internationalSun"){
                Sun.append(string)
            }else if element.isEqual(to: "internationalMon"){
                Mon.append(string)
            }else if element.isEqual(to: "internationalTue"){
                Tue.append(string)
            }else if element.isEqual(to: "internationalWed"){
                Wed.append(string)
            }else if element.isEqual(to: "internationalThu"){
                Thu.append(string)
            }else if element.isEqual(to: "internationalFri"){
                Fri.append(string)
            }else if element.isEqual(to: "internationalSat"){
                Sat.append(string)
            }
            
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?,qualifiedName qName: String?){
        
        
        if (elementName as NSString).isEqual(to: "item"){
            
            if(airline == "국내")
            {
                if !domesticNum.isEqual(nil){
                    posts[0] = domesticNum as String
                }
                
                if !airlineKorean.isEqual(nil){
                    posts[1] = airlineKorean as String
                }
                
                if !startcity.isEqual(nil){
                    posts[2] = startcity as String
                }
                
                if !arrivalcity.isEqual(nil){
                    posts[3] = arrivalcity as String
                }
                
                if !StartTime.isEqual(nil){
                    posts[4] = StartTime as String
                }
                
                if !ArrivalTime.isEqual(nil){
                    posts[5] = ArrivalTime as String
                }
                
                if !Stdate.isEqual(nil){
                    posts[6] = Stdate as String
                }
                
                if !Eddate.isEqual(nil){
                    posts[7] = Eddate as String
                }
                
                if !Sun.isEqual(nil){
                    posts[8] = Sun as String
                }
                
                if !Mon.isEqual(nil){
                    posts[9] = Mon as String
                }
                
                if !Tue.isEqual(nil){
                    posts[10] = Tue as String
                }
                
                if !Wed.isEqual(nil){
                    posts[11] = Wed as String
                }
                
                if !Thu.isEqual(nil){
                    posts[12] = Thu as String
                }
                
                if !Fri.isEqual(nil){
                    posts[13] = Fri as String
                }
                
                if !Sat.isEqual(nil){
                    posts[14] = Sat as String
                }
            }else if(airline == "국제")
            {
                if !internationalNum.isEqual(nil){
                    posts[0] = internationalNum as String
                }
                
                if !airlineKorean.isEqual(nil){
                    posts[1] = airlineKorean as String
                }
                
                if !airport.isEqual(nil){
                    posts[2] = airport as String
                }
                
                if !city.isEqual(nil){
                    posts[3] = city as String
                }
                
                if !StartTime.isEqual(nil){
                    posts[4] = StartTime as String
                }
                
                if !ArrivalTime.isEqual(nil){
                    posts[5] = ArrivalTime as String
                }
                
                if !Stdate.isEqual(nil){
                    posts[6] = Stdate as String
                }
                
                if !Eddate.isEqual(nil){
                    posts[7] = Eddate as String
                }
                
                if !Sun.isEqual(nil){
                    posts[8] = Sun as String
                }
                
                if !Mon.isEqual(nil){
                    posts[9] = Mon as String
                }
                
                if !Tue.isEqual(nil){
                    posts[10] = Tue as String
                }
                
                if !Wed.isEqual(nil){
                    posts[11] = Wed as String
                }
                
                if !Thu.isEqual(nil){
                    posts[12] = Thu as String
                }
                
                if !Fri.isEqual(nil){
                    posts[13] = Fri as String
                }
                
                if !Sat.isEqual(nil){
                    posts[14] = Sat as String
                }
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: bgImage)
        
        beginParsing()
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

        if(airline == "국내") {
            cell.textLabel?.text = domesticpostsname[indexPath.row]
            
        } else if(airline == "국제") {
            cell.textLabel?.text = internationalpostsname[indexPath.row]
        }
        
        cell.detailTextLabel?.text = posts[indexPath.row]

        return cell
    }
}
