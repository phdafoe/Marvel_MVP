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
    @ObservedObject var presenter = AllListMarvelPresenter()
    var categoryName : String = ""
    
    init(categoryName : String) {
        self.categoryName = categoryName
        self.presenter.getDataFromHomeInteractor()
    }
    
    var body: some View {
        List{
            PostCell(arrayComics: self.presenter.comics)
        }
    }
}

