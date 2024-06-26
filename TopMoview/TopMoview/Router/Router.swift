//
//  Router.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import UIKit

protocol RouterType {
    var navigationController: UINavigationController { get }

    func showLoader()
    func stopLoader()
}

final class Router: RouterType {
    let navigationController: UINavigationController
    private var loaderView: UIView?

    init(rootViewController: UIViewController) {
        self.navigationController = UINavigationController(rootViewController: rootViewController)
        self.navigationController.navigationBar.backgroundColor = UIColor.navyBlue
        self.navigationController.navigationBar.tintColor = UIColor.white
    }

    func showLoader() {
        print("Showing Loader")
    }
    
    func stopLoader() {
        print("Loader Stopped")
    }
}
