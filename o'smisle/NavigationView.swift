//
//  NavigationView.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 11.05.2022.
//

import SwiftUI

struct ContainerView: View {
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)
        NavigationLink(destination: ContentView(), isActive: $shouldShowMainView) { EmptyView()
        }
    }
            
        }
    }
    
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
}
