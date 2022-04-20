//
//  LectureRow.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import SwiftUI

struct LectureRow: View {
    var lecture: Lecture
    
    var body: some View {
        HStack {
            Image(lecture.imageName ?? "")
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(6)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
            VStack(alignment: .leading) {
                HStack {
                    Text("Name:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text (lecture.name)
                        .font(.system(size: 16, weight: .bold))
                    }
                Spacer().frame(height:10)
                HStack {
                        Text("Date:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text(lecture.date, style: .date).font(.system(size:13))
                    }
                }
    }.padding(6)
}
}

struct LectureRow_Previews: PreviewProvider {
    static var previews: some View {
        LectureRow(lecture: Lecture(name: "Test", date: Date(), imageName: nil))
    }
}
