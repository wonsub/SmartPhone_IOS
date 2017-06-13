//
//  StatsOptionViewController.swift
//  Airplane
//
//  Created by kpu_game on 2017. 6. 13..
//  Copyright © 2017년 changyu.Lee. All rights reserved.
//

import UIKit

class StatsOptionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pilterPicker: UIPickerView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupOKButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!
    var dataStyle : String = ""
    
    let periodicityData = ["정기", "비정기", "전체"]
    let periodicityURLData = ["0", "1", ""]
    let cargoData = ["여객기", "화물기", "전체"]
    let cargoURLData = ["Y", "N", ""]
    let passengerData = ["유임승객", "무임승객", "환승승객", "전체"]
    let passengerURLData = ["0", "1", "2", ""]
    let baggageData = ["직화물", "환적화물", "우편물", "전체"]
    let baggageURLData = ["0", "1", "2", ""]
    let yearData = ["2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017"]
    let monthData = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]

    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = popupView.frame.width / 8
        popupView.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if dataStyle == "cargo" {
            return 3
        } else {
            return 2
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            if dataStyle == "date" {
                return yearData[row] + "년"
            } else {
                return periodicityData[row]
            }
        } else if component == 1 {
            if dataStyle == "passenger" {
                return passengerData[row]
            } else if dataStyle == "date" {
                return monthData[row] + "월"
            } else {
                return cargoData[row]
            }
        } else {
            return baggageData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            if dataStyle == "date" {
                return yearData.count
            } else {
                return periodicityData.count
            }
        } else if component == 1 {
            if dataStyle == "passenger" {
                return passengerData.count
            } else if dataStyle == "date" {
                return monthData.count
            } else {
                return cargoData.count
            }
        } else {
            return baggageData.count
        }
    }

    @IBAction func selectFilter(_ sender: Any) {
        if dataStyle == "date" {
            var dateStr = yearData[pilterPicker.selectedRow(inComponent: 0)]
            if pilterPicker.selectedRow(inComponent: 1) < 9 {
                dateStr += ("0" + monthData[pilterPicker.selectedRow(inComponent: 1)])
            } else {
                dateStr += monthData[pilterPicker.selectedRow(inComponent: 1)]
            }
            UserDefaults.standard.set(dateStr, forKey: "dateFilter")
        } else {
            UserDefaults.standard.set(periodicityURLData[pilterPicker.selectedRow(inComponent: 0)], forKey: "filter1")
            
            if dataStyle == "passenger" {
                UserDefaults.standard.set(passengerURLData[pilterPicker.selectedRow(inComponent: 1)], forKey: "filter2")
            } else {
                UserDefaults.standard.set(cargoURLData[pilterPicker.selectedRow(inComponent: 1)], forKey: "filter2")
            }
            
            if dataStyle == "cargo" {
                UserDefaults.standard.set(baggageURLData[pilterPicker.selectedRow(inComponent: 2)], forKey: "filter3")
            }
        }
        
        popupView.isHidden = false
        popupOKButton.isEnabled = true
        selectButton.isEnabled = false
    }
    
    @IBAction func popupOK(_ sender: Any) {
        popupView.isHidden = true
        popupOKButton.isEnabled = false
        selectButton.isEnabled = true
    }
}
