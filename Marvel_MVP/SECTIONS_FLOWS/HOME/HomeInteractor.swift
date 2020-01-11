//
//  LoginInteractor.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 08/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation

class HomeInteractor : GenericProvider  {
            
    internal func getAllComicsFromGenericProvider(_ customLimit : Int, completion : @escaping ([ResultComics]) -> ()) {
        getListComicsFromMarvel(CONSTANTS.CALLSTOMARVEL.BASE_URL_COMICS,
                                timestamp: Helpers().dimeTimeStamp(),
                                apiKey: CONSTANTS.API_KEY.PUBLIC,
                                hash: Helpers().getHash(),
                                limit : "\(customLimit)",
                                success: { (resultComics) in
                                    if let resultDes = resultComics.data?.results{
                                        completion(resultDes)
                                    }
        }) { (error) in
            print(error.errorDescription!)
        }
    }
    
    internal func getAllCharactersFromGenericProvider(_ customLimit : Int, completion : @escaping ([ResultCharacters]) -> ()) {
        getListCharactersFromMarvel(CONSTANTS.CALLSTOMARVEL.BASE_URL_CHARACTERS,
                                timestamp: Helpers().dimeTimeStamp(),
                                apiKey: CONSTANTS.API_KEY.PUBLIC,
                                hash: Helpers().getHash(),
                                limit : "\(customLimit)",
                                success: { (resultCharacters) in
                                    if let resultDes = resultCharacters.data?.results{
                                        completion(resultDes)
                                    }
        }) { (error) in
            print(error.errorDescription!)
        }
    }
    
    internal func getAllSeriesFromGenericProvider(_ customLimit : Int, completion : @escaping ([ResultSeries]) -> ()) {
        getListSeriesFromMarvel(CONSTANTS.CALLSTOMARVEL.BASE_URL_SERIES,
                                timestamp: Helpers().dimeTimeStamp(),
                                apiKey: CONSTANTS.API_KEY.PUBLIC,
                                hash: Helpers().getHash(),
                                limit : "\(customLimit)",
                                success: { (resultCharacters) in
                                    if let resultDes = resultCharacters.data?.results{
                                        completion(resultDes)
                                    }
        }) { (error) in
            print(error.errorDescription!)
        }
    }
    
    
    internal func getAllFeaturedGenericProvider(_ completion : @escaping ([ResultFeatured]) -> ()){
        getListFeaturedFromMarvel(CONSTANTS.CALLSTOMARVEL.BASE_URL_FEATURED_MARVEL,
                                  success: { (resultFeatured) in
                                    if let resultFeaturedDes = resultFeatured.data?.results{
                                        completion(resultFeaturedDes)
                                    }
        }) { (error) in
            print(error.errorDescription!)
        }
    }
}
