//
//  MealCardView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import SwiftUI

struct MealCardView: View {
    
    let meal: MealModel
    let category: CategoryModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RemoteImageView(url: URL(string: meal.thumbnail))
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
            LinearGradient(
                gradient: Gradient(
                    colors: [.clear, .black.opacity(0.8)]
                ),
                startPoint: .top, endPoint: .bottom
            )
            VStack(alignment: .leading) {
                Text(category.title)
                    .foregroundColor(.white)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 8)
                    .background(Color.blue)
                    .cornerRadius(8)
                Text(meal.name)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .bold()
                    .font(.title)
                    .padding(.top, -2)
            }
            .padding([.leading, .bottom])
        }
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct MealCardView_Previews: PreviewProvider {
    
    static let meal = MealModel(id: "", name: "Chocolate Ice Cream", thumbnail: "")
    static let category = CategoryModel(id: "", title: "Dessert", image: "", description: "Sweet things")
    
    static var previews: some View {
        MealCardView(meal: meal, category: category)
    }
}
