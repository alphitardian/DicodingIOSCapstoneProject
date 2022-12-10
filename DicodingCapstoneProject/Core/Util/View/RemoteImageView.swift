//
//  RemoteImageView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 03/12/22.
//

import Foundation

import SwiftUI
import Kingfisher

struct RemoteImageView: View {
    
    var url: URL?
    
    var body: some View {
        KFImage.url(url ?? URL(string: Constants.Placeholder.image))
            .placeholder { _ in
                ProgressView().tint(.white)
            }
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .resizable()
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView()
    }
}
