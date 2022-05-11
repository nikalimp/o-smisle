//
//  ContentView.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 17.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {}
    
    @StateObject var viewModel = LecturesViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                LecturesSearchView(viewModel: viewModel)
                LecturesListView(lecturesViewModel: viewModel)
            }
            .modifier(ContentModifier(viewModel: viewModel))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
