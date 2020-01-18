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
    
    @Published var comicsArrayAux : [ResultComics] = []
    @Published var charactersArrayAux : [ResultCharacters] = []
    @Published var seriesArrayAux : [ResultSeries] = []

    
    
    internal func getDataFromInteractor(){
        getAllFeaturedGenericProvider { (featuredEntity) in
            self.featured = featuredEntity
        }
        getAllComicsFromGenericProvider(20) { (comicsEntity) in
            self.comics = comicsEntity
            self.comicsArrayAux = self.showFiveComicsArray(arrayComics: self.comics)
        }
        getAllCharactersFromGenericProvider(20) { (storiesEntity) in
            self.characters = storiesEntity
            self.charactersArrayAux = self.showFiveCharactersArray(arrayCharacters: self.characters)
        }
        getAllSeriesFromGenericProvider(20) { (seriesEntity) in
            self.series = seriesEntity
            self.seriesArrayAux = self.showFiveSeriesArray(arraySeries: self.series)
        }
    }
    
    private func showFiveComicsArray(arrayComics : [ResultComics]) -> [ResultComics]{
        let first5 = arrayComics.prefix(5)
        self.comicsArrayAux = Array(first5)
        return self.comicsArrayAux
    }
    
    private func showFiveCharactersArray(arrayCharacters : [ResultCharacters]) -> [ResultCharacters]{
        let first5 = arrayCharacters.prefix(5)
        self.charactersArrayAux = Array(first5)
        return self.charactersArrayAux
    }
    
    private func showFiveSeriesArray(arraySeries : [ResultSeries]) -> [ResultSeries]{
        let first5 = arraySeries.prefix(5)
        self.seriesArrayAux = Array(first5)
        return self.seriesArrayAux
    }
    

}
