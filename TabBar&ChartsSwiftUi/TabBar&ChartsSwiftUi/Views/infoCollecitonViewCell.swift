//
//  infoCollecitonViewCell.swift
//  TabBar&ChartsSwiftUi
//
//  Created by Devesh Pandey on 01/05/24.
//

import SwiftUI

struct infoCollecitonViewCell: View {
    var index : Int
    var body: some View {
    
        VStack(alignment: .leading){
            Image("totalClicks").resizable().frame(width: 32, height: 32).padding([.bottom],10).padding([.leading],5)
            Text("123").font(.system(size: 16,weight: .semibold)).padding(5)
            Text("Today's Click").font(.system(size: 14,weight: .semibold)).foregroundStyle(Color(UIColor(red: 153/255, green: 156/255, blue: 160/255, alpha: 1.0)))
            
        }.background(.white).frame(width: 120,height: 120).clipShape(.rect(cornerRadius: 12.0), style: FillStyle())
        }
    }

#Preview {
    infoCollecitonViewCell(index: 0)
}



