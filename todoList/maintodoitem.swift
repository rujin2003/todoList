//
//  maintodoitem.swift
//  todoList
//
//  Created by Rujin Devkota on 02/12/2022.
//

import SwiftUI

struct maintodoitem: View {
    
    
   let  title: String
   let  type: String
   let  urgency:String
   @Binding var  clicked:Bool
    var body: some View {
        ZStack (alignment:.topTrailing){
            
            HStack{
                if(clicked==false)
                {Button{clicked=true}label: {
                    Circle().fill(Color.white).frame(width: 27)
                }
                    .padding(.leading, 22.0)}else{
                    Button{clicked=false}label: {
                        Image("correct")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle()).frame(width:27)
                    }
                    .padding( .leading, 22.0)
                    
                }
                VStack{
                    HStack {
                        clicked==true ? Text(title).font(.system(size: 17, weight: .semibold )).strikethrough():
                        Text(title).font(.system(size: 17, weight: .semibold ))
                        Spacer()
                        
                        
                        Button(action: {}, label:{
                            Circle().fill(
                                urgency == "Low" ?  Color.green: urgency == "High" ? Color.red: Color.blue).frame(width: 10,height: 10)
                        })
                        Spacer().frame(width: 30)
                    }
                    
                }
                
                Spacer()
            }.frame(height: 60).background(Color(red: 195/255, green: 155/255, blue: 211/255)).clipShape(RoundedRectangle(cornerRadius: 15))
            Image(type)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, -10.0)
                .frame(width: 40)
        }.frame(width: 330,height: 75)
        
    }
}

struct maintodoitem_Previews: PreviewProvider {
    static var previews: some View {
        maintodoitem(title:"hora",type: "party",urgency:"Low",clicked:.constant(true))
    }
}
