//
//  HomeViewModel.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

protocol HomeViewModelType {
    var viewController: HomeViewControllerType? { get set }

    func showLoader()
    func stopLoader()
    func getMovies()
}

final class HomeViewModel: HomeViewModelType {
    var viewController: HomeViewControllerType?
    var router: RouterType?
    private let getMoviesUseCase: GetTopMoviesUseCase?
    
    
    init(
        getMoviesUseCase: GetTopMoviesUseCase = GetTopMoviesUseCase()) {
        self.getMoviesUseCase = getMoviesUseCase
    }

    func getMovies() {
        self.getMoviesUseCase?.onSuccess = { [weak self] moviesModel in
            guard let movies = moviesModel else {
                // TODO: Error case that need be handler
                return
            }

            self?.viewController?.refreshTableViewData(movies)
        }
        self.getMoviesUseCase?.execute()
        
        
        
    }

    func showLoader() {
        self.router?.showLoader()
    }

    func stopLoader() {
        self.router?.stopLoader()
    }
}
