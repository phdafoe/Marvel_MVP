//
//  AllListMarvelPresenter.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 10/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

class AllListMarvelPresenter : HomeInteractor, ObservableObject  {
    
    @Published var comics : [ResultComics] = []
    
    internal func getDataFromHomeInteractor(){
        getAllComicsFromGenericProvider(20) { (comicsEntity) in
            self.comics = comicsEntity
        }
        
    }
    
    

}
