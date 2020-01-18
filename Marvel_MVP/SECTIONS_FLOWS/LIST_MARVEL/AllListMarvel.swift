//
//  AllListMarvel.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 10/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import SwiftUI

struct AllListMarvel: View {
    
    //MARK: - Variables locales
    var categoryName : String = ""
    var arrayComicsComplete : [ResultComics]
    var arrayCharactersComplete : [ResultCharacters]
    var arraySeriesComplete : [ResultSeries]
    
    init(categoryName : String, arrayComics : [Any]) {
        self.categoryName = categoryName
        self.arrayComicsComplete = arrayComics as? [ResultComics] ?? []
        self.arrayCharactersComplete = arrayComics as? [ResultCharacters] ?? []
        self.arraySeriesComplete = arrayComics as? [ResultSeries] ?? []
    }
    
    private func getArrayData() -> [Any]{
        var aux : [Any] = []
        switch self.categoryName {
        case "Comics":
            aux = self.arrayComicsComplete
            return aux
        case "Characters":
            aux = self.arrayCharactersComplete
            return aux
        default:
            aux = self.arraySeriesComplete
            return aux
        }
    }
    
    var body: some View {
        List{
            NavigationLink(destination: DetailMarvelView()){
                PostCell(arrayComics: self.getArrayData())
            }
       }.navigationBarTitle(Text("Todo Items"))
    }
}

