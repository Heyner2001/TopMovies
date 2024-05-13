//
//  MovieCellView.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import UIKit

final class MovieCellView: UITableViewCell {
    static let identifier = "MovieCellView"

    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.silver
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private var movieNameContainerView: UIView = UIView()
    private var rateContainerView: UIView = UIView()
    private var dateContainerView: UIView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpSubviews() {
        self.contentView.addSubview(self.backgroundImageView)
        self.backgroundImageView.addSubview(self.movieNameContainerView)
        self.backgroundImageView.addSubview(self.rateContainerView)
        self.backgroundImageView.addSubview(self.dateContainerView)
    }

    private func setUpConstraints() {
        let backgroundImageViewConstraints = [
            self.backgroundImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.backgroundImageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.backgroundImageView.topAnchor.constraint(
                equalTo: self.contentView.topAnchor,
                constant: 4
            ),
            self.backgroundImageView.bottomAnchor.constraint(
                equalTo: self.contentView.bottomAnchor,
                constant: -4
            ),
            self.backgroundImageView.heightAnchor.constraint(equalToConstant: 160)
        ]
        
        let movieNameContainerViewConstraints = [
            self.movieNameContainerView.leftAnchor.constraint(
                equalTo: self.backgroundImageView.leftAnchor,
                constant: 8
            ),
            self.movieNameContainerView.topAnchor.constraint(
                equalTo: self.backgroundImageView.topAnchor,
                constant: 8
            )
        ]

        let rateContainerViewConstraints = [
            self.rateContainerView.leftAnchor.constraint(
                equalTo: self.backgroundImageView.leftAnchor,
                constant: 8
            ),
            self.rateContainerView.bottomAnchor.constraint(
                equalTo: self.backgroundImageView.bottomAnchor,
                constant: -8
            )
        ]

        let dateContainerViewConstraints = [
            self.dateContainerView.rightAnchor.constraint(
                equalTo: self.backgroundImageView.rightAnchor,
                constant: -8
            ),
            self.dateContainerView.bottomAnchor.constraint(
                equalTo: self.backgroundImageView.bottomAnchor,
                constant: -8
            )
        ]

        NSLayoutConstraint.activate(
            backgroundImageViewConstraints +
            movieNameContainerViewConstraints +
            rateContainerViewConstraints +
            dateContainerViewConstraints
        )
    }

    private func createLabelView(text: String) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.whiteSmoke
        view.alpha = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.font = UIFont.elegantTypeWriterFont(weidth: .regular, size: 14)
        label.textColor = UIColor.navyBlue
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        let containerVerticalInset = 4.0
        let containerHorizontalInset = 6.0
        
        view.addSubview(label)
        label.sizeToFit()
        view.layer.cornerRadius = (label.frame.height + containerVerticalInset * 2) / 2
        
        label.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: containerHorizontalInset
        ).isActive = true
        label.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -containerHorizontalInset
        ).isActive = true
        label.topAnchor.constraint(
            equalTo: view.topAnchor,
            constant: containerVerticalInset
        ).isActive = true
        label.bottomAnchor.constraint(
            equalTo: view.bottomAnchor,
            constant: -containerVerticalInset
        ).isActive = true

        return view
    }

    func setupCellData(_ model: ShortMovieModel) {
        self.movieNameContainerView = self.createLabelView(text: model.name)
        self.rateContainerView = self.createLabelView(text: "Rate")
        self.dateContainerView = self.createLabelView(text: model.date)
        self.setUpSubviews()
        self.setUpConstraints()
    }
}
