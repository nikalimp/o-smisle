//
//  DeleteLectureUseCase.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import Foundation

struct DeleteLectureUseCaseRequestValue {
    let lecture: Lecture
}

protocol DeleteLectureUseCase {
    func execute(requestValue: DeleteLectureUseCaseRequestValue, completion: @escaping () -> Void)
}

final class DefaultDeleteLectureUseCase: DeleteLectureUseCase {
    let lecturesRepo: LecturesRepo
    
    init(lecturesRepo: LecturesRepo) {
        self.lecturesRepo = lecturesRepo
    }
    
    func execute(requestValue: DeleteLectureUseCaseRequestValue, completion: @escaping () -> Void) {
        lecturesRepo.deleteLecture(lecture: requestValue.lecture)
        completion()
    }
}
