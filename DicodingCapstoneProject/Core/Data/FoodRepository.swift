//
//  FoodRepository.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import Foundation
import RxSwift

protocol FoodRepository {
    func getCategories() -> Observable<[CategoryModel]>
    func getMeals(from category: String) -> Observable<[MealModel]>
    func getMealDetail(id: String) -> Observable<[MealDetailModel]>
    func searchMeals(from meal: String) -> Observable<[MealDetailModel]>
    func getFavorites() -> Observable<[FavoriteModel]>
    func addFavorite(meal: FavoriteModel) -> Observable<Bool>
    func removeFavorite(meal: FavoriteModel) -> Observable<Bool>
}

class FoodRepositoryImpl: NSObject {
    
    private let localDataSource: LocalDataSource
    private let remoteDataSource: RemoteDataSource
    
    private init(remote: RemoteDataSource, local: LocalDataSource) {
        remoteDataSource = remote
        localDataSource = local
    }
    
    static let shared = { remote, local in
        return FoodRepositoryImpl(remote: remote, local: local)
    }
}

extension FoodRepositoryImpl: FoodRepository {
    func getCategories() -> Observable<[CategoryModel]> {
        return remoteDataSource.getCategories()
            .map { response in
                response.mapToCategoryModel()
            }
            .filter { model in
                !model.isEmpty
            }
    }
    
    func getMeals(from category: String) -> Observable<[MealModel]> {
        return remoteDataSource.getMeals(from: category)
            .map { response in
                response.meals.map { response in
                    response.toMealModel()
                }
            }
            .filter { model in
                !model.isEmpty
            }
    }
    
    func getMealDetail(id: String) -> Observable<[MealDetailModel]> {
        return remoteDataSource.getMealDetail(id: id)
            .map { response in
                response.meals.map { response in
                    response.toMealDetailModel()
                }
            }
            .filter { model in
                !model.isEmpty
            }
    }
    
    func searchMeals(from meal: String) -> Observable<[MealDetailModel]> {
        return remoteDataSource.searchMeals(with: meal)
            .map { response in
                response.meals.map { response in
                    response.toMealDetailModel()
                }
            }
    }
    
    func getFavorites() -> Observable<[FavoriteModel]> {
        return localDataSource.getFavorites()
            .map { response in
                response.map { entity in
                    entity.toFavoriteModel()
                }
            }
    }
    
    func addFavorite(meal: FavoriteModel) -> Observable<Bool> {
        return localDataSource.addFavorite(from: meal.toMealEntity())
    }
    
    func removeFavorite(meal: FavoriteModel) -> Observable<Bool> {
        return localDataSource.removeFavorite(meal: meal.toMealEntity())
    }
}
