//
//  RemoteImageUrl.swift
//  NEOLAND_SwiftUI
//
//  Created by Andres Felipe Ocampo Eljaiesk on 03/11/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation
import UIKit

class RemoteImageUrl: ObservableObject {
    
    @Published var data = Data()
    
    internal func getImageFromUrl(_ imageUrl : String){
        guard let url = URL(string: imageUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.data = data
            }
        }
        task.resume()
    }
}

