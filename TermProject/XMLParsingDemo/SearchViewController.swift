//
//  SearchViewController.swift
//  XMLParsingDemo
//
//  Created by KPUGAME on 2017. 6. 11..
//  Copyright © 2017년 WONSUB SHIN. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

   
    @IBOutlet weak var deptText:UITextField!
    @IBOutlet weak var arvText: UITextField!
    @IBOutlet weak var airlineText: UITextField!
    @IBAction func cancelDownload(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "FlightStatus"{
            if let flightStatusViewController = segue.destination as?
                ViewController_FlightStatus{
                
                
                flightStatusViewController.fromCity = deptText.text!
                flightStatusViewController.toCity = arvText.text!
                flightStatusViewController.airline = airlineText.text!
                
                
                /*
                if let statusViewController = segue.destination as? ViewController_FlightStatus{
                    statusViewController.data = Data(deptCity: "Test",arvCity: "arv")
                    //statusViewController.data
                }*/

        }
        /*if segue.identifier == "SavePlayerDetail"{
            player = Player(name: nameTextField.text!, game: game, rating: rating)
        }
        
        if segue.identifier == "PickGame"{
            if let gamePickerViewController = segue.destination as? GamePickerViewController{
                gamePickerViewController.selectedGame = game
            }
        }
        
        if segue.identifier == "PickStar"{
            if let starPickerViewController = segue.destination as? StarPickerViewController{
                starPickerViewController.rating = rating
            }*/
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
