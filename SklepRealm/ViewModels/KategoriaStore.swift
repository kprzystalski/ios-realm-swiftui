//
//  KategoriaStore.swift
//  SklepRealm
//
//  Created by kprzystalski on 11/01/2021.
//

import Foundation
import RealmSwift

final class KategoriaStore: ObservableObject {
    
    var realm: Realm
    private var kategoriaResult: Results<KategoriaModel>
    
    init(realm: Realm) {
        self.realm = realm
        kategoriaResult = realm.objects(KategoriaModel.self)
    }
    
    var wszystkie: [Kategoria] {
        kategoriaResult.map(Kategoria.init)
    }
    
}

extension KategoriaStore {
    
    func getById(id: Int) -> KategoriaModel {
        return realm.objects(KategoriaModel.self).filter("id=="+String(id))[0]
        
    }
    
}
