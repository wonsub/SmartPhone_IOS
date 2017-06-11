//
//  Data.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 6. 11..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit
struct Data{
    var deptCity: String?   //출발도시
    var arvCity: String?    //도착도시
    var flnCode: String?  //항공편넘버
    var airLine: String? //항공사
    var rmk: String?    //현재상태

    init(deptCity: String?, arvCity: String?)
    {
        self.deptCity = deptCity
        self.arvCity = arvCity
    }
    
    init(deptCity: String?, arvCity: String?,flnCode: String?, airLine: String?)
    {
        self.deptCity = deptCity
        self.arvCity = arvCity
        self.flnCode = flnCode
        self.airLine = airLine
    }
    
    mutating func SetRmk(rmk:String)
    {
        self.rmk = rmk
    }
    
    func GetRmk() ->String?
    {
        return rmk
    }
}
