//
//  RoundedTagView.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 13/05/24.
//

import UIKit
protocol RoundedTagViewType: UIView {
    func insertLabel(_ text: String)
    func insertSubview(_ view: UIView)
    func removeSubviews()
}

class RoundedTagView: UIView, RoundedTagViewType {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteSmoke
        self.alpha = 0.8
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func insertLabel(_ text: String) {
        guard self.subviews.count < 1 else {
            return
        }

        let label = UILabel()
        label.font = UIFont.elegantTypeWriterFont(weidth: .regular, size: 14)
        label.textColor = UIColor.navyBlue
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        self.setupConstraints(view: label)
        self.updateConstraintsIfNeeded()
    }

    func insertSubview(_ view: UIView) {
        guard self.subviews.count < 1 else {
            return
        }

        self.setupConstraints(view: view)
        self.updateConstraintsIfNeeded()
    }

    private func setupConstraints(view: UIView) {
        self.addSubview(view)

        let containerVerticalInset = 4.0
        let containerHorizontalInset = 6.0
        
        self.layer.cornerRadius = (view.frame.height + containerVerticalInset * 2) / 2
        
        view.leftAnchor.constraint(
            equalTo: self.leftAnchor,
            constant: containerHorizontalInset
        ).isActive = true
        view.rightAnchor.constraint(
            equalTo: self.rightAnchor,
            constant: -containerHorizontalInset
        ).isActive = true
        view.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: containerVerticalInset
        ).isActive = true
        view.bottomAnchor.constraint(
            equalTo: self.bottomAnchor,
            constant: -containerVerticalInset
        ).isActive = true
    }

    func removeSubviews() {
        self.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}
