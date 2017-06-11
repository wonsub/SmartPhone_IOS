//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 4. 24..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit

class ViewController_InternationalAirPlane: UIViewController, XMLParserDelegate {
    
    //운항되는 항공기 조회 (구체적으로 언제하는지 x, 운항하는 기간o)
    //항공편 넘버를 알고 있으면 입력해서 조회 가능
    
    let postsname : [String] = ["항공편명", "항공사", "기준공항", "목표공항", "출입상태", "예정시간", "일","월", "화", "수", "목","금","토"]
    
    var posts : [String] = ["", "", "", "", "", "", "","", "", "", "","",""]
    
    var parser = XMLParser()
    //var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    

    
    var internationalNum = NSMutableString()
    var airlineKorean = NSMutableString()
    var airport = NSMutableString()
    var city = NSMutableString()
    var internationalIoType = NSMutableString()
    var internationalTime = NSMutableString()

    
    var internationalSun = NSMutableString()
    var internationalMon = NSMutableString()
    var internationalTue = NSMutableString()
    var internationalWed = NSMutableString()
    var internationalThu = NSMutableString()
    var internationalFri = NSMutableString()
    var internationalSat = NSMutableString()
    
    //var numOfRows = NSMutableString()
    //var pageNo = NSMutableString()
    //var totalCount = NSMutableString()
    
    
    

    @IBOutlet weak var tbData: UITableView!
    
    func beginParsing(){
        posts = []
        
        
        
        parser = XMLParser(contentsOf:(NSURL(string:"http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList?serviceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D"))! as URL)!
        
        
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
            posts = ["", "", "", "", "", "", "","", "", "", "","",""]
            
            
            internationalNum = NSMutableString()
            airlineKorean = NSMutableString()
            airport = NSMutableString()
            city = NSMutableString()
            internationalIoType = NSMutableString()
            internationalTime = NSMutableString()

            internationalSun = NSMutableString()
            internationalMon = NSMutableString()
            internationalTue = NSMutableString()
            internationalWed = NSMutableString()
            internationalThu = NSMutableString()
            internationalFri = NSMutableString()
            internationalSat = NSMutableString()
            
            
            internationalNum = ""
            airlineKorean = ""
            airport = ""
            city = ""
            internationalIoType = ""
            internationalTime = ""
            
            internationalSun = ""
            internationalMon = ""
            internationalTue = ""
            internationalWed = ""
            internationalThu = ""
            internationalFri = ""
            internationalSat = ""
        }
    }
    
    func parser(_ parser: XMLParser!, foundCharacters string: String!){
        if element.isEqual(to: "internationalNum"){
            
            internationalNum.append(string)
            
        }else if element.isEqual(to: "airlineKorean"){
            
            airlineKorean.append(string)
            
        }else if element.isEqual(to: "airport"){
            
            airport.append(string)
            
        }else if element.isEqual(to: "city"){
            
            city.append(string)
            
        }else if element.isEqual(to: "internationalIoType"){
            
            internationalIoType.append(string)
            
        }else if element.isEqual(to: "internationalTime"){
            
            internationalTime.append(string)
            
        }else if element.isEqual(to: "internationalSun"){
            
            internationalSun.append(string)
            
        }else if element.isEqual(to: "internationalMon"){
            
            internationalMon.append(string)
            
        }else if element.isEqual(to: "internationalTue"){
            
            internationalTue.append(string)
            
        }else if element.isEqual(to: "internationalWed"){
            
            internationalWed.append(string)
            
        }else if element.isEqual(to: "internationalThu"){
            
            internationalThu.append(string)
            
        }else if element.isEqual(to: "internationalFri"){
            
            internationalFri.append(string)
            
        }else if element.isEqual(to: "internationalSat"){
            
            internationalSat.append(string)
            
        }
        
    }


    
    func parser(_ parser: XMLParser!, didEndElement elementName: String!, namespaceURI: String!,qualifiedName qName: String!){
        
        
        if (elementName as NSString).isEqual(to: "item"){
            
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
            
            if !internationalIoType.isEqual(nil){
                
                posts[4] = internationalIoType as String
                
            }
            
            if !internationalTime.isEqual(nil){
                
                posts[5] = internationalTime as String
                
            }
            
            
            if !internationalMon.isEqual(nil){
                
                posts[6] = internationalSun as String
                
            }
            
            if !internationalTue.isEqual(nil){
                
                posts[7] = internationalMon as String
                
            }
            
            if !internationalWed.isEqual(nil){
                
                posts[8] = internationalTue as String
                
            }
            
            if !internationalThu.isEqual(nil){
                
                posts[9] = internationalWed as String
                
            }
            
            if !internationalFri.isEqual(nil){
                
                posts[10] = internationalThu as String
                
            }
            
            if !internationalSat.isEqual(nil){
                
                posts[11] = internationalFri as String
            }
            
            if !internationalMon.isEqual(nil){
                
                posts[12] = internationalSat as String
                
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

