//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 4. 24..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit

class ViewController_FlightStatus: UIViewController, XMLParserDelegate {
    
    //운항되는 항공기 조회 (구체적으로 언제하는지 x, 운항하는 기간o)
    //항공편 넘버를 알고 있으면 입력해서 조회 가능
    
    let postsname : [String] = ["항공편명", "항공사(영문)", "항공사(국문)", "기준공항코드","운항구간코드", "출발공항(영문)","출발공항(국문)","도착공항(영문)", "도착공항(영문)", "예정시간","변경시간", "게이트번호","출/도착코드","국내국제구분","항공편상태(영문)","항공편상태(국문)"]
    
    var posts : [String] = ["", "", "", "", "", "", "","", "", "", "","","","","",""]
    
    var parser = XMLParser()
    //var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    
    
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
    
    
    //var numOfRows = NSMutableString()
    //var pageNo = NSMutableString()
    //var totalCount = NSMutableString()
    
    
    
    
    @IBOutlet weak var tbData: UITableView!
    
    func beginParsing(){
        posts = []
        
        
        
        parser = XMLParser(contentsOf:(NSURL(string:"http://openapi.airport.co.kr/service/rest/FlightStatusList/getFlightStatusList?serviceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D"))! as URL)!
        
        
        parser.delegate = self as! XMLParserDelegate
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
            posts = ["", "", "", "", "", "", "","", "", "", "","","","","",""]
            
            
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
    
    func parser(_ parser: XMLParser!, foundCharacters string: String!){
        if element.isEqual(to: "airFln"){
            
            airFln.append(string)
            
        }else if element.isEqual(to: "airlineEnglish"){
            
            airlineEnglish.append(string)
            
        }else if element.isEqual(to: "airlineKorean"){
            
            airlineKorean.append(string)
            
        }else if element.isEqual(to: "airport"){
            
            airport.append(string)
            
        }else if element.isEqual(to: "city"){
            
            city.append(string)
            
        }else if element.isEqual(to: "boardingEng"){
            
            boardingEng.append(string)
            
        }else if element.isEqual(to: "boardingKor"){
            
            boardingKor.append(string)
            
        }else if element.isEqual(to: "arrivedEng"){
            
            arrivedEng.append(string)
            
        }else if element.isEqual(to: "arrivedKor"){
            
            arrivedKor.append(string)
            
        }else if element.isEqual(to: "std"){
            
            std.append(string)
            
        }else if element.isEqual(to: "etd"){
            
            etd.append(string)
            
        }else if element.isEqual(to: "gate"){
            
            gate.append(string)
            
        }else if element.isEqual(to: "io"){
            
            io.append(string)
            
        }else if element.isEqual(to: "line"){
            
            line.append(string)
            
        }else if element.isEqual(to: "rmkEng"){
            
            rmkEng.append(string)
            
        }else if element.isEqual(to: "rmkKor"){
            
            rmkKor.append(string)
            
        }
        
    }


    
    
    
    func parser(_ parser: XMLParser!, didEndElement elementName: String!, namespaceURI: String!,qualifiedName qName: String!){
        
        
        if (elementName as NSString).isEqual(to: "item"){
            
            if !airFln.isEqual(nil){
                
                posts[0] = airFln as String
                
            }
            
            if !airlineEnglish.isEqual(nil){
                
                posts[1] = airlineEnglish as String
                
            }
            
            if !airlineKorean.isEqual(nil){
                
                posts[2] = airlineKorean as String
                
            }
            
            if !airport.isEqual(nil){
                
                posts[3] = airport as String
                
            }
            
            if !city.isEqual(nil){
                
                posts[4] = city as String
                
            }
            
            if !boardingEng.isEqual(nil){
                
                posts[5] = boardingEng as String
                
            }
            
            
            if !boardingKor.isEqual(nil){
                
                posts[6] = boardingKor as String
                
            }
            
            if !arrivedEng.isEqual(nil){
                
                posts[7] = arrivedEng as String
                
            }
            
            if !arrivedKor.isEqual(nil){
                
                posts[8] = arrivedKor as String
                
            }
            
            if !std.isEqual(nil){
                
                posts[9] = std as String
                
            }
            
            if !etd.isEqual(nil){
                
                posts[10] = etd as String
                
            }
            
            if !gate.isEqual(nil){
                
                posts[11] = gate as String
            }
            
            if !io.isEqual(nil){
                
                posts[12] = io as String
                
            }
            if !line.isEqual(nil){
                
                posts[13] = line as String
                
            }
            if !rmkEng.isEqual(nil){
                
                posts[14] = rmkEng as String
                
            }
            if !rmkKor.isEqual(nil){
                
                posts[15] = rmkKor as String
                
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

