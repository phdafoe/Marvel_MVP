//
//  CustomCellMovie.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import SwiftUI

struct CustomCellMovie: View {
    
    var comic: ResultComics
    
    @ObservedObject var remoteImage = RemoteImageUrl()
    //@ObservedObject var remote = RemoteImageUrl2()
    
    init(comic: ResultComics) {
        self.comic = comic
        self.remoteImage.getImageFromUrl(self.getPathImage(comic))
    }
    
    func getPathImage(_ comic : ResultComics) -> String {
        var pathImage = ""
        if let pathImageDes = self.comic.images?.count{
            for c_item in 0..<pathImageDes{
                pathImage = (self.comic.images![c_item].path!+".jpg")
            }
        }
        return pathImage
    }
    
    func getName(_ comic : ResultComics) -> String{
        var name = ""
        if let nameDes = self.comic.creators?.items?.count{
            for c_item in 0..<nameDes{
                name = (self.comic.creators?.items![c_item].name)!
            }
        }
        return name
    }
    
    var body: some View {
        return GeometryReader { geometry in
            HStack(alignment: .top) {
                Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 270)
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 3))
                    .shadow(radius: 15)
                VStack(alignment: .leading) {
                    Text("Artist: \(self.getName(self.comic))")
                    Text("Name: \(self.comic.series?.name ?? "")")
                    Text("Type: \(self.comic.format ?? "")")
                }.font(.headline)
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}


