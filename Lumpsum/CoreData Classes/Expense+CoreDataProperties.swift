//
//  Expense+CoreDataProperties.swift
//  Lumpsum
//
//  Created by Joel Clark on 10/16/20.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var cost: Int16
    @NSManaged public var title: String?
    @NSManaged public var timestamp: Date
    @NSManaged public var lump: Lump?

}

extension Expense : Identifiable {

}
