//
//  HomeView.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import UIKit

final class HomeView: UIView {
    var moviesModel: [MovieModel]?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TopMovies"
        label.textColor = UIColor.navyBlue
        label.font = UIFont.elegantTypeWriterFont(weidth: .bold, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 160
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCellView.self, forCellReuseIdentifier: MovieCellView.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        self.setUpSubviews()
        self.setUpConstraints()
    }

    private func setUpSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.moviesTableView)
    }

    private func setUpConstraints() {
        let titleLabelConstraints = [
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor)
        ]
        
        let moviesTableViewContraints = [
            self.moviesTableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.moviesTableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.moviesTableView.topAnchor.constraint(
                equalTo: self.titleLabel.bottomAnchor,
                constant: 16
            ),
            self.moviesTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ]

        NSLayoutConstraint.activate(
            titleLabelConstraints +
            moviesTableViewContraints
        )

        self.titleLabel.sizeToFit()
    }

    func updateTableViewData() {
        DispatchQueue.main.async { [weak self] in
            self?.moviesTableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.moviesModel?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieCellView.identifier,
            for: indexPath)
        guard let movieCellView = cell as? MovieCellView,
                let moviesModel = self.moviesModel?[indexPath.row] else {
            return UITableViewCell()
        }

        movieCellView.setupCellData(moviesModel)
        return movieCellView
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
