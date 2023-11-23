//
//  ToDoListItemsView.swift
//  ToDoApp
//
//  Created by AALA mac on 20/11/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    //private let userId: String
    
    init(userId: String){
        //self.userId = userId
        self._items = FirestoreQuery(collectionPath: "Users/\(userId)/ToDo's")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        //NavigationView {
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.deleteItem(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button{
                    viewModel.showingNewItemView.toggle()
                }label:{
                Image(systemName: "plus")
            }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        //}
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "plrh7kcx79gbbEMe7ST3Q9kPjae2")
    }
}
