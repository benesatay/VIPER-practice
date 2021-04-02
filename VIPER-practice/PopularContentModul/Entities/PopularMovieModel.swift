//
//  PopularMovieModel.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

// MARK: - PopularMovieModel
struct PopularMovieModel: BaseModel {
    var page: Int?
    
    var results: [Result]?
    
    var totalResults: Int?
    
    var totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}


