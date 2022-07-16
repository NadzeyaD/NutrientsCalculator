//
//  Storage.swift
//  NutrientsCalculator
//
//  Created by Nadia on 16.07.22.
//

import RealmSwift

class Storage {
    static let instance = Storage()
    private let realm: Realm?
    
    init() {
        realm = try? Realm()
    }
    
    func saveNutrientRecord(nutrientRecord: NutrientRecordEntity) {
        guard let realm = realm else { return }
        let lastId = realm.objects(NutrientRecordEntity.self)
                    .sorted(byKeyPath: "id", ascending: true).last?.id
        
        nutrientRecord.id = (lastId ?? 0) + 1
        
        try? realm.write {
            realm.add(nutrientRecord)
        }
    }
    
    func getNutrientRecords() -> [NutrientRecordEntity] {
        guard let realm = realm else { return [] }

        return realm.objects(NutrientRecordEntity.self).reversed()
    }
    
    func deleteNutrientRecord(nutrientRecord: NutrientRecordEntity) {
        guard let realm = realm else { return }

        guard let obj = realm.objects(NutrientRecordEntity.self)
            .filter("id == \(nutrientRecord.id)").first else { return }
        
        try? realm.write {
            realm.delete(obj)
        }
    }
     
    func addNutrient(nutrient: NutrientEntity) {
        guard let realm = realm else { return }
        let lastId = realm.objects(NutrientEntity.self)
                    .sorted(byKeyPath: "id", ascending: true).last?.id
        
        nutrient.id = (lastId ?? 0) + 1
        
        try? realm.write {
            realm.add(nutrient)
        }
    }
    
    func getNutrients() -> [NutrientEntity] {
        guard let realm = realm else { return [] }

        return realm.objects(NutrientEntity.self).reversed()
    }
}
