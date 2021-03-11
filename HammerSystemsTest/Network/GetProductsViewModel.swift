//
//  GetProductsViewModel.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import Moya

class TopProductsViewModel {
    
    // MARK: - Private properties
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin()])
    
    // MARK: - Public funcs
    func getTopProductsInRussia(onSuccess: @escaping (TopProductsModel)->Void) {
        _ = provider.rx.request(.getTopProductsInRussia).subscribe { event in
            switch event {
            case let .success(response):
                if let data = try? response.map(TopProductsModel.self) {
//                    dump(data)
                    onSuccess(data)
                } else {
                    print("Can't to parse")
                }
            case let .error(error):
                print(error)
                AppLibrary.shared().showErrorMessage(error.localizedDescription)
            }
        }
    }
}
