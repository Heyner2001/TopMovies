//
//  HomeViewModel.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

protocol HomeViewModelType {
    var viewController: HomeViewControllerType? { get set }

    func navigateToDetail(index: Int)
    func getMovies()
}

final class HomeViewModel: HomeViewModelType {
    var viewController: HomeViewControllerType?
    var router: RouterType?
    private let getMoviesUseCase: GetTopMoviesUseCase?
    private var movieModels: [MovieModel] = []
    
    
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
            self?.movieModels = movies
            self?.viewController?.refreshTableViewData(movies)
        }
        self.getMoviesUseCase?.execute()
    }

    func navigateToDetail(index: Int) {
        self.router?.goToDetail(movieModel: self.movieModels[index])
    }
}
