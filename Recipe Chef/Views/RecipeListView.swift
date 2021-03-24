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
            List(model.recipes){r in
                
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
                        }
                    })
            }
            .navigationBarTitle("All Recipes")
        }

    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
