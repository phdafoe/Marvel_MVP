//
//  NormalCell.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 10/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    
    var arrayComics : [ResultComics]
        
    init(arrayComics : [ResultComics]) {
        self.arrayComics = arrayComics
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 2){
            ForEach(self.arrayComics) { comic in
                CustomPostCell(comic: comic)
            }
        }
    }
}

struct CustomPostCell : View {
    
    private var comic : ResultComics
    @ObservedObject var remoteImage = RemoteImageUrl()
    
    init(comic : ResultComics){
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
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    AvatarView()
                    VStack(alignment: .leading, spacing: 3) {
                        Text(self.comic.title ?? "").font(.headline)
                    }
                }
            }
            Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!)
                .resizable()
                .frame(width: 375, height: 600)
                .aspectRatio(3/2, contentMode: .fit)
        }
        .padding(.top, 5)
    }
}

struct AvatarView: View {
    
    var body: some View {
        Image(systemName: "person.crop.circle")
            .resizable()
            .frame(width: 45, height: 45)
            .border(Color.gray.opacity(0.5), width: 0.5)
            .cornerRadius(45/2)
    }
}



