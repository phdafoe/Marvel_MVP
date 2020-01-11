//
//  LoginPresenter.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 08/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

class HomePresenter : HomeInteractor, ObservableObject  {
    
    @Published var comics : [ResultComics] = []
    @Published var characters : [ResultCharacters] = []
    @Published var series : [ResultSeries] = []
    @Published var featured : [ResultFeatured] = []
    
    
    internal func getDataFromInteractor(){
        getAllFeaturedGenericProvider { (featuredEntity) in
            self.featured = featuredEntity
        }
        getAllComicsFromGenericProvider(5) { (comicsEntity) in
            self.comics = comicsEntity
        }
        getAllCharactersFromGenericProvider(5) { (storiesEntity) in
            self.characters = storiesEntity
        }
        getAllSeriesFromGenericProvider(5) { (seriesEntity) in
            self.series = seriesEntity
        }
    }
    

}
