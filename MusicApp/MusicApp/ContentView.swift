//
//  ContentView.swift
//  MusicApp
//
//  Created by iosdev on 21.11.2021.
//

import SwiftUI
import Firebase



struct Album: Hashable {
    var id = UUID()
    var name : String
    var image : String
    var songs : [Song]
}

struct Song : Hashable {
    var id = UUID()
    var name : String
    var time : String
    var file : String
}

struct ContentView: View {
    
    @ObservedObject var data : OurData
    @State private var currentAlbum : Album?
    
    
    var body: some View {
        NavigationView{
            ScrollView{
                Text("\(data.albums.count)")
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack{
                        ForEach(self.data.albums, id: \.self, content: {
                            album in
                            AlbumImage(album: album, isWithText: true).onTapGesture {
                                self.currentAlbum = album
                            }
                        })
                    }
                    
                })
                LazyVStack{
                    if self.data.albums.first == nil {
                        EmptyView()
                    } else {
                        ForEach((self.currentAlbum?.songs ?? self.data.albums.first?.songs) ?? [Song(name: "", time: "", file: "")] ,
                                
                                id: \.self, content: {
                            song in
                            SongCell(album: currentAlbum ?? self.data.albums.first!, song: song)
                        })
                    }
                }.navigationTitle("Albums")
            }
        }
    }
}
struct AlbumImage : View {
    var album : Album
    var isWithText : Bool
    var body: some View{
        ZStack(alignment: .bottom, content: {
            Image(album.image)
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            if isWithText == true {
                ZStack{
                    Spacer()
                    Blur(style: .dark)
                    Text(album.name).foregroundColor(.white)
                }.frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }).frame(width: 170, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .clipped().cornerRadius(20).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/).padding(20)
    }
}

struct SongCell : View {
    var album : Album
    var song : Song
    var body : some View {
        NavigationLink(destination: PlayerView(album: album, song: song), label: {
            HStack {
                ZStack{
                    Circle().frame(width: 50, height: 50, alignment: .center).foregroundColor(.blue)
                    Circle().frame(width: 20, height: 20, alignment: .center).foregroundColor(.white)
                }
                Text(song.name).bold()
                Spacer()
                Text(song.time)
            }.padding(20)}).buttonStyle(PlainButtonStyle())
        
    }
}

