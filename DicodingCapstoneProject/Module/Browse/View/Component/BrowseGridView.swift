//
//  BrowseGridView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 28/11/22.
//

import SwiftUI

struct BrowseGridView: View {
    
    let category: CategoryModel
    
    var body: some View {
        VStack {
            RemoteImageView(url: URL(string: category.image))
                .frame(width: UIScreen.main.bounds.width / 2 - 18, height: 165)
                .aspectRatio(contentMode: .fill)
            Text(category.title)
                .lineLimit(1)
                .padding()
        }
        .cornerRadius(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray, lineWidth: 1)
        }
    }
}

struct BrowseGridView_Previews: PreviewProvider {
    
    static let category = CategoryModel(
        id: "",
        title: "Chicken Steak",
        image: "",
        description: "Tender chicken steak"
    )
    
    static var previews: some View {
        BrowseGridView(category: category)
    }
}
