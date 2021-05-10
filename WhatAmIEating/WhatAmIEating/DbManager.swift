//
//  DbManager.swift
//  WhatAmIEating
//
//  Created by Peterses on 03/05/2021.
//

import Foundation
import RealmSwift

class DbManager {
    
    var realm: Realm?
    static let shared = DbManager()
    
    private init() {
        do {
            self.realm = try Realm()
        } catch {
            print("Error initializing new Realm: \(error)")
        }
    }
    
    func fetchAllAdditives(completion: @escaping (Results<Additive>?) -> Void){
        guard let db = realm else {
            return completion(nil)
        }
        
        let additivesRM = db.objects(Additive.self)
        
        return completion(additivesRM)
    }
}
