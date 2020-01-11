//
//  LoginView.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 09/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
    @State var isLogin : Bool = false
    
    
    var body: some View {
        NavigationView{
            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fit)
                    .frame(width: 150.0, height: 150.0)
                    .padding(Edge.Set.bottom, 20)
                            
                Text("Explore the world of MARVEL")
                    .font(.subheadline)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))
                
                UserAndPassword().padding()
                
                SignInWithApple()
                    .frame(width: 280, height: 60)
                    .onTapGesture(perform: showAppleLogin)
            }.onAppear {
              self.performExistingAccountSetupFlows()
            }.sheet(isPresented: $isLogin) {
                HomeView()
            }
        }
    }
    
    //MARK: - Methods privates
    private func showAppleLogin() {
      let request = ASAuthorizationAppleIDProvider().createRequest()
      request.requestedScopes = [.fullName, .email]
      performSignIn(using: [request])
    }

    private func performSignIn(using requests: [ASAuthorizationRequest]) {
      appleSignInDelegates = SignInWithAppleDelegates() { success in
        if success {
            self.isLogin = true
          // update UI
        } else {
          // show the user an error
        }
      }

      let controller = ASAuthorizationController(authorizationRequests: requests)
      controller.delegate = appleSignInDelegates
      controller.performRequests()
    }
    
    
    private func performExistingAccountSetupFlows() {
      // 1
      #if !targetEnvironment(simulator)

      // 2
      let requests = [
        ASAuthorizationAppleIDProvider().createRequest(),
        ASAuthorizationPasswordProvider().createRequest()
      ]

      // 2
      performSignIn(using: requests)
        
      #endif
    }
    
}

