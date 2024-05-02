//
//  TabBar_ChartsSwiftUiApp.swift
//  TabBar&ChartsSwiftUi
//
//  Created by Devesh Pandey on 26/04/24.
//

import SwiftUI

@main
struct TabBar_ChartsSwiftUiApp: App {
    //@StateObject var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                //.environmentObject(viewModel)
        }
    }
}
