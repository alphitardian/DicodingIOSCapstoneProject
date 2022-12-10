//
//  BrowseView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import SwiftUI

struct BrowseView: View {
    
    @ObservedObject var presenter: BrowsePresenter
    
    init(presenter: BrowsePresenter) {
        self.presenter = presenter
    }
    
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ZStack {
                if presenter.isLoading {
                    ProgressView()
                } else {
                    if presenter.searchText.isEmpty {
                        ScrollView {
                            LazyVGrid(columns: twoColumnGrid, spacing: 12) {
                                ForEach(presenter.categories) { category in
                                    presenter.mealsLinkBuilder(for: category) {
                                        BrowseGridView(category: category)
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.horizontal, 8)
                    } else {
                        ScrollView {
                            LazyVGrid(columns: twoColumnGrid, spacing: 12) {
                                ForEach(presenter.searchedMeals) { meal in
                                    presenter.detailLinkBuilder(for: meal.toMealModel()) {
                                        BrowseGridView(category: meal.toCategorySearchModel())
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Browse")
        }
        .onAppear {
            if presenter.categories.isEmpty {
                presenter.getCategories()
            }
        }
        .refreshable {
            presenter.getCategories()
        }
        .searchable(text: $presenter.searchText)
        .onReceive(presenter.$searchText.debounce(for: 1, scheduler: RunLoop.main)) { _ in
            presenter.searchMeals()
        }
    }
}
