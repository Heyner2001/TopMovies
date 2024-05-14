//
//  GetImageUseCase.swift
//  TopMoview
//
//  Created by Heyner Rodriguez on 13/05/24.
//

import UIKit

final class GetImageUseCase {
    private let service: ServiceBase
    var onSuccess: ((UIImage?) -> ())?

    init(service: ServiceBase = GetImageService()) {
        self.service = service
    }

    func execute() {
        self.service.onSuccess = { [weak self] result in
            self?.onSuccess?(UIImage(data: result))
        }

        self.service.startService()
    }
}
