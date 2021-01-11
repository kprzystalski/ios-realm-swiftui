//
//  Kategoria.swift
//  SklepRealm
//
//  Created by kprzystalski on 11/01/2021.
//

import Foundation
import RealmSwift

class KategoriaModel: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var tytul = ""
    
    override static func primaryKey() -> String? {
        "id"
    }
    
}
