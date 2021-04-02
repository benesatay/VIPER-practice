//
//  Utilieis.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class Utilities {
    func getImage(from url: URL, completion: @escaping (UIImage?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data else { return }
            completion(UIImage(data: data), error)
        }).resume()
    }
}
