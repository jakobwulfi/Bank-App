//
//  Account.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import Foundation
import SwiftUI

struct Account: Identifiable {
    let name: String
    let iban: String
    let kind: Kind
    private(set) var transactions: [Transaction]
    
    var id: String { iban }
    
    var balance: Int {
        /// balance er en sum af alle transaktioner
        var sum = transactions.map({$0.amount}).reduce(0, +)
        return sum
    }
    
    init(name: String, iban: String, kind: Kind) {
        self.name = name
        self.kind = kind
        self.iban = iban
        transactions = [ Transaction(
            amount: 200000,
            beneficiary: "Initial Balance",
            date: Date()) ]
    }
    
    mutating func add(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}

extension Account {
    enum Kind: String, CaseIterable, Identifiable {
        var id: String {self.rawValue}
        
        case checking
        case savings
        case investment
    }
}

extension String {
 var ibanFormat: String {
 var remaining = Substring(self)
 var chunks: [Substring] = []
 while !remaining.isEmpty {
 chunks.append(remaining.prefix(4))
 remaining = remaining.dropFirst(4)
 }
 return chunks.joined(separator: " ")
 }
}
/// anvendelse: account.iban.ibanFormat


struct TestData {
    static var accounts = [
        Account(name: "Opsparing", iban: String.generateIBAN(), kind: .savings),
        Account(name: "Tilgængelig", iban: String.generateIBAN(), kind: .checking)]
   
    //accounts[1].add(Transaction(amount: -700, beneficiary: "aconto", date: Date.now))
}
