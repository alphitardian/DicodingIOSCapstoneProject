//
//  DetailView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var presenter: DetailPresenter
    
    var body: some View {
        ZStack {
            if presenter.isLoading {
                ProgressView()
            } else {
                if let mealDetail = presenter.mealDetail {
                    ScrollView {
                        VStack(alignment: .leading) {
                            RemoteImageView(url: URL(string: mealDetail.thumbnail))
                                .frame(height: 300)
                                .aspectRatio(contentMode: .fill)
                            Text(mealDetail.name)
                                .bold()
                                .font(.title)
                                .padding(.horizontal)
                            Text("\(mealDetail.category) / \(mealDetail.area)")
                                .padding(.horizontal)
                            Button {
                                presenter.tutorialLinkBuilder()
                            } label: {
                                Text("Watch Tutorial")
                                    .frame(maxWidth: .infinity)
                            }
                            .cornerRadius(20)
                            .buttonStyle(.bordered)
                            .padding([.horizontal, .bottom])
                            Text("Instruction")
                                .bold()
                                .padding(.horizontal)
                            Text(mealDetail.instructions)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
        .navigationTitle("Instruction")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            Button {
                if presenter.isFavorite {
                    presenter.removeFavorite()
                } else {
                    presenter.addFavorite()
                }
            } label: {
                Image(systemName: presenter.isFavorite ? "star.fill" : "star")
            }
        }
        .onAppear {
            presenter.getMealDetail()
        }
    }
}
