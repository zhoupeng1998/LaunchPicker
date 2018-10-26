//
//  RestaurantsEntity+CoreDataProperties.swift
//  LunchPicker
//
//  Created by 周澎 on 1/17/16.
//  Copyright © 2016 ZP. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension RestaurantsEntity {

    @NSManaged var restaurant: String?
    @NSManaged var comment: String?

}
