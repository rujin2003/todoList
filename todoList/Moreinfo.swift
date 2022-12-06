//
//  Moreinfo.swift
//  todoList
//
//  Created by Rujin Devkota on 05/12/2022.
//

import SwiftUI

struct Moreinfo: View {
    let titile:String
    let discription: String
    let Img:String
    
    var body: some View {
        VStack{
            HStack{Text(
                titile).padding([.leading,.top],20).font(.system(size: 25).bold())
                Image(Img).resizable().frame(width: 30,height: 30)
                Spacer()
            }
            Spacer().frame(height: 20)
            HStack{
                Text(discription).padding(.leading)
                Spacer()
            }
            Spacer()
            
        }.presentationDetents([.fraction(0.55)])
      
    }
}

struct Moreinfo_Previews: PreviewProvider {
    static var previews: some View {
        Moreinfo(titile: "hora bhaii malai ta tha thiyena", discription: "K garchas bhaii yeti code hanera", Img:"flutter")
    }
}
