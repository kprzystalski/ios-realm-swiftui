//
//  ContentView.swift
//  SklepRealm
//
//  Created by kprzystalski on 11/01/2021.
//

import SwiftUI


struct MainView: View {
    
    @EnvironmentObject var kategoriaStore: KategoriaStore
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(kategoriaStore.wszystkie) { kategoria in
                        HStack{
                            NavigationLink(kategoria.tytul, destination: ProduktView(kategoriaStore: _kategoriaStore, kategoria_id: kategoria.id))
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
