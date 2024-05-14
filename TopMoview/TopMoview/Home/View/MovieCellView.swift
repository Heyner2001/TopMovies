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
    
    private var movieNameContainerView: RoundedTagViewType = RoundedTagView()
    private var rateContainerView: RoundedTagViewType = RoundedTagView()
    private var dateContainerView: RoundedTagViewType = RoundedTagView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.setUpSubviews()
        self.setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundImageView.image = nil
        self.movieNameContainerView.removeSubviews()
        self.rateContainerView.removeSubviews()
        self.dateContainerView.removeSubviews()
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

    func setupCellData(_ model: MovieModel) {
        self.backgroundImageView.image = model.backdropImage
        self.movieNameContainerView.insertLabel(model.name)
        self.rateContainerView.insertLabel("Rate: \(model.rate)")
        self.dateContainerView.insertLabel(model.releaseDate)
    }
}
