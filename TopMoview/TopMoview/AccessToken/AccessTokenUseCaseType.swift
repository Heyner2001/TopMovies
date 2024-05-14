//
//  AccessTokenUseCaseType.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

class AccessTokenUseCaseType<T> {
    var account: String = "TopMovies.DevelopmentToken"
    var keyChainUseCase: KeyChainUseCaseType?
    
    func execute() -> T {
        preconditionFailure("This method must be overrided")
    }
}
