//
//  StateController.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import Foundation

@Observable class StateController {
    var accounts: [Account] = TestData.accounts
    
    func addAccount(named name: String, withKind kind: Account.Kind) {
        let iban = String.generateIBAN()
        accounts.append(Account(name: name, iban: iban, kind: kind))
    }
    func addTransaction(withAmount amount: Int, beneficiary: String, to account: Account) {
        let transaction = Transaction(amount: amount, beneficiary: beneficiary, date: Date.now)
        let index = accounts.firstIndex(where: {$0.id == account.id })
        if let index {
            accounts[index].add(transaction)
        }
    }
}


// IBAN generator
extension String {
    static func generateIBAN() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let digits = "0123456789"
        return random(lenght: 2, from: letters)
        + random(lenght: 2, from: digits)
        + random(lenght: 4, from: letters)
        + random(lenght: 12, from: digits)
    }
    private static func random(lenght: Int,
                               from characters: String) -> String {
        String((0 ..< lenght)
            .map { _ in characters.randomElement()! })
    }
}
