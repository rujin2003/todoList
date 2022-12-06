//
//  todoitem.swift
//  todoList
//
//  Created by Rujin Devkota on 30/11/2022.
//

import SwiftUI

struct todoitem: View {
    let  title: String
    let  type: String
    let  urgency:String
    let   clicked : Bool
    var body: some View {
        ZStack (alignment:.topTrailing){
            
            HStack{
               
                VStack{
                    HStack {
                        clicked==true ? Text(title).font(.system(size: 18, weight: .semibold )).strikethrough().padding(.leading):
                        Text(title).font(.system(size: 18, weight: .semibold )).padding(.leading)
                        Spacer()
                        
                        Button(action: {}, label:{
                            Circle().fill(
                                urgency == "Low" ?  Color.green: urgency == "High" ? Color.red: Color.blue).frame(width: 10,height: 10)
                        })
                        Spacer().frame(width: 30)
                    }
                    .padding(.leading)
                    
                }
                
                Spacer()
            }.frame(height: 60).background(Color(red: 195/255, green: 155/255, blue: 211/255)).clipShape(RoundedRectangle(cornerRadius: 15))
            Image(type)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, -10.0)
                .frame(width: 40)
        }.frame(width: 300,height: 75)
        
    }
}

struct todoitem_Previews: PreviewProvider {
    static var previews: some View {
        todoitem(title: "ola", type: "guitar", urgency: "Low",clicked: true)
    }
}
