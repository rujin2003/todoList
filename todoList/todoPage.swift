//
//  todoPage.swift
//  todoList
//
//  Created by Rujin Devkota on 01/12/2022.
//

import SwiftUI


struct todoPage: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Tasks.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])private var alltasks: FetchedResults<Tasks>
    
    @State var clicked:Bool = false
    @State private var showinfo: Bool = false
    
    private func deleteTasks(offsets:IndexSet){
        offsets.forEach{
            index in let task = alltasks[index]
            viewContext.delete(task)
            do{
                try viewContext.save()
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
    
    @State var todoaddClicked:Bool = false
    
    var body: some View {
        
        ZStack{
            List{
                
                    ForEach(alltasks){

                        task in Button(action: {
                            showinfo.toggle()
                        }, label:{
                            maintodoitem(title: task.title ?? " ", type: task.type  ?? " ", urgency: task.priority!,clicked: $clicked).padding(.top, 20.0)
                        }).sheet(isPresented: $showinfo, content: {
                            Moreinfo(titile: task.title ?? "", discription: task.discription ?? "" , Img:task.type ?? "")
                               
                           })

                    }.onDelete(perform: deleteTasks)
                }

            
            
             VStack {
                Spacer()
                 
                 addTodo(isShowing:$todoaddClicked).shadow(radius: 10)
                }
                
            
            
            VStack{
                HStack {
                    Text("All Tasks,").font(.system(size: 25,weight: .bold)).padding(.leading,25)
                    
                    todoaddClicked == false ?       Button(action: {
                        todoaddClicked=true
                    }, label:{Image(systemName: "plus").padding()
                   .frame(width: 20,height: 20).background(Color(red: 41/255, green: 128/255, blue:185/255)).clipShape(Circle()).foregroundColor(Color.white)
                        Spacer().frame(width: 10)}) :
                    
                    Button(action: {
                        todoaddClicked=false
                    }, label:{Image(systemName: "delete.left").padding().frame(width: 20,height: 20).background(Color(red: 231/255, green: 76/255, blue:60/255)).clipShape(Circle()).foregroundColor(Color.white)
                        Spacer().frame(width: 10)})
                    Spacer()
                }
                .padding(.top, 25.0)
                Spacer()
                
           
                }
                HStack {
                    Spacer()
                   
                    
                }
                .padding(.bottom, 50.0)
                
                
            }
            
        }
        
    }


struct todoPage_Previews: PreviewProvider {
    static var previews: some View {
        todoPage()
    }
}
