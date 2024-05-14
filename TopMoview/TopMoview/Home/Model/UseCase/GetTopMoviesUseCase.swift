//
//  GetTopMoviesUseCase.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 12/05/24.
//

import Foundation

final class GetTopMoviesUseCase {
    private let service: ServiceBase
    private let getImagesUseCase: GetImageUseCase?
    var onSuccess: (([MovieModel]?) -> ())?

    init(
        service: ServiceBase = GetTopMoviesService(),
        getImagesUseCase: GetImageUseCase = GetImageUseCase()
    ) {
        self.service = service
        self.getImagesUseCase = getImagesUseCase
    }
    
    func execute() {
        self.service.onSuccess = { [weak self] response in
            let moviePageModel = self?.parseObject(response: response)
            let movieModels: [MovieModel] = moviePageModel?.results ?? []

            self?.onSuccess?(movieModels)
        }

        self.service.startService()
    }

    private func parseObject(response: Data) -> MoviePageModel? {
        do {
            let movieModel = try JSONDecoder().decode(MoviePageModel.self, from: response)
            return movieModel
        } catch {
            return nil
        }
    }
}
