//
//  LoginInteractor.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 08/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

class LoginInteractor : GenericProvider  {
            
    internal func getAllComicsFromGenericProvider(_ completion : @escaping ([ResultComics]) -> ()) {
        getListComicsFromMarvel(CONSTANTS.CALLSTOMARVEL.BASE_URL_COMICS,
                                timestamp: Helpers().dimeTimeStamp(),
                                apiKey: CONSTANTS.API_KEY.PUBLIC,
                                hash: Helpers().getHash(),
                                success: { (resultComics) in
                                    if let resultDes = resultComics.data?.results{
                                        completion(resultDes)
                                    }
        }) { (error) in
            print(error.errorDescription!)
        }
    }
}
