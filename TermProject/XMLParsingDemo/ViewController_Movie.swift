//
//  ViewController.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 4. 24..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit

class ViewController_Movie: UIViewController, XMLParserDelegate {
    
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var useTitle = NSMutableString()
    var workCont = NSMutableString()
    
    @IBOutlet weak var tbData: UITableView!
    
    func beginParsing(){
        posts = []
        
        
        parser = XMLParser(contentsOf:(NSURL(string:"http://open.kmrb.or.kr/openapi-data/service/MvResultService/mvResult?ServiceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&pageNo=1&numOfRows=10"))! as URL)!
        parser.delegate = self as! XMLParserDelegate
        parser.parse()
        tbData!.reloadData()
    }
    
    func parser(_ pasrser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String: String]){
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item"){
            elements = NSMutableDictionary()
            elements = [:]
            useTitle = NSMutableString()
            useTitle = ""
            workCont = NSMutableString()
            workCont = ""
        }
    }
    
    func parser(_ parser: XMLParser!, foundCharacters string: String!){
        if element.isEqual(to: "useTitle"){
            useTitle.append(string)
        }else if element.isEqual(to: ("workCont")){
            workCont.append(string)
        }
    }
    
    func parser(_ parser: XMLParser!, didEndElement elementName: String!, namespaceURI: String!,qualifiedName qName: String!){
        if(elementName as NSString).isEqual(to: "item"){
            if !useTitle.isEqual(nil){
                elements.setObject(useTitle, forKey: "mTitle" as NSCopying)
            }
            if !workCont.isEqual(nil){
                elements.setObject(workCont, forKey: "workCont" as NSCopying)
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
        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey:"mTitle") as! NSString as String
        cell.detailTextLabel?.text = (posts.object (at: indexPath.row) as AnyObject).value(forKey: "workCont") as! NSString as String
        
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

