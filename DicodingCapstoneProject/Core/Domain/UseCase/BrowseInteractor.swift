//
//  BrowseInteractor.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 01/12/22.
//

import Foundation
import RxSwift

protocol BrowseUseCase {
    func getCategories() -> Observable<[CategoryModel]>
    func searchMeals(from meal: String) -> Observable<[MealDetailModel]>
}

class BrowseInteractor: BrowseUseCase {
    
    private let repository: FoodRepository
    
    required init(repository: FoodRepository) {
        self.repository = repository
    }
    
    func getCategories() -> Observable<[CategoryModel]> {
        return repository.getCategories()
    }
    
    func searchMeals(from meal: String) -> Observable<[MealDetailModel]> {
        return repository.searchMeals(from: meal)
    }
}
