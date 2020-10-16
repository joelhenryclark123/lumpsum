//
//  Lump+CoreDataClass.swift
//  Lumpsum
//
//  Created by Joel Clark on 10/16/20.
//
//

import Foundation
import CoreData

@objc(Lump)
public class Lump: NSManagedObject {
    public var expenseArray: [Expense] {
        let set = expenses as? Set<Expense> ?? []
        return set.sorted {
            $0.timestamp < $1.timestamp
        }
    }
}
