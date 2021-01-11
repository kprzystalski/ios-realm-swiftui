//
//  Kategoria.swift
//  SklepRealm
//
//  Created by kprzystalski on 11/01/2021.
//

import Foundation

struct KategoriaJSON: Decodable {
    public var tytul: String
}

struct Kategoria: Identifiable {
    let id: Int
    let tytul: String
}

extension Kategoria {
    init(kategoria: KategoriaModel) {
        id = kategoria.id
        tytul = kategoria.tytul
    }
}
