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
                ComicsCellMovie(arrayComics: self.presenter.comics, categoryName: "Comics").listRowInsets(EdgeInsets())
                NavigationLink(destination: AllListMarvel(categoryName : "Comics")) {
                    Text("See All Comics")
                }
                CharactersCellMovie(arrayCharacters: self.presenter.characters, categoryName: "Characters").listRowInsets(EdgeInsets())
                NavigationLink(destination: LoginView()) {
                    Text("See All Characters")
                }
                SeriesCellMovie(arraySeries: self.presenter.series, categoryName: "Series").listRowInsets(EdgeInsets())
                NavigationLink(destination: LoginView()) {
                    Text("See All Series")
                }
            }
            .navigationBarTitle(Text("MARVEL"))
            .navigationBarItems(trailing: ProfileButton())
        }
    }
    
    
    
}


