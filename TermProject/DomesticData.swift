import UIKit
struct DomesticData{
    var schDate: String?
    var schDeptCityCode: String?
    var schArrvCityCode: String?
    var schFlightNum: String?
    
    init(schDate: String?, schDeptCityCode: String?, schArrvCityCode: String?, schFlightNum: String?){
        self.schDate = schDate
        self.schDeptCityCode = schDeptCityCode
        self.schArrvCityCode = schArrvCityCode
        self.schFlightNum = schFlightNum
    }
}
