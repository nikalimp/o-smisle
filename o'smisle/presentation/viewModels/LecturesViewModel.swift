//
//  LecturesViewModel.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import Foundation
import Combine

final class LecturesViewModel: ObservableObject {
    @Published var lectures: [Lecture] = []
    @Published var searched = ""
    @Published var addLectureScreenPresented = false

private var getLecturesUseCase: GetLecturesListUseCase{
    DefaultGetLecturesListUseCase(lecturesRepo: LecturesRepoLocal())
}

private var deleteLectureUseCase: DeleteLectureUseCase{
    DefaultDeleteLectureUseCase(lecturesRepo: LecturesRepoLocal())
}

private var addLectureUseCase: AddLectureUseCase{
    DefaultAddLectureUseCase(lecturesRepo: LecturesRepoLocal())
}

private var cancellable: AnyCancellable?

init() {
    cancellable = $searched.sink { [weak self] str in
    self?.loadData(filter:str)
    }
}

func addLecture(name: String, date: Date) {
    addLectureUseCase.execute(requestValue: AddLectureUseCaseRequestValue(lecture: Lecture(name: name, date: date, imageName: nil))) { [weak self] in
        guard let self = self else { return }
        self.loadData(filter: self.searched)
    }
}

func removeLectures(indexes: IndexSet) {
    indexes.forEach {
        deleteLectureUseCase.execute(requestValue: DeleteLectureUseCaseRequestValue(lecture: lectures.remove(at: $0))) {}
    }
}

private func loadData(filter: String = "") {
    getLecturesUseCase.execute(requestValue: GetLecturesListUseCaseRequestValue(filter: filter)) { [weak self] lectures in
        self?.lectures = lectures
    }
}
}
