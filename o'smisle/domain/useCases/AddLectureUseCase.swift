//
//  AddLectureUseCase.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import Foundation

struct AddLectureUseCaseRequestValue {
    let lecture: Lecture
}

protocol AddLectureUseCase {
    func execute(requestValue: AddLectureUseCaseRequestValue, completion: @escaping () -> Void)
}

final class DefaultAddLectureUseCase: AddLectureUseCase {
    let lecturesRepo: LecturesRepo
    
    init(lecturesRepo: LecturesRepo) {
        self.lecturesRepo = lecturesRepo
    }
    
    func execute(requestValue: AddLectureUseCaseRequestValue, completion: @escaping () -> Void) {
        let lecture = Lecture(name: requestValue.lecture.name, date: requestValue.lecture.date, imageName: requestValue.lecture.imageName ?? "noImage")
        lecturesRepo.deleteLecture(lecture: requestValue.lecture)
        completion()
    }
}
