//
//  addTodo.swift
//  todoList
//
//  Created by Rujin Devkota on 01/12/2022.
//

import SwiftUI

struct addTodo: View {
 
    @Binding var isShowing:Bool
   
    let ListofCatagories=["cooding","guitar","party","shopping","running","reading","other-2"]
    let Listofurgencies=["Low","Medium","High"]
    @State var categorry:String=""
    @State var CatBtnClicked:Bool=false
    @State var title:String=""
    @State var description:String=""
    @State var urgency:String=""
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    private func saveTodo(){
        do{
            let task = Tasks(context:viewContext)
            
            task.title = title
            task.priority = urgency
            task.date = Date()
            task.discription = description
            task.completed = false
            task.type =  categorry
            try viewContext.save()
            
        }catch{
                print(error.localizedDescription)
            }
    }
            
        
        
    
    
    var body: some View {
       
        VStack {
            if isShowing{
                
                VStack{
                    
                    HStack {
                        Text("Add todos").font(.system(size: 20,weight: .bold))
                        
                        Spacer()
                        Button(action: {
                            saveTodo()
                        }, label: {
                            Image(systemName:"paperplane").font(.system(size: 20)).frame(width: 60,height: 30).background(Color(red: 155/255, green: 89/255, blue: 182/255)).clipShape(RoundedRectangle(cornerRadius: 15)).foregroundColor(Color(red: 26/255, green: 188/255, blue: 152/255))
                        })
                        .padding(.trailing)
                        
                    }
                 
                    .padding([.top, .leading])
                    Spacer().frame(height: 30)
                    Text("Select categories,")
                    Spacer().frame(height: 20)
                    
                    
                      
                            HStack{
                              
                                ForEach(ListofCatagories,id: \.self){
                                    category in Button(action: {
                                        categorry=category
                                        CatBtnClicked=true
                                    }, label: {Image(category).resizable()
                                            .frame(width: 40, height: 40).background(Color(red: 208/255, green: 211/255, blue: 212/255)).clipShape(Circle()) .overlay(
                                                Circle().stroke( CatBtnClicked==true && categorry==category ? Color.blue: Color.white, lineWidth: 2))
                                    })
                                
                            }
                                
                            }.frame(maxWidth: .infinity,maxHeight:50 ).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(radius: 10)
                    Spacer().frame(height: 20)
                    ScrollView(.vertical,showsIndicators: false){
                        VStack{
                            HStack{
                                Text("Titile")
                               
                                Spacer()
                                
                            }
                            
                            .padding([.top, .leading])
                            TextField("title...\(categorry)",text:$title).padding(.horizontal, 2.0).textFieldStyle(.roundedBorder).shadow(radius: 5)
                            Spacer()
                            Spacer().frame(height: 15)
                            HStack {
                                Text("Description")
                                
                                Spacer()
                                Group{
                                    ForEach(Listofurgencies,id:\.self){
                                        urgencies in HStack {
                                          
                                          Button(action: {
                                              urgency=urgencies
                                          }, label: {
                                                
                                              Circle().fill(
                                                
                                urgencies=="Low" ? Color.green:
                                    urgencies=="Medium" ? Color.blue: Color.red
                                              
                                              ).frame(width: 12,height: 12).shadow(radius: 3).overlay(
                                                Circle().stroke(  urgency==urgencies ? Color.blue: Color.white, lineWidth: 2))
                                            })
                                            Text(urgencies).font(.system(size: 13))
                                        }
                                    }
                                }
                                
                            }.padding(.leading)
                            
                            TextField("   Description",text:$description,axis: .vertical).frame(width: 340,height: 150).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(radius: 5) .multilineTextAlignment(TextAlignment.center)
                            
                            
                        }.frame(maxWidth:.infinity,maxHeight: .infinity).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                  
                    
                    
                    Spacer()
                    
                }.frame(maxWidth: .infinity,maxHeight: 450 ).background(Color(red: 244/255, green: 246/255, blue: 247/255)).clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
    }
}

struct addTodo_Previews: PreviewProvider {
    static var previews: some View {
        todoPage()
    }
}
