//
//  GetLecturesListUseCase.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import Foundation

struct GetLecturesListUseCaseRequestValue {
    let filter: String
}

protocol GetLecturesListUseCase {
    func execute(requestValue: GetLecturesListUseCaseRequestValue, completion: @escaping ([Lecture]) -> Void)
}

final class DefaultGetLecturesListUseCase: GetLecturesListUseCase {
    let lecturesRepo: LecturesRepo
    
    init(lecturesRepo: LecturesRepo) {
        self.lecturesRepo = lecturesRepo
    }
    
    func execute(requestValue: GetLecturesListUseCaseRequestValue, completion: @escaping ([Lecture]) -> Void) {
        completion(lecturesRepo.getLecturesList(filter: requestValue.filter))
    }
}
