//
//  LecturesRepoLocal.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import Foundation

final class LecturesRepoLocal: LecturesRepo {
    private static var lecturesList: [Lecture] = [
        Lecture(name:"1", date: Date.from(string: "01/10/2021"), imageName: "011"),
        Lecture(name:"2", date: Date.from(string: "01/10/2022"), imageName: "012"),
        Lecture(name:"3", date: Date.from(string: "01/10/2020"), imageName: "013"),
    ]

    func getLecturesList(filter: String) -> [Lecture] {
        return Self.lecturesList.filter { $0.name.contains(filter) || filter.isEmpty}
    }
    
    func createLecture(lecture: Lecture) {
        deleteLecture(lecture: lecture)
        
        Self.lecturesList.append(lecture)
    }

    func deleteLecture(lecture: Lecture) {
        Self.lecturesList.removeAll { $0.name == lecture.name && $0.date == $0.date }
    }
}

private extension Date {
    static func from(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.date(from:string) ?? Date()
    }
}
