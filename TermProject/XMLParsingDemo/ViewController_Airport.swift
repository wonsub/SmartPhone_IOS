//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 4. 24..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit

class ViewController_Airport: UIViewController, XMLParserDelegate {
    
    var pageNo = 1
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var cityCode = NSMutableString()
    var cityEnglish = NSMutableString()
    //var cityJapan = NSMutableString()
    var cityKorean = NSMutableString()
    
    

    var url = String()
    var serviceKey = "Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D"
    

    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var tbData: UITableView!
    @IBOutlet weak var SearchContent: UITextField!
    
    @IBAction func Search(_ sender: Any) {
        beginParsing()
    }
    @IBAction func pressPrevBtn(_ sender: Any) {
        pageNo -= 1
        pageManage()
        
    }
    @IBAction func pressNextBtn(_ sender: Any) {
        pageNo += 1
        pageManage()
    }
    
    
    func pageManage(){
        
        if(pageNo == 1){
            prevButton.isEnabled = false
            nextButton.isEnabled = true
        }
        else{
            prevButton.isEnabled = true
        }
        beginParsing()
   
    }
    
    func beginParsing(){
        
        posts = []
        
        url = "http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList?ServiceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&numOfRows=10&pageNo=" + String(pageNo)
        
        if(SearchContent.text != ""){
            url = "http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList?ServiceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&numOfRows=1000"
        }
        
        
        parser = XMLParser(contentsOf:(NSURL(string:url))! as URL)!
       
        /*
        http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList?ServiceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&numOfRows=10&pageNo=
         */
        
        
        parser.delegate = self as! XMLParserDelegate
        parser.parse()
        tbData!.reloadData()
    }
    
    func parser(_ pasrser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String]){
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item"){
            elements = NSMutableDictionary()
            elements = [:]
            cityCode = NSMutableString()
            cityCode = ""
            cityEnglish = NSMutableString()
            cityEnglish = ""
            /*
            cityJapan = NSMutableString()
            cityJapan = ""*/
            cityKorean = NSMutableString()
            cityKorean = ""
        }
    }
    
    func parser(_ parser: XMLParser!, foundCharacters string: String!){
        if element.isEqual(to: "cityCode"){
            cityCode.append(string)
        }
        if element.isEqual(to: ("cityEng")){
            cityEnglish.append(string)
        }/*
        if element.isEqual(to: ("cityJpn")){
            cityJapan.append(string)
        }*/
        if element.isEqual(to: ("cityKor")){
            cityKorean.append(string)
        }
        
    }
    
    func parser(_ parser: XMLParser!, didEndElement elementName: String!, namespaceURI: String!,qualifiedName qName: String!){
        if(elementName as NSString).isEqual(to: "item"){
            if !cityCode.isEqual(nil){
                elements.setObject(cityCode, forKey: "cityCode" as NSCopying)
            }
            if !cityEnglish.isEqual(nil){
                elements.setObject(cityEnglish, forKey: "cityEng" as NSCopying)
            }
            /*
            if !cityJapan.isEqual(nil){
                elements.setObject(cityJapan, forKey: "cityJpn" as NSCopying)
            }*/
            if !cityKorean.isEqual(nil){
                elements.setObject(cityKorean, forKey: "cityKor" as NSCopying)
            }
            
            let a = cityCode.range(of: SearchContent.text!)
            let b = cityEnglish.range(of: SearchContent.text!)
            let c = cityKorean.range(of: SearchContent.text!)
            
            
            if(( a.length > 0) || ( b.length > 0) || ( c.length > 0) || (SearchContent.text == "")){
                posts.add(elements)
            }
            
            
            
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
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"cityCode") as! NSString as String
        


        cell.detailTextLabel?.text = ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "cityEng") as! NSString as String) + " / " + ((posts.object (at: indexPath.row) as AnyObject).value(forKey: "cityKor") as! NSString as String)
        
        
        
        
        return cell as UITableViewCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageManage()
        
       // beginParsing()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

