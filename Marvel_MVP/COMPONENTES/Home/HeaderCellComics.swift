//
//  HeaderCellComics.swift
//  Marvel_MVP
//
//  Created by Andres Felipe Ocampo Eljaiesk on 08/01/2020.
//  Copyright © 2020 icologic. All rights reserved.
//

import Foundation
import SwiftUI

struct FeaturedComics: View {
    
    var arrayFeatured: [ResultFeatured]
    
    init(featured: [ResultFeatured]) {
        self.arrayFeatured = featured
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(self.arrayFeatured){ customFeatured in
                    FeaturedCell(featured: customFeatured)
                }
            }
        }
    }
}


struct FeaturedCell : View {
    
    var featured: ResultFeatured
    @ObservedObject var remoteImage = RemoteImageUrl()
    
    init(featured: ResultFeatured) {
        self.featured = featured
        self.remoteImage.getImageFromUrl(self.featured.thumbnail!)
    }
    
    var body: some View{
        VStack(alignment: .leading) {
            Image(uiImage: ((self.remoteImage.data.isEmpty) ? UIImage(named: "placeholder") : UIImage(data: self.remoteImage.data))!).scaledToFill().frame(height:200).clipped()
        }
    }
}



