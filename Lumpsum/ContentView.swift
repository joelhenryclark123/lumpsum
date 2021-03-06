//
//  ContentView.swift
//  Lumpsum
//
//  Created by Joel Clark on 10/16/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: -
    @StateObject var lump: Lump = {
        let moc = PersistenceController.shared.container.viewContext
        
        guard let lumps = try? moc.fetch(Lump.fetchRequest()) as? [Lump] else {
            fatalError()
        }
        
        if let lump = lumps.first {
            return lump
        } else {
            let lump = Lump(context: moc)
            try? moc.save()
            return lump
        }
    }()
    
    @State var newExpenseTitle: String = ""
    @State var newExpenseAmount: Int = 0
    
    // MARK: -
    var body: some View {
        VStack {
            amountField
                .frame(height: 90)
            
            List {
                ForEach(lump.expenseArray, id: \.self) { expense in
                    ExpenseRow(expense: expense)
                }.onDelete(perform: deleteExpense(at:))
                
                expenseEnterRow
            }
            
            totalRow
                .frame(height: 60)
        }
    }
    
    // MARK: -
    var amountField: some View {
        TextField("Enter Value!", value: $lump.amount, formatter: NumberFormatter()) { (bool) in
            self.saveContext()
        } onCommit: {
            self.saveContext()
        }
        .padding()
        .font(.system(size: 64))
        .multilineTextAlignment(.center)
    }
    
    var expenseEnterRow: some View {
        HStack {
            TextField("New Expense", text: $newExpenseTitle) { (bool) in
                return
            } onCommit: {
                newExpenseHandler()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.trailing, 16)
            
            TextField("", value: $newExpenseAmount, formatter: NumberFormatter()) { (bool) in
                return
            } onCommit: {
                newExpenseHandler()
            }
            .frame(maxWidth: 60, alignment: .trailing)
            .multilineTextAlignment(.trailing)
        }
    }
    
    var totalRow: some View {
        HStack {
            Text("Remainder: ")
            Text(String(lump.remainder))
        }
    }
    
    // MARK: -
    func saveContext() {
        try? PersistenceController.shared.container.viewContext.save()
    }
    
    func newExpenseHandler() {
        if !newExpenseTitle.isEmpty && newExpenseAmount != 0 {
            let newExpense = Expense(context: PersistenceController.shared.container.viewContext, title: newExpenseTitle, cost: newExpenseAmount)
            
            lump.addToExpenses(newExpense)
            
            saveContext()
            
            newExpenseAmount = 0
            newExpenseTitle = ""
        }
    }
    
    func deleteExpense(at index: IndexSet) {
        let expense = lump.expenseArray[index.first!]
        lump.removeFromExpenses(expense)
        saveContext()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
