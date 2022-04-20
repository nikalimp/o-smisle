//
//  LecturesRepos.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import Foundation

protocol LecturesRepo {
    func getLecturesList(filter: String) -> [Lecture]
    func createLecture(lecture: Lecture)
    func deleteLecture(lecture: Lecture)
}
