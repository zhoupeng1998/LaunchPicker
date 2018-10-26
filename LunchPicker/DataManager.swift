//
//  DataManager.swift
//  LunchPicker
//
//  Created by 周澎 on 1/17/16.
//  Copyright © 2016 ZP. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager{
    
    static let Data = DataManager()
    let context: NSManagedObjectContext!
    var Array = [RestaurantsEntity]()
    
    fileprivate init(){
        let appDelegate = UIApplication.shared.delegate as!  AppDelegate
        context = appDelegate.managedObjectContext
        fetchLists()
    }

    
    func ItemAtIndex (_ index:Int) ->RestaurantsEntity{
        return Array[index]
    }
    
    func fetchLists() {
        let fetchRequest = NSFetchRequest(entityName: "RestaurantsEntity")
        do {
            let results = try context.fetch(fetchRequest)
            Array = results as! [RestaurantsEntity]
        } catch let error as NSError{
            NSLog("\(error.localizedDescription)")
        }
    }
    
    func saveContext() {
        do{
            try context.save()
        } catch let error as NSError{
            NSLog("\(error.localizedDescription)")
        }
    }
    
    func addCard(_ name:String) {
        let Item = NSEntityDescription.insertNewObject(forEntityName: "RestaurantsEntity", into: context) as! RestaurantsEntity
        Item.restaurant = name
        Array.append(Item)
        saveContext()
    }
    
    func removeItemAtIndex(_ index:Int) {
        context.delete(ItemAtIndex(index))
        Array.remove(at: index)
        saveContext()
    }
    
    func deleteAll(){
        let fetchRequest = NSFetchRequest(entityName: "RestaurantsEntity")
        do {
            let results = try context.fetch(fetchRequest)
            for Object in results {
                let managedObjects:NSManagedObject = Object as! NSManagedObject
                context.delete(managedObjects)
            }
        } catch let error as NSError{
            NSLog("\(error.localizedDescription)")
        }
        Array.removeAll()
    }
    
}
