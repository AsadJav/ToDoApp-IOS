//
//  NewItemVIew.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top,30)
            Form{
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    
                //Button
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),message: Text("Please fill all the fields and Select the due date that is today or newer."))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
