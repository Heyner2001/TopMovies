//
//  HomeViewController.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import UIKit

final class HomeViewController: UIViewController {
    var viewModel: HomeViewModelType?

    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .gray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
