//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 4. 24..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit

class ViewController_Korea: UIViewController, XMLParserDelegate {

    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var title1 = NSMutableString()
    var date = NSMutableString()
    
    var imageurl = NSMutableString()
    
    @IBOutlet weak var tbData: UITableView!
    
    func beginParsing(){
        posts = []
        
         //parser = XMLParser(contentsOf:(NSURL(string:"http://images.apple.com/main/rss/hotnews/hotnews.rss"))! as URL)!
        parser = XMLParser(contentsOf:(URL(string:"http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberCurrStateList?ServiceKey=sea100UMmw23Xycs33F1EQnumONR%2F9ElxBLzkilU9Yr1oT4TrCot8Y2p0jyuJP72x9rG9D8CN5yuEs6AS2sAiw%3D%3D"))!)!
        parser.delegate = self as! XMLParserDelegate
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
            
            imageurl = NSMutableString()
            imageurl = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String){
        if element.isEqual(to: "empNm"){
            title1.append(string)
        }else if element.isEqual(to: ("origNm")){
            date.append(string)
        }
        else if element.isEqual(to: ("jpgLink")){
            imageurl.append(string)
        }
    }
    
    func parser(_ parser: XMLParser!, didEndElement elementName: String!, namespaceURI: String!,qualifiedName qName: String!){
        if(elementName as NSString).isEqual(to: "item"){
            if !title1.isEqual(nil){
                elements.setObject(title1, forKey: "title" as NSCopying)
            }
            if !date.isEqual(nil){
                elements.setObject(date, forKey: "date" as NSCopying)
            }
            if !imageurl.isEqual(nil){
                elements.setObject(imageurl,forKey: "imageurl" as NSCopying)
            }
            posts.add(elements)
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
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"title") as! NSString as String
        cell.detailTextLabel?.text = (posts.object (at: indexPath.row) as AnyObject).value(forKey: "date") as! NSString as String
        
        if let url = URL(string: (posts.object(at: indexPath.row) as AnyObject).value(forKey: "imageurl") as! NSString as String){
            if let data = try? Data(contentsOf: url){
                cell.imageView!.image = UIImage(data: data)
            }
        }
        
        
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

