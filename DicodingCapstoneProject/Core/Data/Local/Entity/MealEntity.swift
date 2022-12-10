//
//  MealEntity.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import Foundation
import RealmSwift

class MealEntity: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var area: String = ""
    @objc dynamic var instruction: String = ""
    @objc dynamic var thumbnail: String = ""
    @objc dynamic var youtubeLink: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension MealEntity {
    
    func toFavoriteModel() -> FavoriteModel {
        return FavoriteModel(
            id: self.id,
            name: self.name,
            category: self.category,
            area: self.area,
            instruction: self.instruction,
            thumbnail: self.thumbnail,
            youtubeLink: self.youtubeLink
        )
    }
}
