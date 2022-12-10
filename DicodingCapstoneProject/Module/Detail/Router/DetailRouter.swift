//
//  DetailRouter.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 04/12/22.
//

import SwiftUI

class DetailRouter {
    
    func goToTutorial(link: String) {
        if let url = URL(string: link), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
