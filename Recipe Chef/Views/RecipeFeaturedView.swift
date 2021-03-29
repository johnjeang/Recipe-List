//
//  RecipeFeaturedView.swift
//  Recipe Chef
//
//  Created by John Jeang on 3/24/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model :RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        VStack(alignment: .leading, spacing:0){
            
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .font(.largeTitle)
                .padding(.top, 15)
            
            GeometryReader{ geometry in
            TabView{
                ForEach(0..<model.recipes.count){index in
                    if model.recipes[index].featured {
                        Button(action: {
                            self.isDetailViewShowing = true
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)

                                
                                VStack{
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                }
                            }
                            
                        })
                        .sheet(isPresented: $isDetailViewShowing){
                            // Show recipe detail view
                            RecipeDetailsView(recipe: model.recipes[index])

                         }
                        .buttonStyle(PlainButtonStyle())
                        .frame(width: geometry.size.width*0.83, height: geometry.size.height*0.87, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(color: Color(.sRGB, red: 0, green:0, blue: 0, opacity: 0.75), radius: 10, x:-5, y:5)
                    }
                    
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            
            VStack(spacing: 8){
                Text("Preperation Time")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy Hearty")
            }
            .padding(.leading, 20)
            .padding(.bottom, 7)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
