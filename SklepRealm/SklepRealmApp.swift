//
//  SklepRealmApp.swift
//  SklepRealm
//
//  Created by kprzystalski on 11/01/2021.
//

import SwiftUI
import RealmSwift

@main
struct SklepRealmApp: SwiftUI.App {
    
    let jsonKategoriaFixtures = ["kategorie"]
    
    init() {
        //loadFixtures()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(KategoriaStore(realm: RealmPersistence.initializer()))
        }
    }
}

extension SklepRealmApp {
    
    func loadFixtureFile(fixtureFile: String) -> String {
        let path = Bundle.main.path(forResource: fixtureFile, ofType: "json")!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        return String(data: jsonData, encoding: String.Encoding.utf8)!
    }
    
    func saveKategoria(realm: Realm, jsonString: String) -> Void {
        let decoder = JSONDecoder()
        let kategoriaJSON = try! decoder.decode([KategoriaJSON].self, from: (jsonString.data(using: .utf8))!)
        
        try! realm.write {
            for jsonKat in kategoriaJSON {
                let kategoria = KategoriaModel()
                kategoria.id = UUID().hashValue
                kategoria.tytul = jsonKat.tytul
                realm.add(kategoria)
                print("Dodałem kategorię: " + jsonKat.tytul)
            }
        }
    }
    
    
    func loadFixtures() {
        let realm = RealmPersistence.initializer()
        for fixtureFile in jsonKategoriaFixtures {
            do {
                let jsonString = loadFixtureFile(fixtureFile: fixtureFile)
                saveKategoria(realm: realm, jsonString: jsonString)
            } catch let err {
                print(err)
            }
        }
    }
}
