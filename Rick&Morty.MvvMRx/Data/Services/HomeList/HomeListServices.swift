//
//  HomeListServices.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import RxSwift

class HomeListServices : HomeListServiceProtocol {
    let disposeBag = DisposeBag()

    func getCharacters(completion: @escaping ((Result<CharacterResponse, Error>) -> Void)) {
        API(endPoint: .getCharacters)
            .request()
            .observe(on: MainScheduler.instance).subscribe(onNext: { (response) in
                completion(.success(response))
            }, onError: { (error) in
                completion(.failure(error))
            }).disposed(by: disposeBag)
    }
}
