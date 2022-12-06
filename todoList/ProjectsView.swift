//
//  ProjectsView.swift
//  todoList
//
//  Created by Rujin Devkota on 30/11/2022.
//

import SwiftUI

struct ProjectsView: View {
    let title: String
    let type: String
   
    @Environment(\.managedObjectContext) private var viewContext
  
    var ola = ["Projectbackground1","Projectbackground2","Projectbackground3","Projectbackground4","Projectbackground5"]
    
   
  


    @State var showaction: Bool = false
    var body: some View {
        VStack {
            VStack{
                HStack{
                    Image(type).frame(width:50,height: 50).aspectRatio(contentMode: .fill)
                    Spacer()
                    Image(systemName:"ellipsis")
                    .padding(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)}
                .padding(.top).onTapGesture {
                    self.showaction = true
                }.actionSheet(isPresented: $showaction){
                    ActionSheet(title: Text("") , message: nil ,buttons: [
                        .default(Text("Delete").foregroundColor(Color.red),action: {
                           
                            
                            
                        }),
                        .cancel()
                    ])
                                 }
                Text(title)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal, 3.0/*@END_MENU_TOKEN@*/).font(.system(size: 15))
                Spacer()
                
            }.frame(width:135,height: 125).background(Image(ola.randomElement()!)).clipShape(RoundedRectangle(cornerRadius:15))
            Spacer()
          
                
        Spacer()
        }.frame(width:135,height: 150).background(Color(red:247/255,green:249/255,blue: 249/255)).clipShape(RoundedRectangle(cornerRadius:15)).shadow(radius:5)
        
        
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView(title: "oilaola", type:"flutter")
    }
}
