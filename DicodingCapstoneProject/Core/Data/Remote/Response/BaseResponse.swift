//
//  BaseResponse.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import Foundation

struct BaseCategoryResponse: Codable {
    var categories: [CategoryResponse]
}

extension BaseCategoryResponse {
    
    func mapToCategoryModel() -> [CategoryModel] {
        return self.categories.map { response in
            response.toCategoryModel()
        }
    }
}

struct BaseMealResponse<T: Codable>: Codable {
    var meals: [T]
}
