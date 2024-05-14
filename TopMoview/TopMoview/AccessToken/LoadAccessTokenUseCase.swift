//
//  LoadAccessTokenUseCase.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

final class LoadAccessTokenUseCase: AccessTokenUseCaseType<String> {
    init(keyChainUseCase: KeyChainUseCaseType) {
        super.init()
        self.keyChainUseCase = keyChainUseCase
    }

    override func execute() -> String {
        guard let token = self.keyChainUseCase?.loadString(account: self.account) else {
            return ""
        }

        return token
    }
}
