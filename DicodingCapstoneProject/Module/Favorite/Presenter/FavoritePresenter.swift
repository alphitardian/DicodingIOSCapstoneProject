//
//  FavoritePresenter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 06/12/22.
//

import SwiftUI
import RxSwift

class FavoritePresenter: ObservableObject {
    
    private let favoriteRouter = FavoriteRouter()
    private let favoriteUseCase: FavoriteUseCase
    private let disposeBag = DisposeBag()
    
    @Published var favorites = [FavoriteModel]()
    @Published var errorMessage = ""
    @Published var isLoading = false
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getFavorites() {
        isLoading = true
        favoriteUseCase.getFavorites()
            .observe(on: MainScheduler.instance)
            .subscribe { data in
                self.favorites = data
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.isLoading = false
            }
            .disposed(by: disposeBag)
    }
}

/// Handle page routing
extension FavoritePresenter {
    
    func detailLinkBuilder<Content: View>(
        for meal: MealModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        return NavigationLink {
            favoriteRouter.goToDetail(for: meal)
        } label: {
            content()
        }
    }
}
