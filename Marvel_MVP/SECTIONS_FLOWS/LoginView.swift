//
//  LoginView.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 08/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - Variables locales
    @ObservedObject var presenter = LoginPresenter()
    
    //MARK: - Inicializador de la vista
    init() {
        UITableView.appearance().separatorColor = .clear
        self.presenter.getDataFromInteractor()
    }
    
    
    var body: some View {
        NavigationView{
            List(presenter.comics){ comic in
                CustomCellMovie(comic: comic).frame(height: 300)
            }.navigationBarTitle(Text("Comics"), displayMode: .large)
        }
    }
}


