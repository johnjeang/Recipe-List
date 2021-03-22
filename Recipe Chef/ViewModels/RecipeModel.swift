//
//  RecipeModel.swift
//  Recipe Chef
//
//  Created by John Jeang on 3/19/21.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init(){
        self.recipes = DataService.getLocalData()
    }
    
}
