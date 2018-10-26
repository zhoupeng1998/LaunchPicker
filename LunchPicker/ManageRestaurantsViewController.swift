//
//  ManageRestaurantsViewController.swift
//  LunchPicker
//
//  Created by 周澎 on 1/17/16.
//  Copyright © 2016 ZP. All rights reserved.
//

import UIKit

class ManageRestaurantsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    @IBAction func ResetButton(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "Do you want to reset all data?", message: "All data will be deleted", preferredStyle: UIAlertControllerStyle.actionSheet)
        let resetAction = UIAlertAction(title: "Reset", style: UIAlertActionStyle.destructive){(ACTION) in
            DataManager.Data.deleteAll()
            self.tableView.reloadData()
        }
        alertController.addAction(resetAction)
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.Data.Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Restaurants")! as UITableViewCell
        let Items = DataManager.Data.ItemAtIndex((indexPath as NSIndexPath).row)
        cell.textLabel?.text = Items.restaurant
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        if editingStyle == .delete{
            DataManager.Data.removeItemAtIndex((indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
