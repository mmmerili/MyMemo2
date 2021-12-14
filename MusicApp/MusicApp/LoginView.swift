//
//  LoginView.swift
//  MusicApp
//
//  Created by iosdev on 7.12.2021.
//
import SwiftUI
import Foundation

import SwiftUI


struct LoginView: View {
    
    @ObservedObject var colors : ColorDetails
    @ObservedObject var data : OurData
    @State var email = ""
    
    @State var password = ""
    
    var body: some View {
        NavigationView{
            
            ZStack(alignment: .topLeading){
                LinearGradient(gradient: Gradient(colors: [.white, .white, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                VStack{
                    Text("MyMemo").foregroundColor(Color(colors.startBox)).font(.custom("PT Serif", size: 80)).fontWeight(.heavy)
                    Image("5").resizable().frame(width: 150, height: 100)
                    NavigationLink(destination: FirstView(data: data, colors: colors)){
                        Text("Start").fontWeight(.heavy).font(.custom("PT Serif", size: 70)).foregroundColor(.white)
                        //Text("\(data.albums.count)")}
                            .frame(width: 280, height: 200, alignment: .center)
                        
                    }
                    .background(Color(colors.startBox))
                    .cornerRadius(20)
                    .border(Color(colors.startBorder), width: 10)
                    .shadow(color: Color(colors.startShadow), radius: 8)
                    
                }.frame(width: 370, height: 500, alignment: .center).padding(20)
                VStack{
                    VStack{
                        Text("Manage the account").foregroundColor(Color(colors.startBox)).font(.custom("PT Serif", size: 20))                    }.frame(width: 370, height: 650, alignment: .bottom).padding(20)
                }
                
                
            }
        }.accentColor( .black)
    }
}


