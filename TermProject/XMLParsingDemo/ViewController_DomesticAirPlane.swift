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
    var url:String?
    var condition:String?
    var airline:String?
    var flightNum:String?
    
    
    let domesticpostsname : [String] = ["항공편명", "항공사", "출발도시", "도착도시", "출발시각", "도착시각", "운항시작기간", "운항종료기간", "일","월", "화", "수", "목","금","토"]
    let internationalpostsname : [String] = ["항공편명", "항공사", "기준공항", "목표공항", "예정시간", "출/입국상태", "운항시작기간", "운항종료기간", "일","월", "화", "수", "목","금","토"]
 
    
    var posts : [String] = ["", "", "", "", "", "", "", "", "","", "", "", "","",""]
    
    
    var parser = XMLParser()
    //var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()

    
    var domesticNum = NSMutableString()
    var airlineKorean = NSMutableString()
    var startcity = NSMutableString()
    var arrivalcity = NSMutableString()
    
    /*
    var domesticStartTime = NSMutableString()
    var domesticArrivalTime = NSMutableString()
    var domesticStdate = NSMutableString()
    var domesticEddate = NSMutableString()
 */
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
    /*
    var domesticSun = NSMutableString()
    var domesticMon = NSMutableString()
    var domesticTue = NSMutableString()
    var domesticWed = NSMutableString()
    var domesticThu = NSMutableString()
    var domesticFri = NSMutableString()
    var domesticSat = NSMutableString()
    */
    
    var internationalNum = NSMutableString()
    //var airlineKorean = NSMutableString()
    var airport = NSMutableString()
    var city = NSMutableString()
    var internationalIoType = NSMutableString()
    var internationalTime = NSMutableString()
    
    /*
    var internationalSun = NSMutableString()
    var internationalMon = NSMutableString()
    var internationalTue = NSMutableString()
    var internationalWed = NSMutableString()
    var internationalThu = NSMutableString()
    var internationalFri = NSMutableString()
    var internationalSat = NSMutableString()
 */
    //var numOfRows = NSMutableString()
    //var pageNo = NSMutableString()
    //var totalCount = NSMutableString()
    
    
    
    
    
    
    @IBOutlet weak var tbData: UITableView!
    
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
        /*
        parser = XMLParser(contentsOf:(NSURL(string:"http://openapi.airport.co.kr/service/rest/FlightScheduleList/getDflightScheduleList?serviceKey=Ky%2BwXkscu67T8fzT8JNNCSHphmixtovXBdUJq7mu6UpqCcZf7HLqA%2F8bjU%2FHijQ4Vi4zmtjF9Kp3LtjgUgHvTg%3D%3D&schFlightNum=KE1101"))! as URL)!
 */
        
        parser = XMLParser(contentsOf:(NSURL(string:(url! + condition!)))! as URL)!
        
        
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
            arrivalcity = NSMutableString()/*
            domesticStartTime = NSMutableString()
            domesticArrivalTime = NSMutableString()
            domesticStdate = NSMutableString()
            domesticEddate = NSMutableString()
            */
            
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
            /*
            domesticStartTime = ""
            domesticArrivalTime = ""
            domesticStdate = ""
            domesticEddate = ""
            */
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
    
    func parser(_ parser: XMLParser!, foundCharacters string: String!){
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
            }
            /*else if element.isEqual(to: "domesticStartTime"){
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
            }*/
            else if element.isEqual(to: "domesticStartTime"){
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
         }
         /*else if element.isEqual(to: "domesticStartTime"){
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
         }*/
         else if element.isEqual(to: "internationalTime"){
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
    
    func parser(_ parser: XMLParser!, didEndElement elementName: String!, namespaceURI: String!,qualifiedName qName: String!){
        
        
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
                /*
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
                 */
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
                /*
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
                 */
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
        if(airline == "국내")
        {
            cell.textLabel?.text = domesticpostsname[indexPath.row]
            
        }
        else if(airline == "국제")
        {
            cell.textLabel?.text = internationalpostsname[indexPath.row]
            
        }
        
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
    
    // MARK: - Table view data source
    

    
    
}
