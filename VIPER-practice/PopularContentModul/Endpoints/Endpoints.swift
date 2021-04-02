//
//  Endpoints.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

class Endpoints {
    static let API_KEY = "6b88449d2e1d52d486d9bf09c0206aa4"
    static let QUERY = "?api_key=".appending(API_KEY).appending("&language=en-US&page=1")
    let TV_POPULAR = baseUrl.appending("/tv/popular").appending(QUERY)
    let MOVIE_POPULAR =  baseUrl.appending("/movie/popular").appending(QUERY)
}
