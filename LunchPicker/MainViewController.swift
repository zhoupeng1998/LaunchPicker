//
//  MainViewController.swift
//  LunchPicker
//
//  Created by 周澎 on 1/17/16.
//  Copyright © 2016 ZP. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var ResultLabel: UILabel!
    var result = ""
    
    
    
    @IBAction func PickLunchButton(_ sender: AnyObject) {
        if DataManager.Data.Array.count == 0{
            self.result = "No Restaurants Found"
        } else if DataManager.Data.Array.count == 1{
            Random()
        } else {
            while self.result == self.ResultLabel.text {
                Random()
            }
        }
        /*
        let Queue = dispatch_queue_create("my_queue", nil)
        dispatch_async(Queue){
            self.ResultLabel.text = "Choosing..."
            print("choosing")
            NSThread.sleepForTimeInterval(1)
            dispatch_async(dispatch_get_main_queue()){
                self.ResultLabel.text = Restaurant.restaurant
                print("done")
            }
        }
        */
        self.ResultLabel.text = self.result
    }
    
    func Random () {
        let RandomIndex = arc4random_uniform(UInt32(DataManager.Data.Array.count))
        let Restaurant:RestaurantsEntity = DataManager.Data.Array[Int(RandomIndex)]
        self.result = Restaurant.restaurant!
    }
    
    override func viewDidLoad() {
        ResultLabel.text = ""
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
