//
//  LecturesListView.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import SwiftUI

struct LecturesListView: View {
    @ObservedObject var lecturesViewModel: LecturesViewModel
    
    var body: some View {
    List {
        ForEach(lecturesViewModel.lectures, id: \.id) {
            LectureRow(lecture: $0)
        }
        .onDelete(perform: {
            lecturesViewModel.removeLectures(indexes: $0)
        })
    }
}
}

struct LecturesListView_Previews: PreviewProvider {
    static var previews: some View {
        LecturesListView(lecturesViewModel: LecturesViewModel())
    }
}
