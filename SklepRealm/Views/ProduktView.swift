//
//  ProduktView.swift
//  SklepRealm
//
//  Created by kprzystalski on 11/01/2021.
//

import SwiftUI
import RemoteImage

struct ProduktView: View {
    
    @EnvironmentObject var kategoriaStore: KategoriaStore
    let kategoria_id: Int
    
    let url = URL(string: "https://images.unsplash.com/photo-1524419986249-348e8fa6ad4a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80")!
    
    var body: some View {
        Text(kategoriaStore.getById(id: kategoria_id).tytul)

        RemoteImage(type: .url(url), errorView: { error in
            Text(error.localizedDescription)
        }, imageView: { image in
            image
            .resizable()
            .aspectRatio(contentMode: .fit)
        }, loadingView: {
            Text("Loading ...")
        })
    }
}

struct ProduktView_Previews: PreviewProvider {
    static var previews: some View {
        ProduktView(kategoria_id: 1)
    }
}
