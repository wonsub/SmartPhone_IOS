//
//  AirCodeViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class AirCodeViewController: UIViewController, XMLParserDelegate {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageManage()
    }
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var searchContent: UITextField!
    
    @IBAction func prevButton(_ sender: Any) {
        pageNo -= 1
        pageManage()
    }
    
    @IBAction func nextButton(_ sender: Any) {
        pageNo += 1
        pageManage()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        beginParsing()
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
        
        if(searchContent.text != ""){
            url = "http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList?ServiceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&numOfRows=1000"
        }
        
        
        parser = XMLParser(contentsOf:(NSURL(string:url))! as URL)!
        
        parser.delegate = self as XMLParserDelegate
        parser.parse()
        
        var userInfo : [String : NSMutableArray] = [:]
        
        userInfo["posts"] = posts
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue : "reloadTable"), object: nil, userInfo: userInfo)
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
    
    func parser(_ parser: XMLParser, foundCharacters string: String){
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
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?,qualifiedName qName: String?){
        if(elementName as NSString).isEqual(to: "item"){
            if !cityCode.isEqual(nil){
                elements.setObject(cityCode, forKey: "cityCode" as NSCopying)
            }
            if !cityEnglish.isEqual(nil){
                elements.setObject(cityEnglish, forKey: "cityEng" as NSCopying)
            }
            if !cityKorean.isEqual(nil){
                elements.setObject(cityKorean, forKey: "cityKor" as NSCopying)
            }
            
            let a = cityCode.range(of: searchContent.text!)
            let b = cityEnglish.range(of: searchContent.text!)
            let c = cityKorean.range(of: searchContent.text!)
            
            
            if(( a.length > 0) || ( b.length > 0) || ( c.length > 0) || (searchContent.text == "")){
                posts.add(elements)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
