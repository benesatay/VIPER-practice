//
//  Presenter.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class Presenter: ViewToPresenterDelegate {

    var view: PresenterToViewDelegate?
    
    var interactor: PresenterToInteractorDelegate?
    
    var router: PresenterToRouterDelegate?

    var selectedCount: Int?

    func startTofetchPopularTVContent() {
        interactor?.fetchPopularTVContent()
    }
    
    func startTofetchPopularMovieContent() {
        interactor?.fetchPopularMovieContent()
    }
    
    
}

extension Presenter: InteractorToPresenterDelegate {
    func fetchingSucceed(results: [Result]) {
        view?.onPopularContentResponseSuccess(results: results)
    }
    
    func fetchingFailed() {
        view?.onPopularContentResponseFailed(error: "error")
    }
}

extension Presenter {
    func createActionSheet(didSelected: @escaping () -> Void) -> UIAlertController {
        ///actions of sheet
        let textColor = UIColor(red: 15/255, green: 155/255, blue: 15/255, alpha: 1)
        let fiveItemButton = UIAlertAction(title: "5", style: .default) { (UIAlertAction) in
            self.selectedCount = 5
           didSelected()
        }
        fiveItemButton.setValue(textColor, forKey: "titleTextColor")

        let tenItemButton = UIAlertAction(title: "10", style: .default) { (UIAlertAction) in
            self.selectedCount = 10
            didSelected()
        }
        tenItemButton.setValue(textColor, forKey: "titleTextColor")

        let twentyItemButton = UIAlertAction(title: "20", style: .default) { (UIAlertAction) in
            self.selectedCount = 20
            didSelected()
        }
        twentyItemButton.setValue(textColor, forKey: "titleTextColor")

        let dismissButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        dismissButton.setValue(UIColor.systemRed, forKey: "titleTextColor")
        //set action sheet
        let actionSheet = UIAlertController(
            title: "Results",
            message: "Select the number of contents that you want to view.",
            preferredStyle: .actionSheet)
        actionSheet.addAction(fiveItemButton)
        actionSheet.addAction(tenItemButton)
        actionSheet.addAction(twentyItemButton)
        actionSheet.addAction(dismissButton)
        return actionSheet
    }

    func currentSegment(index: Int) {
        self.selectedCount = nil
        switch index {
        case 0:
            self.startTofetchPopularTVContent()
        case 1:
            self.startTofetchPopularMovieContent()
        default:
            self.startTofetchPopularTVContent()
        }
    }
}
