//
//  Constantes.swift
//  VIPER_MARVEL-COMICS
//
//  Created by Andres Felipe Ocampo Eljaiesk on 02/03/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation

let CONSTANTS = Constants()

struct Constants {
    let CALLSTOMARVEL = CallsToMarvel()
    let API_KEY = ApiKey()
}

struct CallsToMarvel {
    let BASE_URL = "http://gateway.marvel.com/v1/public/%@?ts=%@&apikey=%@&hash=%@"
    let BASE_URL_COMICS = "comics"
    let BASE_URL_STORIES = "stories"
    let BASE_URL_SERIES = "series"
    let BASE_URL_CHARACTERS = "characters"
}

struct ApiKey {
    let PRIVATE = "e4385b099465ad7073d460a64d0de9f0397158a2"
    let PUBLIC = "3b74d585ff268d3852ead9171a5d7c2d"
}
