//
//  RemoteDataSource.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSource: AnyObject {
    func getCategories() -> Observable<BaseCategoryResponse>
    func getMeals(from category: String) -> Observable<BaseMealResponse<MealResponse>>
    func getMealDetail(id: String) -> Observable<BaseMealResponse<MealDetailResponse>>
    func searchMeals(with meal: String) -> Observable<BaseMealResponse<MealDetailResponse>>
}

class RemoteDataSourceImpl: NSObject {
    
    private override init() {}
    
    static let shared = RemoteDataSourceImpl()
}

extension RemoteDataSourceImpl: RemoteDataSource {
    func getCategories() -> Observable<BaseCategoryResponse> {
        return Observable<BaseCategoryResponse>.create { observer in
            if let url = URL(string: Endpoints.Gets.categories.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: BaseCategoryResponse.self) { response in
                        switch response.result {
                        case .success(let data):
                            observer.onNext(data)
                            observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
            }
            
            return Disposables.create()
        }
    }
    
    func getMeals(from category: String) -> Observable<BaseMealResponse<MealResponse>> {
        return Observable<BaseMealResponse<MealResponse>>.create { observer in
            if let url = URL(string: "\(Endpoints.Gets.meals.url)\(category)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: BaseMealResponse<MealResponse>.self) { response in
                        switch response.result {
                        case .success(let data):
                            observer.onNext(data)
                            observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
            }
            
            return Disposables.create()
        }
    }
    
    func getMealDetail(id: String) -> Observable<BaseMealResponse<MealDetailResponse>> {
        return Observable<BaseMealResponse<MealDetailResponse>>.create { observer in
            if let url = URL(string: "\(Endpoints.Gets.meal.url)\(id)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: BaseMealResponse<MealDetailResponse>.self) { response in
                        switch response.result {
                        case .success(let data):
                            observer.onNext(data)
                            observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
            }
            
            return Disposables.create()
        }
    }
    
    func searchMeals(with meal: String) -> Observable<BaseMealResponse<MealDetailResponse>> {
        return Observable<BaseMealResponse<MealDetailResponse>>.create { observer in
            if let url = URL(string: "\(Endpoints.Gets.search.url)\(meal)") {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: BaseMealResponse<MealDetailResponse>.self) { response in
                        switch response.result {
                        case .success(let data):
                            observer.onNext(data)
                            observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                        }
                    }
            }
            
            return Disposables.create()
        }
    }
}
