//
//  BrowsePresenter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 03/12/22.
//

import SwiftUI
import RxSwift

class BrowsePresenter: ObservableObject {
    
    private let browseRouter = BrowseRouter()
    private let browseUseCase: BrowseUseCase
    private let disposeBag = DisposeBag()
    
    @Published var categories = [CategoryModel]()
    @Published var searchedMeals = [MealDetailModel]()
    @Published var errorMessage = ""
    @Published var isLoading = false
    @Published var searchText = ""
    
    init(browseUseCase: BrowseUseCase) {
        self.browseUseCase = browseUseCase
    }
    
    func getCategories() {
        isLoading = true
        browseUseCase.getCategories()
            .observe(on: MainScheduler.instance)
            .subscribe { model in
                self.categories = model
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.isLoading = false
            }
            .disposed(by: disposeBag)
    }
    
    func searchMeals() {
        isLoading = true
        browseUseCase.searchMeals(from: searchText)
            .observe(on: MainScheduler.instance)
            .subscribe { data in
                self.searchedMeals = data
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.isLoading = false
            }
            .disposed(by: disposeBag)
    }
}

/// Handle page routing
extension BrowsePresenter {
    
    func mealsLinkBuilder<Content: View>(
        for category: CategoryModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        return NavigationLink {
            browseRouter.goToMeals(for: category)
        } label: {
            content()
        }
    }
    
    func detailLinkBuilder<Content: View>(
        for meal: MealModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        return NavigationLink {
            browseRouter.goToDetail(for: meal)
        } label: {
            content()
        }
    }
}
