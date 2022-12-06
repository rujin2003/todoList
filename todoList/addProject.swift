//
//  addProject.swift
//  todoList
//
//  Created by Rujin Devkota on 04/12/2022.
//

import SwiftUI

struct addProject: View {
  var
    ListofCatagories=["flutter","cooding","swiftui","java","python"]
    @State var title:String=""
    @State var description:String = ""
    @State var categorry:String = ""
    @State var CatBtnClicked:Bool=false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    private func saveProject(){
        do{
            let project = Projects(context:viewContext)
            
            project.title = title
            project.discription = description
            project.language =  categorry
            project.date = Date()
            try viewContext.save()
            
        }catch{
                print(error.localizedDescription)
            }
    }
    
    var body: some View {
        VStack{
            Spacer()
            VStack{
                
                HStack {
                    Text("Add Project").font(.system(size: 20,weight: .bold))
                    
                    Spacer()
                    Button(action: {
                        saveProject()
                    }, label: {
                        Image(systemName:"paperplane").font(.system(size: 20)).frame(width: 60,height: 30).background(Color(red: 155/255, green: 89/255, blue: 182/255)).clipShape(RoundedRectangle(cornerRadius: 15)).foregroundColor(Color(red: 26/255, green: 188/255, blue: 152/255))
                    })
                    .padding(.trailing)
                    
                }
             
                .padding([.top, .leading])
                Spacer().frame(height: 30)
                Text("Select language,")
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
                            Text("Plans")
                            
                            Spacer()
                          
                                }
                        TextField("Description", text:$description,axis: .vertical).frame(width: 340,height: 150).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 15)).shadow(radius: 5) .multilineTextAlignment(TextAlignment.center)
                        
                        
                    }.frame(maxWidth:.infinity,maxHeight: .infinity).background(Color.white).clipShape(RoundedRectangle(cornerRadius: 20))
                            }
                            
                        }.padding(.leading)
                        
                        
        }.presentationDetents([.fraction(0.7)])
              
                
                
                Spacer()
                
            }
            
        }


struct addProject_Previews: PreviewProvider {
    static var previews: some View {
        addProject()
    }
}
