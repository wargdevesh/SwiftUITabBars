//
//  infoCollectionView.swift
//  TabBar&ChartsSwiftUi
//
//  Created by Devesh Pandey on 01/05/24.
//

import SwiftUI

struct infoCollectionView: View {
    
    var body: some View {
        ScrollView(.horizontal) {
                   //LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    HStack{
                       ForEach(0..<10) { index in
                           infoCollecitonViewCell(index: index)
                       }
                   }
        }.scrollDisabled(false)
    }
}

#Preview {
    infoCollectionView()
}
