//
//  ProfileButton.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 10/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import SwiftUI

struct ProfileButton: View {
    
    @State var showingProfile: Bool = false
    
    var body: some View {
        Button(action: showLoginView){
           Image(systemName: "person.crop.circle")
            .imageScale(.large)
            .accessibility(label: Text("User Profile"))
            .padding()
        }.sheet(isPresented: $showingProfile) {
            LoginView()
        }
    }
    
    //MARK: - Methods privates
    private func showLoginView() {
      self.showingProfile = true
    }
}

