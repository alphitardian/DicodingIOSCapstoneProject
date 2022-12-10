//
//  FavoriteModel.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 05/12/22.
//

import Foundation

struct FavoriteModel: Identifiable {
    var id: String
    var name: String
    var category: String
    var area: String
    var instruction: String
    var thumbnail: String
    var youtubeLink: String
}

extension FavoriteModel {
    
    func toMealEntity() -> MealEntity {
        let entity = MealEntity()
        entity.id = self.id
        entity.name = self.name
        entity.category = self.category
        entity.area = self.area
        entity.thumbnail = self.thumbnail
        entity.instruction = self.instruction
        entity.youtubeLink = self.youtubeLink
        return entity
    }
    
    func toMealModel() -> MealModel {
        return MealModel(
            id: self.id,
            name: self.name,
            thumbnail: self.thumbnail
        )
    }
    
    func toCategoryModel() -> CategoryModel {
        return CategoryModel(
            id: self.id,
            title: self.category,
            image: self.thumbnail,
            description: self.category
        )
    }
}
