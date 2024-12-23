//
//  AddAccountView.swift
//  Bank App
//
//  Created by dmu mac 31 on 13/09/2024.
//

import SwiftUI

struct AddAccountView: View {
    @Environment(StateController.self) private var controller: StateController
    
    @Binding var showAddAccount: Bool
    @State private var accountName = ""
    @State private var accountKind: Account.Kind = .checking
    
    //var onCreate: (Account) -> Void
    
    var body: some View {
        @Bindable var controller = controller
        NavigationStack {
            Form {
                Section(header: Text("Account Name").font(.headline)) {
                    TextField("Account name", text: $accountName)
                    Picker("Account Kind", selection: $accountKind) {
                        ForEach(Account.Kind.allCases) { kind in
                            Text(kind.rawValue)
                        }
                    }
                }
            }
            .navigationTitle("Create account")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        // Dismiss the sheet
                        showAddAccount = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create") {
                        controller.addAccount(named: accountName, withKind: accountKind)
                        showAddAccount = false // Dismiss after creation
                    }
                    .disabled(accountName.isEmpty) // Disable if name is empty
                }
            }
        }
        
    }
}

#Preview {
    AddAccountView(showAddAccount: .constant(true)).environment(StateController())
}
