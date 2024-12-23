//
//  AccountDetailView.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import SwiftUI

struct AccountDetailView: View {
    let account: Account
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(account.transactions.reversed()) { transaction in
                    TransactionRow(transaction: transaction)
                }
            }
            .navigationTitle(account.name)
        }
    }
}

#Preview {
    AccountDetailView(account: TestData.accounts[0])
}
