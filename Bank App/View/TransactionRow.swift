//
//  TransactionRow.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(transaction.beneficiary)
                    .font(.headline).bold()
                Text(transaction.date, format: .dateTime)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack {
                Text(transaction.amount/100, format: .currency(code: "DKK"))
            }
        }
    }
}

#Preview {
    TransactionRow(transaction: Transaction(
        amount: 200000,
        beneficiary: "Initial Balance",
        date: Date()))
    .environment(StateController())
}
