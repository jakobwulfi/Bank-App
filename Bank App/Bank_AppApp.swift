//
//  Bank_AppApp.swift
//  Bank App
//
//  Created by dmu mac 31 on 11/09/2024.
//

import SwiftUI

@main
struct Bank_AppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(StateController())
        }
    }
}
