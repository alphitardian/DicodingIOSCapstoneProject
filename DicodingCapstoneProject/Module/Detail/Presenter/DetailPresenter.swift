//
//  DetailPresenter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import Foundation
import RxSwift

class DetailPresenter: ObservableObject {
    
    private let detailRouter = DetailRouter()
    private let detailUseCase: DetailUseCase
    private let disposeBag = DisposeBag()
    
    @Published var selectedMeal: MealModel
    @Published var mealDetail: MealDetailModel?
    @Published var errorMessage = ""
    @Published var isLoading = false
    @Published var isFavorite = false
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        self.selectedMeal = detailUseCase.getMeal()
    }
    
    func getMealDetail() {
        isLoading = true
        detailUseCase.getMealDetail(for: selectedMeal.id)
            .observe(on: MainScheduler.instance)
            .subscribe { model in
                self.mealDetail = model.first
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.isLoading = false
                self.getFavorite()
            }
            .disposed(by: disposeBag)
    }
    
    func getFavorite() {
        detailUseCase.getFavorites()
            .observe(on: MainScheduler.instance)
            .subscribe { data in
                if let mealDetail = self.mealDetail {
                    self.isFavorite = data.contains { model in
                        model.id == mealDetail.toFavoriteModel().id
                    }
                }
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                print("Get favorite completed: \(self.isFavorite)")
            }
            .disposed(by: disposeBag)
    }
    
    func addFavorite() {
        isLoading = true
        if let mealDetail = mealDetail {
            detailUseCase.addFavorite(from: mealDetail)
                .observe(on: MainScheduler.instance)
                .subscribe { success in
                    print("Add success: \(success)")
                } onError: { error in
                    self.errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                } onCompleted: {
                    self.isLoading = false
                    self.isFavorite.toggle()
                }
                .disposed(by: disposeBag)
        }
    }
    
    func removeFavorite() {
        if let mealDetail = mealDetail {
            detailUseCase.removeFavorite(meal: mealDetail)
                .observe(on: MainScheduler.instance)
                .subscribe { success in
                    print("Add success: \(success)")
                } onError: { error in
                    self.errorMessage = error.localizedDescription
                    print(error.localizedDescription)
                } onCompleted: {
                    self.isLoading = false
                    self.isFavorite.toggle()
                }
                .disposed(by: disposeBag)
        }
    }
}

/// Handle Page Routing
extension DetailPresenter {
    
    func tutorialLinkBuilder() {
        if let mealDetail = mealDetail {
            detailRouter.goToTutorial(link: mealDetail.youtubeLink)
        }
    }
}
