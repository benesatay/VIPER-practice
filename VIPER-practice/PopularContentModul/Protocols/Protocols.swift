//
//  Protocols.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

// MARK: - To Presenter
protocol InteractorToPresenterDelegate: class {
    func fetchingSucceed(results: [Result])
    func fetchingFailed()
}

// MARK: - To Interactor
protocol PresenterToInteractorDelegate :class {
    var presenter: InteractorToPresenterDelegate? {get set}
    func fetchPopularTVContent()
    func fetchPopularMovieContent()
}

// MARK: - To View
protocol PresenterToViewDelegate:class {
    func getItemCount() -> Int
    func onPopularContentResponseSuccess(results: [Result])
    func onPopularContentResponseFailed(error:String)
}

// MARK: - To Presenter
protocol ViewToPresenterDelegate: class {
    var view: PresenterToViewDelegate? {get set}
    var interactor: PresenterToInteractorDelegate? {get set}
    var router: PresenterToRouterDelegate? {get set}
    ///it is used to change numberOfItemsInSection according to the selected number by user.
    var selectedCount: Int? { get set }
    func startTofetchPopularTVContent()
    func startTofetchPopularMovieContent()
    func createActionSheet(didSelected: @escaping () -> Void) -> UIAlertController
    func currentSegment(index: Int)
}

// MARK: - To Router
protocol PresenterToRouterDelegate: class {
    static func createModule()-> ViewController
}
