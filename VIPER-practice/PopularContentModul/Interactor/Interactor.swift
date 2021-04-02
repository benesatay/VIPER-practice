//
//  Interactor.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class Interactor {
    var presenter: InteractorToPresenterDelegate?
    var endpoints: Endpoints!
    func getData(urlString: String, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data, error == nil else { return onError(error!) }
                onSuccess(data)
            }.resume()
        }
    }
}

extension Interactor: PresenterToInteractorDelegate {
   
    func fetchPopularTVContent() {
        endpoints = Endpoints()
        let endPoint = endpoints.TV_POPULAR
        self.getData(urlString: endPoint) { (data) in
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(PopularTvModel.self, from: data) {
                guard let results = json.results else { return }
                self.presenter?.fetchingSucceed(results: results)
            }
        } onError: { (error) in
            self.presenter?.fetchingFailed()
        }
    }
    
    func fetchPopularMovieContent() {
        endpoints = Endpoints()
        let endPoint = endpoints.MOVIE_POPULAR
        self.getData(urlString: endPoint) { (data) in
            let decoder = JSONDecoder()
            if let json = try? decoder.decode(PopularMovieModel.self, from: data) {
                guard let results = json.results else { return }
                self.presenter?.fetchingSucceed(results: results)
            }
        } onError: { (error) in
            print(error)
        }
    }
}
