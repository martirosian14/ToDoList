//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Mac User on 11/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var textFieldValue: String = ""
    //    zangvac
    @State var tasks:[(text: String, isChecked: Bool)]=[]
    
    //    state nra hamar a
    var body: some View {
        
        VStack {
            HStack{
                TextField(
                    "Write your task",
                    text: $textFieldValue
                )
                
                Button(action:addTask){
                    Text("Add text")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(90)
                }
            }.padding(20)
            //            List\LazyVStack
            //            2.displaying...
            List {
                ForEach(tasks.indices, id: \.self) { index in
                    HStack {
                        Toggle(isOn: $tasks[index].isChecked) {
                            Text(tasks[index].text)
                                .strikethrough(tasks[index].isChecked, color: .black)
                                .foregroundColor(tasks[index].isChecked ? .gray.opacity(0.5) : .red)
                        }
                        
                        Button(action: {
                            deleteTask(at: index)
                        }) {
                            Text("Delete")
                                .padding(20)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(120)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    func addTask() {
        guard !textFieldValue.isEmpty else { return }
        tasks.append((text: textFieldValue, isChecked: false))
        textFieldValue = ""
    }
    
    func deleteTask(at index: Int) {
        tasks.remove(at: index)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

