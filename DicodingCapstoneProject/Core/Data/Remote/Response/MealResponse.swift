//
//  MealResponse.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import Foundation

struct MealResponse: Codable, Identifiable {
    var id: String
    var name: String
    var thumbnail: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case thumbnail = "strMealThumb"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
    }
}

extension MealResponse {
    func toMealModel() -> MealModel {
        return MealModel(
            id: self.id,
            name: self.name,
            thumbnail: self.thumbnail
        )
    }
}

struct MealDetailResponse: Codable, Identifiable {
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var thumbnail: String
    var youtubeLink: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case youtubeLink = "strYoutube"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
        self.area = try container.decode(String.self, forKey: .area)
        self.instructions = try container.decode(String.self, forKey: .instructions)
        self.thumbnail = try container.decode(String.self, forKey: .thumbnail)
        self.youtubeLink = try container.decode(String.self, forKey: .youtubeLink)
    }
}

extension MealDetailResponse {
    func toMealDetailModel() -> MealDetailModel {
        return MealDetailModel(
            id: self.id,
            name: self.name,
            category: self.category,
            area: self.area,
            instructions: self.instructions,
            thumbnail: self.thumbnail,
            youtubeLink: self.youtubeLink
        )
    }
}
