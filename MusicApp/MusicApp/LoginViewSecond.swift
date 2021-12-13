//
//  LoginView.swift
//  MusicApp
//
//  Created by iosdev on 7.12.2021.
//
import SwiftUI
import Foundation

import SwiftUI


struct LoginViewSecond: View {
    
    @ObservedObject var colors : ColorDetails
    @ObservedObject var data : OurData
    @State var email = ""
    
    @State var password = ""
    
    var body: some View {
        NavigationView{
            
            ZStack(alignment: .topLeading){
                LinearGradient(gradient: Gradient(colors: [Color(hexStringToUIColor(hex: "#bbeaf2")), .white, Color(hexStringToUIColor(hex: "#bbeaf2"))]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                VStack{
                    
                    Text("Sign In")
                    
                        .font(.title)
                    
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    
                    //Letter spacing
                    
                        .kerning(1.9)
                    
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    
                    
                    //Email and Password
                    
                    VStack(alignment: .leading , spacing: 8, content: {
                        
                        Text("User Name")
                        
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                            .foregroundColor(.gray)
                        
                        
                        
                        TextField("emailaddress@gmail.com", text: $email)
                        
                        //Increasing FonSize and changeing text color
                        
                            .font(.system(size: 20, weight: .semibold))
                        
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                            .padding(.top,5)
                        
                        Divider()
                        
                    })
                    
                        .padding(.top,25)
                    
                    
                    
                    VStack(alignment: .leading , spacing: 8, content: {
                        
                        Text("Password")
                        
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                            .foregroundColor(.gray)
                        
                        
                        
                        SecureField("123456", text: $password)
                        
                        //Increasing FonSize and changeing text color
                        
                            .font(.system(size: 20, weight: .semibold))
                        
                            .foregroundColor(.blue)
                        
                            .padding(.top,5)
                        
                        Divider()
                        
                    })
                    
                        .padding(.top,20)
                    
                    
                    
                    //forgot password
                    
                    Button(action: {}, label: {
                        
                        Text("Forgot password?")
                        
                        
                        
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        
                    })
                    
                    //This line will reduce the use of unwanted hstack and spacers
                    
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    
                        .padding(.top,10)
                    
                    
                    
                    //next button
                    NavigationLink(destination: FirstView(data: data, colors: colors)){
                        Text("Login")
                        
                        
                    }
                    
                    
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    
                    
                    
                    .padding(.top,10)
                    
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                    .padding()
                
                
                
            }
            
        }
    }
}



