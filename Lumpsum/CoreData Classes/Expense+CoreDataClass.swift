//
//  Expense+CoreDataClass.swift
//  Lumpsum
//
//  Created by Joel Clark on 10/16/20.
//
//

import Foundation
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    convenience init(context: NSManagedObjectContext, title: String, cost: Int) {
        self.init(context: context)
        self.title = title
        self.cost = Int16(cost)
        self.timestamp = Date()
    }
}
