//
//  ContentView.swift
//  Recipe Chef
//
//  Created by John Jeang on 3/19/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model :RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment:.leading) {
                
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top, 15)
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes){r in
                            NavigationLink(
                                destination: RecipeDetailsView(recipe: r),
                                label: {
                                    HStack(spacing: 10){
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width :50, height :60)
                                            .clipped()
                                            .cornerRadius(10)
                                        Text(r.name)
                                            .foregroundColor(.white)
                                    }
                                })
                        }
                        .navigationBarHidden(true)
                    }
                }
            }
            .padding(.leading)
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
