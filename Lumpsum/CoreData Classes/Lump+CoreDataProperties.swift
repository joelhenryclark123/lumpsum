//
//  Lump+CoreDataProperties.swift
//  Lumpsum
//
//  Created by Joel Clark on 10/16/20.
//
//

import Foundation
import CoreData


extension Lump {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lump> {
        return NSFetchRequest<Lump>(entityName: "Lump")
    }

    @NSManaged public var amount: Int64
    @NSManaged public var expenses: NSSet?

}

// MARK: Generated accessors for expenses
extension Lump {

    @objc(addExpensesObject:)
    @NSManaged public func addToExpenses(_ value: Expense)

    @objc(removeExpensesObject:)
    @NSManaged public func removeFromExpenses(_ value: Expense)

    @objc(addExpenses:)
    @NSManaged public func addToExpenses(_ values: NSSet)

    @objc(removeExpenses:)
    @NSManaged public func removeFromExpenses(_ values: NSSet)

}

extension Lump : Identifiable {

}
