//
//  MealsInteractor.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import Foundation
import RxSwift

protocol MealsUseCase {
    func getMeals(from category: String) -> Observable<[MealModel]>
    func getCategory() -> CategoryModel
}

class MealsInteractor: MealsUseCase {
    
    private let repository: FoodRepository
    private let category: CategoryModel
    
    required init(repository: FoodRepository, category: CategoryModel) {
        self.repository = repository
        self.category = category
    }
    
    func getMeals(from category: String) -> Observable<[MealModel]> {
        return repository.getMeals(from: category)
    }
    
    func getCategory() -> CategoryModel {
        return category
    }
}
