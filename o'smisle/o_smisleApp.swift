//
//  o_smisleApp.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 17.04.2022.
//

import SwiftUI

@main
struct o_smisleApp: App {
@Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContainerView()
        }
//        .onChange(of: scenePhase) { phase in
//            if phase == .background {
//                // TODO:
//            }
//        }
    }
}

//struct ContainerView: View {
//@State private var shouldShowMainView: Bool = false
//var body: some View { NavigationView {
//HStack {
//LoginView(isUserLoggedIn: $shouldShowMainView)
//NavigationLink(destination: ContentView(), isActive:
//$shouldShowMainView) { EmptyView()
//}
//} }
//} }
