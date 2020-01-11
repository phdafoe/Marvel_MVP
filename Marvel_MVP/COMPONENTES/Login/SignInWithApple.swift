//
//  SignInWithApple.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 09/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

import SwiftUI
import AuthenticationServices

final class SignInWithApple: UIViewRepresentable {
    
  func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
    return ASAuthorizationAppleIDButton()
  }
  
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    
  }
}
