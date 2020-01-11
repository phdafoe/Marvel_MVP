//
//  UserAndPassword.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 09/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import SwiftUI

struct UserAndPassword: View {
    
    @State var username : String = ""
    @State var password : String = ""
    @State var showingAlert = false
    @State var alertText : String = ""
    
    var body: some View {
        VStack{
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.username)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textContentType(.password)
            
            Button(action: sigInTapped){
                Text("Log In").foregroundColor(Color.black)
            }.alert(isPresented: $showingAlert) { () -> Alert in
                Alert(title: Text(alertText))
            }
        }.padding()
    }
    
    private func sigInTapped(){
        let words = CharacterSet.whitespacesAndNewlines
        let account = username.trimmingCharacters(in: words)
        let pwd = password.trimmingCharacters(in: words)
        
        guard !(account.isEmpty || pwd.isEmpty) else {
            alertText = "Please enter a username and password"
            showingAlert = true
            return
        }
        
        SharedWebCredential(domain: "")
        .store(account: account,
               password: password) { result in
                guard case .failure = result else { return }
                self.alertText = "Failed to store password"
                self.showingAlert = true
        }
    }
}

