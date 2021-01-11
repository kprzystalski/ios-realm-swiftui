//
//  Produkt.swift
//  SklepRealm
//
//  Created by kprzystalski on 11/01/2021.
//

import Foundation
import RealmSwift

class ProduktModel: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var tytul = ""
    @objc dynamic var opis = ""
    @objc dynamic var ilosc = 0
    @objc dynamic var kategoria: KategoriaModel?
    
    override static func primaryKey() -> String? {
        "id"
    }
    
}
