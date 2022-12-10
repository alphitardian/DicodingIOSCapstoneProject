//
//  MealsRouter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import SwiftUI

class MealsRouter {
    
    func goToDetail(for meal: MealModel) -> some View {
        let detailUseCase = Injection.init().provideDetailUseCase(for: meal)
        let detailPresenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: detailPresenter)
    }
}
