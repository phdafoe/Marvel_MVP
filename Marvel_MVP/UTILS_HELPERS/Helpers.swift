//
//  Helpers.swift
//  VIPER_MARVEL-COMICS
//
//  Created by Andres Felipe Ocampo Eljaiesk on 02/03/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation
import CryptoSwift
import SwiftUI

class Helpers{
    
    //MARK: - GET TIMESTAMP
    func dimeTimeStamp() -> String{
        let x = Int(round(Date().timeIntervalSince1970))
        return "\(x)"
    }
    
    //MARK: - GET HASH
    func getHash() -> String{
        let pTimeStamp = self.dimeTimeStamp()
        let hash = (pTimeStamp+CONSTANTS.API_KEY.PRIVATE+CONSTANTS.API_KEY.PUBLIC).md5()
        return hash
    }
    
    
    
}
