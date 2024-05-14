//
//  GetImageService.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 13/05/24.
//

import UIKit

final class GetImageService: ServiceBase {
    init() {
        let request = Request(
            urlBase: "https://image.tmdb.org/t/p/w500",
            method: ServiceMethod.GET,
            headers: nil,
            authRequired: true
        )
        
        super.init(request: request)
    }
}
