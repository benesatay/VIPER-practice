//
//  BaseModel.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

// MARK: - Base Model
protocol BaseModel: Codable {
    var page: Int? { get set }
    var results: [Result]? { get set }
    var totalResults: Int? { get set }
    var totalPages: Int? { get set }
}

// MARK: - Result
struct Result: Codable {
    var posterPath: String?
    var popularity: Double?
    var id: Int?
    var backdropPath: String?
    var voteAverage: Double?
    var overview, firstAirDate: String?
    var originCountry: [String]?
    var genreIDS: [Int]?
    var originalLanguage: String?
    var voteCount: Int?
    var name, originalName: String?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case popularity = "popularity"
        case id = "id"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case overview = "overview"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
        case genreIDS = "genre_ids"
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case name = "name"
        case originalName = "original_name"
    }
}
