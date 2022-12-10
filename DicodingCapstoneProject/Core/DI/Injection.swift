//
//  Injection.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 01/12/22.
//

import Foundation
import RealmSwift

class Injection: NSObject {
    
    private func provideRepository() -> FoodRepository {
        let realm = try? Realm()
        let localDataSource = LocalDataSourceImpl.shared(realm)
        let remoteDataSource = RemoteDataSourceImpl.shared
        
        return FoodRepositoryImpl.shared(remoteDataSource, localDataSource)
    }
    
    func provideBrowseUseCase() -> BrowseUseCase {
        let repository = provideRepository()
        return BrowseInteractor(repository: repository)
    }
    
    func provideMealsUseCase(for category: CategoryModel) -> MealsUseCase {
        let repository = provideRepository()
        return MealsInteractor(repository: repository, category: category)
    }
    
    func provideDetailUseCase(for meal: MealModel) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, meal: meal)
    }
    
    func provideFavoriteUseCase() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
}
