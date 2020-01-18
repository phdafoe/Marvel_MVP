//
//  LoginView.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 08/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - Variables locales
    @ObservedObject var presenter = HomePresenter()
    
    //MARK: - Inicializador de la vista
    init() {
        UITableView.appearance().separatorColor = .clear
        self.presenter.getDataFromInteractor()
    }
    
    
    var body: some View {
        NavigationView{
            List{
                FeaturedComics(featured: self.presenter.featured).listRowInsets(EdgeInsets())
                ComicsCellMovie(arrayComics: self.presenter.comicsArrayAux, categoryName: "Comics").listRowInsets(EdgeInsets())
                NavigationLink(destination: AllListMarvel(categoryName : "Comics", arrayComics: self.presenter.comics)) {
                    Text("See All Comics")
                }
                CharactersCellMovie(arrayCharacters: self.presenter.charactersArrayAux, categoryName: "Characters").listRowInsets(EdgeInsets())
                NavigationLink(destination: AllListMarvel(categoryName : "Characters", arrayComics: self.presenter.characters)) {
                    Text("See All Characters")
                }
                SeriesCellMovie(arraySeries: self.presenter.seriesArrayAux, categoryName: "Series").listRowInsets(EdgeInsets())
                NavigationLink(destination: AllListMarvel(categoryName : "Series", arrayComics: self.presenter.series)) {
                    Text("See All Series")
                }
            }
            .navigationBarTitle(Text("MARVEL"))
            .navigationBarItems(trailing: ProfileButton())
        }
    }
    
    
    
}




