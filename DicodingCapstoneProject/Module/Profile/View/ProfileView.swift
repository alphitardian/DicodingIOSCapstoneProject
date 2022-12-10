//
//  ProfileView.swift
//  DicodingCapstoneProject
//
//  Created by Ardian Pramudya Alphita on 08/12/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("profil")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
                    .padding(.bottom)
                Text("Ardian Pramudya Alphita")
                    .bold()
                    .font(.title)
                Text("iOS Developer")
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
