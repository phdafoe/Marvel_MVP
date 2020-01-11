//
//  SignInWithAppleDelegates.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 09/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import UIKit
import AuthenticationServices

class SignInWithAppleDelegates: NSObject {
    
    private let signInSucceeded : (Bool) -> ()
    init(onSignedIn : @escaping (Bool) -> ()){
        self.signInSucceeded = onSignedIn
    }
}

extension SignInWithAppleDelegates : ASAuthorizationControllerDelegate{
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
              registerNewAccount(credential: appleIdCredential)
            } else {
              signInWithExistingAccount(credential: appleIdCredential)
            }
          break
        case let passwordCredential as ASPasswordCredential:
            signInWithUserAndPassword(credential: passwordCredential)
          break
        default:
          break
        }
        
        
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        //TODO:
    }
    
    private func registerNewAccount(credential: ASAuthorizationAppleIDCredential) {
        
      let userData = UserData(email: credential.email!,
                              name: credential.fullName!,
                              identifier: credential.user)

      let keychain = UserDataKeychain()
      do {
        try keychain.store(userData)
      } catch {
        self.signInSucceeded(false)
      }

      // 3
      do {
        let success = try WebApi.Register(
          user: userData,
          identityToken: credential.identityToken,
          authorizationCode: credential.authorizationCode
        )
        self.signInSucceeded(success)
      } catch {
        self.signInSucceeded(false)
      }
    }
    
    private func signInWithExistingAccount(credential: ASAuthorizationAppleIDCredential) {
      // You *should* have a fully registered account here.  If you get back an error
      // from your server that the account doesn't exist, you can look in the keychain
      // for the credentials and rerun setup

      // if (WebAPI.login(credential.user,
      //                  credential.identityToken,
      //                  credential.authorizationCode)) {
      //   ...
      // }

      self.signInSucceeded(true)
    }
    
    private func signInWithUserAndPassword(credential: ASPasswordCredential) {
      // You *should* have a fully registered account here.  If you get back an error from your server
      // that the account doesn't exist, you can look in the keychain for the credentials and rerun setup

      // if (WebAPI.Login(credential.user, credential.password)) {
      //   ...
      // }
      self.signInSucceeded(true)
    }
}
