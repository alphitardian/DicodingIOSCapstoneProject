//
//  DetailInteractor.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import Foundation
import RxSwift

protocol DetailUseCase {
    func getMealDetail(for id: String) -> Observable<[MealDetailModel]>
    func getMeal() -> MealModel
    func getFavorites() -> Observable<[FavoriteModel]>
    func addFavorite(from meal: MealDetailModel) -> Observable<Bool>
    func removeFavorite(meal: MealDetailModel) -> Observable<Bool>
}

class DetailInteractor: DetailUseCase {
    
    private let repository: FoodRepository
    private let meal: MealModel
    
    init(repository: FoodRepository, meal: MealModel) {
        self.repository = repository
        self.meal = meal
    }
    
    func getMealDetail(for id: String) -> Observable<[MealDetailModel]> {
        return repository.getMealDetail(id: id)
    }
    
    func getMeal() -> MealModel {
        return meal
    }
    
    func getFavorites() -> Observable<[FavoriteModel]> {
        return repository.getFavorites()
    }
    
    func addFavorite(from meal: MealDetailModel) -> Observable<Bool> {
        return repository.addFavorite(meal: meal.toFavoriteModel())
    }
    
    func removeFavorite(meal: MealDetailModel) -> Observable<Bool> {
        return repository.removeFavorite(meal: meal.toFavoriteModel())
    }
}
