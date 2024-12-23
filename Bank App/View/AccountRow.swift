//
//  AccountRow.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import SwiftUI

struct AccountRow: View {
    let account: Account
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(account.name)
                    .font(.title).bold()
                Group {
                    Text(account.kind.rawValue)
                    Text(account.iban.ibanFormat)
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            Spacer()
            VStack {
                Text(account.balance/100, format: .currency(code: "DKK"))
            }
        }
        //.padding()
    }
}

#Preview {
    AccountRow(account: TestData.accounts[0])
}
