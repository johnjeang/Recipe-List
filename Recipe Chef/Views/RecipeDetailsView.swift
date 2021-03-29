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
    @State var servingSelection = 2
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment: .leading){
                    Text("Select number of servings:")
                        .font(.headline)
                    Picker("", selection: $servingSelection){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 200)
                    
                }
                .padding()
                
                
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 5)
                    ForEach(recipe.ingredients){ingredient in
                        Text("• " + RecipeModel.getPortion(ingredient, recipe.servings, servingSelection) + " " + ingredient.name.lowercased())
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
