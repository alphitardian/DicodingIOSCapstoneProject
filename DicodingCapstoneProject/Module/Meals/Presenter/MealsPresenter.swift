//
//  MealsPresenter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 03/12/22.
//

import SwiftUI
import RxSwift

class MealsPresenter: ObservableObject {
    
    private let mealsRouter = MealsRouter()
    private let mealsUseCase: MealsUseCase
    private let disposeBag = DisposeBag()
    
    @Published var category: CategoryModel
    @Published var meals = [MealModel]()
    @Published var errorMessage = ""
    @Published var isLoading = false
    
    init(mealsUseCase: MealsUseCase) {
        self.mealsUseCase = mealsUseCase
        self.category = mealsUseCase.getCategory()
    }
    
    func getMeals() {
        isLoading = true
        mealsUseCase.getMeals(from: category.title)
            .observe(on: MainScheduler.instance)
            .subscribe { model in
                self.meals = model
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.isLoading = false
            }
            .disposed(by: disposeBag)
    }
}

/// Handle page routing
extension MealsPresenter {
    
    func detailLinkBuilder<Content: View>(
        for meal: MealModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        return NavigationLink {
            mealsRouter.goToDetail(for: meal)
        } label: {
            content()
        }
    }
}
