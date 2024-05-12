//
//  HomeViewModel.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

protocol HomeViewModelType: AnyObject {
    func showLoader()
    func stopLoader()
}

final class HomeViewModel: HomeViewModelType {
    private weak var router: RouterType?

    init(router: RouterType) {
        self.router = router
    }

    func showLoader() {
        self.router?.showLoader()
    }

    func stopLoader() {
        self.router?.stopLoader()
    }
}
