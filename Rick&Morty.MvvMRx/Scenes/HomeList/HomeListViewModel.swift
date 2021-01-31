//
//  HomeListViewModel.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeListInput {
    var bind : PublishRelay<Void> { get }
    var reloadData : PublishRelay<Void> { get }
}
protocol HomeListOutput {
    var characters : BehaviorRelay<[Character]> { get }
    var responseError : BehaviorRelay<Error?> { get }
}

final class HomeListViewModel : HomeListInput & HomeListOutput {
    
    private let disposeBag = DisposeBag()
    private let services : HomeListServiceProtocol?
    
    let bind = PublishRelay<Void>()
    let characters = BehaviorRelay<[Character]>(value: [])
    let responseError = BehaviorRelay<Error?>(value: nil)
    let reloadData = PublishRelay<Void>()
    
    init(services : HomeListServiceProtocol?) {
        self.services = services
        self.setUpData()
    }
    
    private func setUpData() {
        bind
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.loadCharacters()
            })
            .subscribe()
            .disposed(by: disposeBag)
        
        reloadData
            .observe(on: MainScheduler.instance)
            .do(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.characters.accept([])
                self.loadCharacters()
            })
            .subscribe()
            .disposed(by: disposeBag)
    }
    
    private func loadCharacters() {
        services?.getCharacters(completion: { [weak self] (response) in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.characters.accept(data.characters ?? [])
                break
            case .failure(let error):
                self.responseError.accept(error)
                break
            }
        })
    }
}
