//
//  ContentView.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AccountView()
    }
}

#Preview {
    ContentView().environment(StateController())
}
