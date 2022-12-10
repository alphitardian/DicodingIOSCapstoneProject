//
//  MealsView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 03/12/22.
//

import SwiftUI

struct MealsView: View {
    
    @ObservedObject var presenter: MealsPresenter
    
    var body: some View {
        ZStack {
            if presenter.isLoading {
                ProgressView()
            } else {
                ScrollView {
                    ForEach(presenter.meals) { meal in
                        presenter.detailLinkBuilder(for: meal) {
                            MealCardView(meal: meal, category: presenter.category)
                        }
                        .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationTitle("Meals")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            presenter.getMeals()
        }
    }
}
