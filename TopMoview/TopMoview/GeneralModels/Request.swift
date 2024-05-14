//
//  Request.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

struct Request {
    let urlBase: String
    let method: ServiceMethod
    let headers: [String: String]?
    var authRequired: Bool = true
}
