//
//  BrowseRouter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 03/12/22.
//

import SwiftUI

class BrowseRouter {
    
    func goToMeals(for category: CategoryModel) -> some View {
        let mealsUseCase = Injection.init().provideMealsUseCase(for: category)
        let mealsPresenter = MealsPresenter(mealsUseCase: mealsUseCase)
        return MealsView(presenter: mealsPresenter)
    }
    
    func goToDetail(for meal: MealModel) -> some View {
        let detailUseCase = Injection.init().provideDetailUseCase(for: meal)
        let detailPresenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: detailPresenter)
    }
}
