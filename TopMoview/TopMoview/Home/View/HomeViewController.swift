//
//  HomeViewController.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import UIKit

protocol HomeViewControllerType {
    func refreshTableViewData(_ movies: [MovieModel])
}

final class HomeViewController: UIViewController, HomeViewControllerType {
    private var viewModel: HomeViewModelType?
    private lazy var homeView = HomeView(delegate: self)

    init(viewModel: HomeViewModelType?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.cream
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSubview()
        self.setUpConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.getMovies()
    }

    func refreshTableViewData(_ movies: [MovieModel]) {
        self.homeView.moviesModel = movies
        self.homeView.updateTableViewData()
    }

    private func setUpSubview() {
        self.view.addSubview(self.homeView)
    }
    
    private func setUpConstraints() {
        let homeViewConstraints = [
            self.homeView.leftAnchor.constraint(
                equalTo: self.view.leftAnchor,
                constant: 16
            ),
            self.homeView.rightAnchor.constraint(
                equalTo: self.view.rightAnchor,
                constant: -16
            ),
            self.homeView.topAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.topAnchor,
                constant: 16
            ),
            self.homeView.bottomAnchor.constraint(
                equalTo: self.view.bottomAnchor,
                constant: -16
            )
        ]
        
        NSLayoutConstraint.activate(homeViewConstraints)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeViewController: HomeViewDelegate {
    func navigateToDetail(index: Int) {
        self.viewModel?.navigateToDetail(index: index)
    }
}
