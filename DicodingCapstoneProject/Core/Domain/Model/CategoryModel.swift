//
//  CategoryModel.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 01/12/22.
//

import Foundation

struct CategoryModel: Identifiable, Codable {
    var id: String
    var title: String
    var image: String
    var description: String
}
