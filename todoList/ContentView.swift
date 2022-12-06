//
//  ContentView.swift
//  todoList
//
//  Created by Rujin Devkota on 30/11/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    @EnvironmentObject var todocounter:TodoCounter
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Tasks.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])private var alltasks: FetchedResults<Tasks>
    
    @FetchRequest(entity: Projects.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)])private var projects: FetchedResults<Projects>
    
    @State private var showsheet: Bool = false
    
    @State private var showinfo: Bool = false

    
    private func deleteTasks(offsets:IndexSet){
        offsets.forEach{
            index in let project = projects[index]
            viewContext.delete(project)
            do{
                try viewContext.save()
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
    

    var body: some View {
        
        TabView {
            VStack (alignment: .leading){
                //welcome and task count
                HStack (){
                    
                    VStack {
                        Text("Hey Rujin,👋").font(.system(size: 20,weight: .bold)).padding(.bottom,1)
                        Text("You have 5 taks").font(.system(size: 13,weight: .light))
                    }
                    
                    Spacer()
                }
                .padding([.top, .leading], 22.0)
                
                Spacer().frame(height:45)
                
                //project slider title
                HStack{
                    Text(" projects,").font(.system(size: 16,weight: .bold)).padding(.leading, 16.0)
                    Spacer()
                    Text("see all").font(.system(size: 14)).padding(.trailing, 18.0).foregroundColor(Color.blue)
                    
                }
                VStack {
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                    ForEach(projects,id: \.self){
                                
                                project in GeometryReader{
                                    geometry in Button(action: {
                                        showinfo.toggle()
                                    }, label:{ProjectsView(title: project.title ?? "", type: project.language ?? "" ).rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX)-40)/10),axis: (x:0,y:10,z:0))
                                       
                                        
                                    }
                                    
                                    ).sheet(isPresented: $showinfo, content: {
                                        Moreinfo(titile: project.title ?? "", discription: project.discription ?? "", Img:project.language ?? "")
                                           
                                       })
                                }
                            }.onDelete(perform: deleteTasks).frame(width: 200,height: 180)
                        }
                        .padding(.top)
                      
                        //add project from home screen
                        
                        
                    }
                }.frame(height: 200)
                
                HStack {
                    Spacer()
                    ZStack {
                        Button(
                          action:
                                  {
                            showsheet.toggle()
                                  }
                      ,label:{
                          ZStack {
                           
                              Rectangle().fill(Color(red: 118/255, green: 215/255, blue: 196/255)).frame(width: 100,height: 30).clipShape(RoundedRectangle(cornerRadius: 20))
                              Image(systemName:"plus.square.fill.on.square.fill")
                          }
                            
                           
                      }
                        )
                        .sheet(isPresented: $showsheet, content: {
                         addProject()
                            
                        })
                    }
                    Spacer()
                }
                
                //task titile
                Text("Your tasks..").padding(.leading, 16.0).font(.system(size: 16,weight: .bold))
                
                HStack {
                    Spacer()
                    VStack{
                        ScrollView(.vertical,showsIndicators: false){
                            VStack {
                                Spacer()
                                ForEach(alltasks,id: \.self){
                                    
                                    ola in todoitem(title: ola.title ?? ""
                                                    , type: ola.type ?? "", urgency: ola.priority!,clicked: ola.completed)
                                    
                                }
                                Spacer()
                            }
                        }
                    }.padding().frame(width: 300,height: 300).background(Color(red:236/255, green: 240/255, blue: 241/255)).clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer()
                }
                
                Spacer()
                
                ZStack {
                    
                    
                }
                
            }.tabItem{
                Image(systemName: "house")
                Text("home")
            }
            
            //navigate to next page
            
           todoPage().tabItem{
                Image(systemName: "square.and.pencil.circle.fill")
                Text("Todo")
            }
           
        }
    }


   
}





