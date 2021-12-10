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
    
    var body : some View{
        ZStack(alignment: .topLeading){
            LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#bbeaf2")), .white, Color(hexStringToUIColor(hex: "#bbeaf2"))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack{
                NavigationLink(destination: ContentView(data: data)){
                    Text("Music").fontWeight(.heavy).font(.custom("PT Serif", size: 70)).foregroundColor(.black)
                    //Text("\(data.albums.count)")
                        .frame(width: 280, height: 200, alignment: .center)
                    .background(Color(hexStringToUIColor(hex: "#f1feff")))}
                .border(Color(hexStringToUIColor(hex: "#83a6a9")), width: 8)
                Spacer()
                    .frame(height: 30)
                HStack{
                    VStack{
                        NavigationLink(destination: MapView()){
                            Text("Map").fontWeight(.heavy).font(.custom("PT Serif", size: 40)).foregroundColor(.black).frame(width: 150 , height: 160, alignment: .center).background(Color(hexStringToUIColor(hex: "#bbeaf2")))}.border(Color(hexStringToUIColor(hex: "#83a6a9")), width: 5).padding(.leading)
                        Text("Me").fontWeight(.heavy).font(.custom("PT Serif", size: 40)).foregroundColor(.black).frame(width: 150 , height: 160, alignment: .center).background(Color(hexStringToUIColor(hex: "#e2fcff"))).border(Color(hexStringToUIColor(hex: "#bbeaf2")), width: 15).padding(.leading)
                    }
                    Text("Images").fontWeight(.heavy).font(.custom("PT Serif", size: 30)).foregroundColor(.black).frame(width: 130 , height: 320, alignment: .center).background(Color(hexStringToUIColor(hex: "#bbeaf2"))).border(Color(hexStringToUIColor(hex: "#83a6a9")), width: 3).padding(.trailing)
                }
                Spacer()
                    .frame(height: 30)
                Text("Search").fontWeight(.bold).font(.custom("PT Serif", size: 30)).foregroundColor(.black).frame(width: 300, height: 50, alignment: .center).background(Color(hexStringToUIColor(hex: "#ffffff"))).border(Color(hexStringToUIColor(hex: "#bbeaf2")), width: 5)
            }.frame(width: 370, height: 700, alignment: .top).padding(20)
        }
    }
}

