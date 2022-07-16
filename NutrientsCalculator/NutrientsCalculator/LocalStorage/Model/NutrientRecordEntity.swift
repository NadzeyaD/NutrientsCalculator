//
//  NutrientRecord.swift
//  NutrientsCalculator
//
//  Created by Nadia on 16.07.22.
//

import RealmSwift

class NutrientRecordEntity: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var nutrientId: String = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var value: Double = 0.0
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
