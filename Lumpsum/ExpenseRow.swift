//
//  ExpenseRow.swift
//  Lumpsum
//
//  Created by Joel Clark on 10/16/20.
//

import SwiftUI

struct ExpenseRow: View {
    let expense: Expense!
    
    var body: some View {
        HStack {
            Text(expense.title!)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing, 16)
            
            Text(String(expense.cost))
                .frame(maxWidth: 60, alignment: .trailing)
        }
    }
}

//struct ExpenseRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpenseRow()
//    }
//}
