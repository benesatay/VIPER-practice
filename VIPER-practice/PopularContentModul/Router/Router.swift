//
//  Router.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class Router: PresenterToRouterDelegate {
    static func createModule() -> PopularContentViewController {
        let presenter: ViewToPresenterDelegate & InteractorToPresenterDelegate = Presenter()
        let interactor: PresenterToInteractorDelegate = Interactor()
        let router: PresenterToRouterDelegate = Router()
        let view = PopularContentViewController()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return view
    }
}
