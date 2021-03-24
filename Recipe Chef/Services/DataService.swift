//
//  DataService.swift
//  Recipe Chef
//
//  Created by John Jeang on 3/19/21.
//

import Foundation

class DataService {
    
    
    // Type method, doesn't need an instance
    static func getLocalData() -> [Recipe]{
        // Parse local json file
        
        //path
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        guard pathString != nil else{
            return [Recipe]()
        }

        // url
        let url = URL(fileURLWithPath: pathString!)
        
        let decoder = JSONDecoder()
        
        do {
            // data object throws!
            let data = try Data(contentsOf: url)
            do{
                //decoding data throws
                let recipeData = try decoder.decode([Recipe].self, from: data)
                for r in recipeData{
                    r.id = UUID()
                    for i in r.ingredients{
                        i.id = UUID()
                    }
                }
                return recipeData
            }
            catch{
                print(error)
                print("Decoder error")
            }
        }
        catch{
            print(error)
            print("Error with creating Data objects")
        }
        // default return in case of error
        return [Recipe]()
        }
}
