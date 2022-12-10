//
//  FavoriteInteractor.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 05/12/22.
//

import Foundation
import RxSwift

protocol FavoriteUseCase {
    func getFavorites() -> Observable<[FavoriteModel]>
}

class FavoriteInteractor: FavoriteUseCase {
    
    private let repository: FoodRepository
    
    init(repository: FoodRepository) {
        self.repository = repository
    }
    
    func getFavorites() -> Observable<[FavoriteModel]> {
        return repository.getFavorites()
    }
}
