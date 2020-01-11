//
//  CustomCellMovie.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation
import SwiftUI

struct ComicsCellMovie: View {
    
    var arrayComics : [ResultComics]
    var categoryName : String
        
    init(arrayComics : [ResultComics], categoryName: String) {
        self.arrayComics = arrayComics
        self.categoryName = categoryName
    }
 
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName).font(.headline).padding(.leading, 15).padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.arrayComics) { comic in
                        ComicCell(comic: comic)
                    }
                }
            }.frame(height: 300)
        }
    }
}

struct CharactersCellMovie: View {
    
    var arrayCharacters : [ResultCharacters]
    var categoryName : String
        
    init(arrayCharacters: [ResultCharacters], categoryName: String) {
        self.arrayCharacters = arrayCharacters
        self.categoryName = categoryName
    }
 
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName).font(.headline).padding(.leading, 15).padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.arrayCharacters) { character in
                        CharacterCell(character: character)
                    }
                }
            }.frame(height: 300)
        }
    }
}

struct SeriesCellMovie: View {
    
    var arraySeries : [ResultSeries]
    var categoryName : String
        
    init(arraySeries: [ResultSeries], categoryName: String) {
        self.arraySeries = arraySeries
        self.categoryName = categoryName
    }
 
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName).font(.headline).padding(.leading, 15).padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.arraySeries) { serie in
                        SeriesCell(serie: serie)
                    }
                }
            }.frame(height: 300)
        }
    }
}


struct ComicCell: View {
    
    var comic: ResultComics
       
    @ObservedObject var remoteImage = RemoteImageUrl()
       
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
            VStack(alignment: .leading) {
                Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 180, height: 270)
                    .cornerRadius(5)
                    .aspectRatio(contentMode: .fit)
                  Text("\(self.getName(self.comic))")
                    .foregroundColor(.primary)
                    .font(.caption)
            }.padding(.leading, 15)
    }
}


struct CharacterCell: View {
    
    var character: ResultCharacters
       
    @ObservedObject var remoteImage = RemoteImageUrl()
       
    init(character: ResultCharacters) {
        self.character = character
        self.remoteImage.getImageFromUrl((self.character.thumbnail?.path)!+".jpg")
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!)
                .renderingMode(.original)
                .resizable()
                .frame(width: 180, height: 270)
                .cornerRadius(5)
                .aspectRatio(contentMode: .fit)
            Text("\(self.character.name!)")
                .foregroundColor(.primary)
                .font(.caption)
        }.padding(.leading, 15)
    }
}

struct SeriesCell: View {
    
    var serie: ResultSeries
       
    @ObservedObject var remoteImage = RemoteImageUrl()
       
    init(serie: ResultSeries) {
        self.serie = serie
        self.remoteImage.getImageFromUrl((self.serie.thumbnail?.path)!+".jpg")
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!)
                .renderingMode(.original)
                .resizable()
                .frame(width: 180, height: 270)
                .cornerRadius(5)
                .aspectRatio(contentMode: .fit)
            Text("\(self.serie.title!)")
                .foregroundColor(.primary)
                .font(.caption)
        }.padding(.leading, 15)
    }
}

