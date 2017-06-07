//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 4. 24..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit

class ViewController_DomesticAirPlane: UIViewController, XMLParserDelegate {
    
    //운항되는 항공기 조회 (구체적으로 언제하는지 x, 운항하는 기간o)
    //항공편 넘버를 알고 있으면 입력해서 조회 가능
    
    let postsname : [String] = ["항공편명", "항공사", "출발도시", "도착도시", "출발시각", "도착시각", "운항시작기간", "운항종료기간", "일","월", "화", "수", "목","금","토"]
    
    var posts : [String] = ["", "", "", "", "", "", "", "", "","", "", "", "","",""]
    
    
    var parser = XMLParser()
    //var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()

    
    var domesticNum = NSMutableString()
    var airlineKorean = NSMutableString()
    var startcity = NSMutableString()
    var arrivalcity = NSMutableString()
    var domesticStartTime = NSMutableString()
    var domesticArrivalTime = NSMutableString()
    var domesticStdate = NSMutableString()
    var domesticEddate = NSMutableString()
    
    
    var domesticSun = NSMutableString()
    var domesticMon = NSMutableString()
    var domesticTue = NSMutableString()
    var domesticWed = NSMutableString()
    var domesticThu = NSMutableString()
    var domesticFri = NSMutableString()
    var domesticSat = NSMutableString()
    
    //var numOfRows = NSMutableString()
    //var pageNo = NSMutableString()
    //var totalCount = NSMutableString()
    
    
    
    
    
    
    @IBOutlet weak var tbData: UITableView!
    
    func beginParsing(){
        posts = []
        
        
        
        parser = XMLParser(contentsOf:(NSURL(string:"http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList?serviceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&schFlightNum=KE1101"))! as URL)!
        
        
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
    }
    
    func parser(_ pasrser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String]){
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item"){
            elements = NSMutableDictionary()
            elements = [:]
            /*
             domesticNum = NSMutableString()
             domesticNum = ""
             workCont = NSMutableString()
             workCont = ""
             */
            posts = ["", "", "", "", "", "", "", "", "","", "", "", "","",""]
            
            domesticNum = NSMutableString()
            airlineKorean = NSMutableString()
            startcity = NSMutableString()
            arrivalcity = NSMutableString()
            domesticStartTime = NSMutableString()
            domesticArrivalTime = NSMutableString()
            domesticStdate = NSMutableString()
            domesticEddate = NSMutableString()
            
            domesticSun = NSMutableString()
            domesticMon = NSMutableString()
            domesticTue = NSMutableString()
            domesticWed = NSMutableString()
            domesticThu = NSMutableString()
            domesticFri = NSMutableString()
            domesticSat = NSMutableString()
            
            
            domesticNum = ""
            airlineKorean = ""
            startcity = ""
            arrivalcity = ""
            domesticStartTime = ""
            domesticArrivalTime = ""
            domesticStdate = ""
            domesticEddate = ""
            
            domesticSun = ""
            domesticMon = ""
            domesticTue = ""
            domesticWed = ""
            domesticThu = ""
            domesticFri = ""
            domesticSat = ""
        }
    }
    
    func parser(_ parser: XMLParser!, foundCharacters string: String!){
        if element.isEqual(to: "domesticNum"){
            
            domesticNum.append(string)
            
        }else if element.isEqual(to: "airlineKorean"){
            
            airlineKorean.append(string)
            
        }else if element.isEqual(to: "startcity"){
            
            startcity.append(string)
            
        }else if element.isEqual(to: "arrivalcity"){
            
            arrivalcity.append(string)
            
        }else if element.isEqual(to: "domesticStartTime"){
            
            domesticStartTime.append(string)
            
        }else if element.isEqual(to: "airlineKorean"){
            
            airlineKorean.append(string)
            
        }else if element.isEqual(to: "startcity"){
            
            startcity.append(string)
            
        }else if element.isEqual(to: "arrivalcity"){
            
            arrivalcity.append(string)
            
        }else if element.isEqual(to: "domesticStartTime"){
            
            domesticStartTime.append(string)
            
        }else if element.isEqual(to: "domesticArrivalTime"){
            
            domesticArrivalTime.append(string)
            
        }else if element.isEqual(to: "domesticStdate"){
            
            domesticStdate.append(string)
            
        }else if element.isEqual(to: "domesticEddate"){
            
            domesticEddate.append(string)
            
        }else if element.isEqual(to: "domesticSun"){
            
            domesticSun.append(string)
            
        }else if element.isEqual(to: "domesticMon"){
            
            domesticMon.append(string)
            
        }else if element.isEqual(to: "domesticTue"){
            
            domesticTue.append(string)
            
        }else if element.isEqual(to: "domesticWed"){
            
            domesticWed.append(string)
            
        }else if element.isEqual(to: "domesticThu"){
            
            domesticThu.append(string)
            
        }else if element.isEqual(to: "domesticFri"){
            
            domesticFri.append(string)
            
        }else if element.isEqual(to: "domesticSat"){
            
            domesticSat.append(string)
            
        }
        
    }
    
    func parser(_ parser: XMLParser!, didEndElement elementName: String!, namespaceURI: String!,qualifiedName qName: String!){
        
        
        if (elementName as NSString).isEqual(to: "item"){
            
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
            
            if !domesticStartTime.isEqual(nil){
                
                posts[4] = domesticStartTime as String
                
            }
            
            if !domesticArrivalTime.isEqual(nil){
                
                posts[5] = domesticArrivalTime as String
                
            }
            
            if !domesticStdate.isEqual(nil){
                
                posts[6] = domesticStdate as String
                
            }
            
            if !domesticEddate.isEqual(nil){
                
                posts[7] = domesticEddate as String
                
            }
            
            if !domesticSun.isEqual(nil){
                
                posts[8] = domesticSun as String
                
            }
            
            if !domesticMon.isEqual(nil){
                
                posts[9] = domesticMon as String
                
            }
            
            if !domesticTue.isEqual(nil){
                
                posts[10] = domesticTue as String
                
            }
            
            if !domesticWed.isEqual(nil){
                
                posts[11] = domesticWed as String
                
            }
            
            if !domesticThu.isEqual(nil){
                
                posts[12] = domesticThu as String
                
            }
            
            if !domesticFri.isEqual(nil){
                
                posts[13] = domesticFri as String
                
            }
            
            if !domesticSat.isEqual(nil){
                
                posts[14] = domesticSat as String
            }
            //posts.add(elements)
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if(cell.isEqual(NSNull)){
            cell = Bundle.main.loadNibNamed("Cell", owner: self, options: nil)?[0] as! UITableViewCell;
        }
        
        cell.textLabel?.text = postsname[indexPath.row]
        
        cell.detailTextLabel?.text = posts[indexPath.row]
        
        
        //cell.detailTextLabel?.text = (posts.object (at: indexPath.row) as AnyObject).value(forKey: "workCont") as! NSString as String
        
        return cell as UITableViewCell
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        beginParsing()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
