//
//  Extensions.swift
//  ToDoApp
//
//  Created by AALA mac on 21/11/2023.
//

import Foundation

extension Encodable{
    
    func asDictionary() -> [String:Any] {
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        }
        catch{
            return [:]
        }
    }
}
