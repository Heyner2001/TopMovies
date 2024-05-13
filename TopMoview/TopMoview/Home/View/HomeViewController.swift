//
//  HomeViewController.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import UIKit

final class HomeViewController: UIViewController {
    var viewModel: HomeViewModelType?
    private let homeView = HomeView()

    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.cream
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpSubview()
        self.setUpConstraints()
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
