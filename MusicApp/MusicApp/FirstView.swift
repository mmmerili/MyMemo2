//
//  FirstView.swift
//  MusicApp
//
//  Created by iosdev on 5.12.2021.
//

import Foundation
import SwiftUI

struct FirstView: View{
    
    @ObservedObject var data : OurData
    @ObservedObject var colors : ColorDetails
    
    var body : some View{
        ZStack(alignment: .topLeading){
            LinearGradient(gradient: Gradient(colors: [Color(colors.upperBlue), Color(colors.middleBlue), Color(colors.downBlue)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack{
                NavigationLink(destination: ContentView(data: data)){
                    Text("Music").fontWeight(.semibold)
                        .font(.system(size: 80))
                        .foregroundColor(.white)
                    //Text("\(data.albums.count)")
                        .frame(width: 280, height: 200, alignment: .center)
                    .background(Color(colors.startBox))}
                .border(Color(colors.startBorder), width: 15)
                .shadow(color: Color(colors.startShadow), radius: 5)
                Spacer()
                    .frame(height: 30)
                HStack{
                    VStack{
                        NavigationLink(destination: MapView()){
                            Text("Map").fontWeight(.semibold)
                                .font(.system(size: 40))
                            .foregroundColor(.white).frame(width: 150 , height: 160, alignment: .center).background(Color(colors.middleBox1))}.border(Color(colors.startBox), width: 5).padding(.leading)//.shadow(color: Color(colors.startShadow), radius: 8)
                        Text("Me").fontWeight(.semibold)
                            .font(.system(size: 40))
                            .foregroundColor(.white).frame(width: 150 , height: 160, alignment: .center).background(Color(colors.startBox)).border(Color(colors.startBorder), width: 8).padding(.leading)
                    }.shadow(color: Color(colors.startShadow), radius: 5)
                    Text("Images").fontWeight(.semibold)
                        .font(.system(size: 30))
                        .foregroundColor(.white).frame(width: 130 , height: 320, alignment: .center).background(Color(colors.startBox)).border(Color(colors.middleBox1), width: 3).padding(.trailing).shadow(color: Color(colors.startShadow), radius: 5)
                }
                Spacer()
                    .frame(height: 30)
                Text("Search").fontWeight(.semibold)
                    .font(.system(size: 30))
                    .foregroundColor(.white).frame(width: 300, height: 50, alignment: .center).background(Color(colors.box4)).border(Color(colors.startBox), width: 5)
            }.frame(width: 370, height: 700, alignment: .top).padding(20).shadow(color: Color(colors.startShadow), radius: 5)
        }
    }
}


