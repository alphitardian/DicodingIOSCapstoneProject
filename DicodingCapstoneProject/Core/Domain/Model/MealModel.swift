//
//  MealModel.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 01/12/22.
//

import Foundation

struct MealModel: Identifiable, Codable {
    var id: String
    var name: String
    var thumbnail: String
}

struct MealDetailModel: Identifiable, Codable {
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var thumbnail: String
    var youtubeLink: String
}

extension MealDetailModel {
    
    func toFavoriteModel() -> FavoriteModel {
        return FavoriteModel(
            id: self.id,
            name: self.name,
            category: self.category,
            area: self.area,
            instruction: self.instructions,
            thumbnail: self.thumbnail,
            youtubeLink: self.youtubeLink
        )
    }
    
    func toMealModel() -> MealModel {
        return MealModel(
            id: self.id,
            name: self.name,
            thumbnail: self.thumbnail
        )
    }
    
    func toCategorySearchModel() -> CategoryModel {
        return CategoryModel(
            id: self.id,
            title: self.name,
            image: self.thumbnail,
            description: self.instructions
        )
    }
}
