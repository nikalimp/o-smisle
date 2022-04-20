//
//  LecturesSearchView.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import SwiftUI

struct LecturesSearchView: View {
    @ObservedObject var viewModel: LecturesViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.secondary.opacity(0.8))
                .cornerRadius(8)
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.gray)
                TextField("Найти...", text: $viewModel.searched)
                    .keyboardType(.webSearch)
                    .foregroundColor(.white)
                
                if viewModel.searched != "" {
                    Button(action: {
                        viewModel.searched = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").foregroundColor(Color(.gray))
                    }
                }
            }
            .padding(.trailing, 8)
            .padding(.leading, 12)
        }.frame(height:38)
        .padding(.trailing, 16)
        .padding(.leading, 16)
        .animation(.easeInOut(duration: 0.2), value: 1)
    }
}

struct LecturesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LecturesSearchView(viewModel: LecturesViewModel())
    }
}
