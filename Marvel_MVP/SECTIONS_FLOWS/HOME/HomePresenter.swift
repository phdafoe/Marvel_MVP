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
    
    
    internal func getDataFromInteractor(){
        getAllComicsFromGenericProvider { (comicsEntity) in
            self.comics = comicsEntity
        }
        getAllCharactersFromGenericProvider { (storiesEntity) in
            self.characters = storiesEntity
        }
        getAllSeriesFromGenericProvider { (seriesEntity) in
            self.series = seriesEntity
        }
    }
    

}
