//
//  ContentModifier.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import SwiftUI
import Foundation

struct ContentModifier: ViewModifier {
    @ObservedObject var viewModel: LecturesViewModel
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitle("Lectures")
            .navigationBarItems(trailing: Button(
                action: {
                    viewModel.addLectureScreenPresented.toggle()
                },
                label: {
                    Image(systemName: "plus").imageScale(.large)
                })
            )
            .fullScreenCover(isPresented: $viewModel.addLectureScreenPresented, content: {
                CreateLectureView(viewModel: viewModel)
            })
    }
}
