//
//  HomeListServiceProtocol.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import RxSwift

protocol HomeListServiceProtocol : AnyObject {
    func getCharacters(completion: @escaping ((Result<CharacterResponse, Error>) -> Void))
}
