//
//  CreateLectureView.swift
//  o'smisle
//
//  Created by Никита Алимпиев on 19.04.2022.
//

import SwiftUI

struct CreateLectureView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: LecturesViewModel
    
    @State var name = ""
    @State var date = Date()
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Lecture")) {
                    TextField ("Name", text: $name)
                }
                DisclosureGroup("Date") {
                    DatePicker("", selection: $date).datePickerStyle(GraphicalDatePickerStyle())
                }
            }
            .navigationBarTitle("Add", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    },
                                    label: {
                                        Text("Cancel").foregroundColor(.red)
                                    }),
                                trailing:
                                    Button(action: {
                                        viewModel.addLecture(name: name, date: date)
                                        presentationMode.wrappedValue.dismiss()
                                    },
                                    label: {
                                        Text("Save")
                                    }).disabled(name.isEmpty)
            )
        }
    }
}

struct CreateLectureView_Previews: PreviewProvider {
    static var previews: some View {
        CreateLectureView(viewModel: LecturesViewModel())
    }
}
