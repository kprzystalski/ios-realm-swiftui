//
//  RealmPersistence.swift
//  SklepRealm
//
//  Created by kprzystalski on 11/01/2021.
//

import Foundation
import RealmSwift

class RealmPersistence {
    static func initializer() -> Realm {
        do {
            let realm = try Realm()
            return realm
        } catch let err {
            print(err)
            fatalError("nie działa Realm")
        }
    }
}
