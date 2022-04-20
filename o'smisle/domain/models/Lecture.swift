//
//  Lecture.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import Foundation

struct Lecture: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let name: String
    let date: Date
    let imageName: String?
}
