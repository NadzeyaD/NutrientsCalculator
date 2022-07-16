//
//  Nutrient.swift
//  NutrientsCalculator
//
//  Created by Nadia on 16.07.22.
//

import RealmSwift

class NutrientEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var color: String = "" // HEX Color
    @objc dynamic var category: Int = 0
    @objc dynamic var measureType: Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
