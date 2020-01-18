//
//  AppAssembly.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

protocol AppAssemblyProtocol : class  {
    func applicationShowInitVC(_ window : UIWindow, scene: UIScene)
}

final class AppAssembly : AppAssemblyProtocol {
    
    private(set) var window: UIWindow?
    public typealias HTTPHeaders = [String: String]
    
    internal func applicationShowInitVC(_ window : UIWindow, scene: UIScene) {
        let actualViewController = HomeView()
        window.rootViewController = UIHostingController(rootView: actualViewController)
        self.window = window
       // self.customUI()
        window.makeKeyAndVisible()
    }
    
    public static let defaultHTTPHeaders: HTTPHeaders = {
        let referer = "developer.marvel.com"
        return [
            "Referer": referer
        ]
    }()
    
    private func customUI(){
        let customView = UIView(frame: CGRect(x: 250, y: 250, width: 100, height: 50))
        customView.backgroundColor = UIColor.red
        self.window?.addSubview(customView)
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().alpha = 0.5
    }
    
    
    
}
