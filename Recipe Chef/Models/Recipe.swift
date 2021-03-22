//
//  Recipe.swift
//  Recipe Chef
//
//  Created by John Jeang on 3/19/21.
//

import Foundation

class Recipe: Identifiable, Decodable{
    
    // Optionally just get all the field you want from the JSON
    // anythin you don't include just won't be decoded, but it's
    // not an error
    
    var id:UUID?
    var name :String
    var featured :Bool
    var image :String
    var description :String
    var prepTime :String
    var totalTime :String
    var servings :Int
    var ingredients:[String]
    var directions :[String]
    
}
