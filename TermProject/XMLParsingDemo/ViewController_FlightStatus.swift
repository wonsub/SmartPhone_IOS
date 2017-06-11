//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 4. 24..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit

class ViewController_FlightStatus: UIViewController, XMLParserDelegate {
    
    var fromCity : String?
    var toCity : String?
    var airline: String?
    
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
    
    @IBOutlet weak var tbData: UITableView!
    
    @IBAction func cancelDownload(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "FlightInformation"{
            if let informationViewController = segue.destination as?
                ViewController_DomesticAirPlane{
                informationViewController.airline = "국제"
                informationViewController.flightNum = "7G9611"
                
                
                
                //posts[tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)]
                
                
                //data[indexPath.seletedRow]
                
                //posts.object(at: <#T##Int#>)
                //(\(posts.object(at: indexPath.row) as AnyObject).value(forKey:"airFln") as! NSString as String
                /*
                flightStatusViewController.fromCity = deptText.text!
                flightStatusViewController.toCity = arvText.text!
                flightStatusViewController.airline = airlineText.text!
                 */
                /*
                 if let statusViewController = segue.destination as? ViewController_FlightStatus{
                 statusViewController.data = Data(deptCity: "Test",arvCity: "arv")
                 //statusViewController.data
                 }*/
                
            }
        }
    }

    
    
    func beginParsing(){
        posts = []
        
        //parser = XMLParser(contentsOf:(NSURL(string:"http://images.apple.com/main/rss/hotnews/hotnews.rss"))! as URL)!
        parser = XMLParser(contentsOf:(NSURL(string:"http://openapi.airport.co.kr/service/rest/FlightStatusList/getFlightStatusList?serviceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&numOfRows=2000"))! as URL)!
        parser.delegate = self as XMLParserDelegate
        parser.parse()
        tbData!.reloadData()
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
        
        /*if element.isEqual(to: "title"){
            title1.append(string)
        }else if element.isEqual(to: ("author")){
            date.append(string)
        }*/
        
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
            if !airFln.isEqual(nil){
                elements.setObject(line, forKey: "line" as NSCopying)
            }
            if !airFln.isEqual(nil){
                elements.setObject(boardingKor, forKey: "boardingKor" as NSCopying)
            }
            if !airFln.isEqual(nil){
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
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return posts.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if(cell.isEqual(NSNull.self)){
            cell = Bundle.main.loadNibNamed("Cell", owner: self, options: nil)?[0] as! UITableViewCell;
        }
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
        
        
    
      
        //fromCity = nil
        //toCity = nil
        //airline = nil
        return cell as UITableViewCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCellValue = tableView.cellForRow(at: indexPath)! as UITableViewCell
     //   print(currentCellValue.textLabel!.text)
        NSLog((currentCellValue.textLabel!.text)!)
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

