//
//  Transaction.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import Foundation

struct Transaction: Identifiable {
    var id = UUID()
    let amount: Int
    let beneficiary: String
    let date: Date
}

extension Date {
 var transactionFormat: String {
 let formatter = DateFormatter()
 formatter.dateStyle = .medium
 return formatter.string(from: self)
 }
}
// anvendelse: transaction.date.transactionFormat

