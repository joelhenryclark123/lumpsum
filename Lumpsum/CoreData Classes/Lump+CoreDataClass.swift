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
    
    public var remainder: Int {
        return Int(self.amount) - totalCosts
    }
    
    public var totalCosts: Int {
        var total: Int = 0
        expenseArray.forEach({ total += Int($0.cost) })
        return total
    }
}
