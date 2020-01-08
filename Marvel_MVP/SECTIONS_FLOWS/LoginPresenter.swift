//
//  LoginPresenter.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 08/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

class LoginPresenter : LoginInteractor, ObservableObject  {
    
    @Published var comics : [ResultComics] = []
    
    internal func getDataFromInteractor(){
        getAllComicsFromGenericProvider { (comicsEntity) in
            self.comics = comicsEntity
        }
    }

}
