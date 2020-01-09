//
//  SceneDelegate.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 08/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import UIKit
import SwiftUI
import AuthenticationServices

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //MARK: - Variables locales
    let appAssembly : AppAssemblyProtocol = AppAssembly()
    let provider = ASAuthorizationAppleIDProvider ()
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            appAssembly.applicationShowInitVC(window, scene: scene)
            provider.getCredentialState(forUserID: "currentUserIdentifier") { state, error in
              switch state {
              case .authorized:
                // Credentials are valid.
                break
              case .revoked:
                // Credential revoked, log them out
                break
              case .notFound:
                // Credentials not found, show login UI
                break
              case .transferred:
                // Credentials transferred, show login UI
                break
              @unknown default:
                break
                }
            }
        }
    }
    
    
    


}

