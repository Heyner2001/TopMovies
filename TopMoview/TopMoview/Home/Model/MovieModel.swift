//
//  MovieModel.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation
import UIKit

struct MovieModel: Codable {
    var name: String = ""
    var backdropPath: String = ""
    var posterPath: String = ""
    var rate: Double = 0.0
    var releaseDate: String = ""
    var overview: String = ""
    var backdropImage: UIImage?
    var posterImage: UIImage?

    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.name = try container.decode(String.self, forKey: CodingKeys.name)
            self.backdropPath = try container.decode(String.self, forKey: CodingKeys.backdropPath)
            self.posterPath = try container.decode(String.self, forKey: CodingKeys.posterPath)
            self.rate = try container.decode(Double.self, forKey: CodingKeys.rate)
            self.releaseDate = try container.decode(String.self, forKey: CodingKeys.releaseDate)
            self.overview = try container.decode(String.self, forKey: CodingKeys.overview)
        } catch {
            print(error)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case name = "title"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case rate = "vote_average"
        case releaseDate = "release_date"
        case overview
    }
}
