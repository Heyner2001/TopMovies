//
//  GetTopMoviesService.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

final class GetTopMoviesService: ServiceBase {
    init() {
        let request = Request(
            urlBase: "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1",
            method: ServiceMethod.GET,
            headers: nil
        )

        super.init(request: request)
    }
}
