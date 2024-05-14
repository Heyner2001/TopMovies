//
//  ServiceBase.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

class ServiceBase {
    private let request: Request
    private var urlRequest: URLRequest?
    
    var onSuccess: ((Data) -> ())?
    var onFailue: ((Error) -> ())?

    let accessTokenUseCase: AccessTokenUseCaseType<String>

    init(
        request: Request,
        accessTokenUseCase: AccessTokenUseCaseType<String> = LoadAccessTokenUseCase(
            keyChainUseCase: KeyChainUseCase()
        )
    ) {
        self.request = request
        self.accessTokenUseCase = accessTokenUseCase
        self.setuRequest()
    }

    private func setuRequest() {
        guard let url = URL(string: self.request.urlBase) else {
            preconditionFailure("The urlBase must be a valid url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = self.request.method.rawValue
        
        if self.request.authRequired {
            request.setValue(self.getAuthToken(), forHTTPHeaderField: "Authorization")
        }

        if let headers = self.request.headers {
            headers.forEach { key, value in
                request.setValue(key, forHTTPHeaderField: value)
            }
        }

        self.urlRequest = request
    }

    private func getAuthToken() -> String {
        let accessToken = self.accessTokenUseCase.execute()
        return "Bearer \(accessToken)"
    }

    func startService() {
        let session = URLSession.shared
        guard let urlRequest = self.urlRequest else {
            return
        }

        let task = session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            if let error {
                print("There was an error during request execution:")
                print(error)
                self?.onFailue?(error)
                return
            }

            guard let data else {
                print("Without data response")
                return
            }

            self?.onSuccess?(data)
        }

        task.resume()
    }
}
