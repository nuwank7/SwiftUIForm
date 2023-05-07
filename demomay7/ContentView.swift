//
//  ContentView.swift
//  demomay7
//
//  Created by Nuwan Kodagoda on 07/05/2023.
//


import SwiftUI

struct Student: Identifiable {
    var id = UUID()
    var name: String
    var mark: Double
}

struct ContentView: View {
    @State private var students: [Student] = []
    @State private var newName = ""
    @State private var newMark = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Add New Student")) {
                    TextField("Name", text: $newName)
                    TextField("Mark", text: $newMark)
                        .keyboardType(.decimalPad)
                }
                
                Button("Add Student") {
                    if let mark = Double(newMark) {
                        let student = Student(name: newName, mark: mark)
                        students.append(student)
                        newName = ""
                        newMark = ""
                    }
                }
                
                Section(header: Text("Students")) {
                    ForEach(students) { student in
                        HStack {
                            Text(student.name)
                            Spacer()
                            Text(String(format: "%.1f", student.mark))
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationBarTitle("Student Marks header")
        }
    }
    
    private func delete(at offsets: IndexSet) {
        students.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
    }
}
