//
//  RecipeHighlights.swift
//  Recipe Chef
//
//  Created by John Jeang on 3/29/21.
//

import SwiftUI

struct RecipeHighlights: View {
    
    
    var allHighlights = ""
    
    init(highlights:[String]){
        for index in 0..<highlights.count - 1{
            allHighlights += highlights[index]
            allHighlights += ", "
        }
        allHighlights += highlights[highlights.count - 1]
    }
    
    
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["johj", "jengs", "junior"])
    }
}
