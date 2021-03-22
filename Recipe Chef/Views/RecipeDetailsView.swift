//
//  RecipeDetailsView.swift
//  Recipe Chef
//
//  Created by John Jeang on 3/20/21.
//

import SwiftUI

struct RecipeDetailsView: View {
    
//    unspecified for now because we want the ListView to pick
//    what recipe is chosen
    var recipe:Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(recipe.ingredients, id: \.self){ingredient in
                        Text("• " + ingredient)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                // MARK: Divider
                Divider()

                // MARK: Directions
                
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                    ForEach(1...recipe.directions.count, id: \.self){index in
                        Text(String(index) + ". " + recipe.directions[index - 1])
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .navigationBarTitle(recipe.name)

    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        /*
         Recall that this section is the preview section.
         We are going to pass in an arbitrary recipe for the preview purpose
         */
        
        let model = RecipeModel()
        
        RecipeDetailsView(recipe: model.recipes[0])
    }
}
