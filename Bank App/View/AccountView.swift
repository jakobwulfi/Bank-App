//
//  AccountView.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import SwiftUI

struct AccountView: View {
    @Environment(StateController.self) private var controller: StateController
    @State private var showAddAccount = false
    //@State private var newAccount: Account?
    
    var body: some View {
        @Bindable var controller = controller
        
        NavigationStack {
            List {
                ForEach(controller.accounts) { account in
                    NavigationLink {
                        AccountDetailView(account: account)
                    } label: {
                        AccountRow(account: account)
                    }
                }
            }
            .navigationTitle("Accounts")
        }
        .sheet(isPresented: $showAddAccount, content: {
            AddAccountView(showAddAccount: $showAddAccount)
        })
        
        
        Button(action: {
            // Action to perform when button is tapped
            showAddAccount = true
        }) {
            Text("\(Image(systemName: "plus.circle.dashed")) Add account")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(14)
                .clipped()
        }
        
    }
}

#Preview {
    AccountView().environment(StateController())
}

/*
 NavigationStack {
     List{
         ForEach(displayedMovies, id: \.title){ movie in
             NavigationLink {
                 //DetailView(movie: $movies[index(for: movie)])
                 DetailView(movie: movie)
             } label: {
                 Row(movie: movie)
             }
         }
     }
 */
