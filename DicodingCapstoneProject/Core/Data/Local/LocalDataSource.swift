//
//  LocalDataSource.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import Foundation
import RxSwift
import RealmSwift

protocol LocalDataSource {
    func getFavorites() -> Observable<[MealEntity]>
    func addFavorite(from meal: MealEntity) -> Observable<Bool>
    func removeFavorite(meal: MealEntity) -> Observable<Bool>
}

class LocalDataSourceImpl: NSObject {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let shared: (Realm?) -> LocalDataSourceImpl = { realm in
        return LocalDataSourceImpl(realm: realm)
    }
}

extension LocalDataSourceImpl: LocalDataSource {
    func getFavorites() -> Observable<[MealEntity]> {
        return Observable<[MealEntity]>.create { observer in
            if let realm = self.realm {
                let favorites = {
                    realm.objects(MealEntity.self)
                        .sorted(byKeyPath: "name")
                }()
                observer.onNext(favorites.toArray(ofType: MealEntity.self))
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    func addFavorite(from meal: MealEntity) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        realm.add(meal)
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
    
    func removeFavorite(meal: MealEntity) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    let predicate = NSPredicate(format: "id == %@", meal.id)
                    if let deletedMeal = realm.objects(MealEntity.self).filter(predicate).first {
                        try realm.write {
                            realm.delete(deletedMeal)
                            observer.onNext(true)
                            observer.onCompleted()
                        }
                    }
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}
