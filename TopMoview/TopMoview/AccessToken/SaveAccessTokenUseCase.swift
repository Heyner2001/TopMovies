//
//  SaveAccessTokenUseCase.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

final class SaveAccessTokenUseCase: AccessTokenUseCaseType<Void> {

    init(keyChainUseCase: KeyChainUseCaseType) {
        super.init()
        self.keyChainUseCase = keyChainUseCase
    }

    override func execute() {
        guard self.keyChainUseCase?.loadString(account: self.account) == nil else {
            return
        }

        let token = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3OWU0MzQyNjg1MTAzNWMyYmUxYThmYzY5YzlhMTJkNCIsInN1YiI6IjYwZGZhODA1MjdmZjk5MDA0NzA1OGNhNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NrCOXL80cDogApaEc1h76kOfEgjFGXpBBvuI0NV67kA"
        self.keyChainUseCase?.saveString(account: self.account, value: token)
        return
    }
}
