//
//  Links.swift
//  TabBar&ChartsSwiftUi
//
//  Created by Devesh Pandey on 26/04/24.
//

import SwiftUI

struct Links: View {
    
    
    let backgroundGradient =  Color(UIColor(red: 14/255, green: 111/255, blue: 255/255, alpha: 1.0))
  @State var hour = Calendar.current.component(.hour, from: Date())
  @State var isTopLinksClk = true
  @State var isRecentLinkClk = false
    @StateObject var vm : HomeViewModel = HomeViewModel()
    var body: some View {
        ZStack{
            backgroundGradient
          
            ScrollView(.vertical) {
                VStack{
                    HStack{
                        Text("Dashboard").font(.system(size: 24,weight: .semibold)).foregroundStyle(Color(.white))
                        Spacer()
                        Image("sideMenu").resizable().foregroundStyle(Color.white).frame(width: 40,height: 40)
                    }.padding(20)
                    ZStack{
                        Color(.white)
                        Color(UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 0.3))
                        
                        VStack(alignment: .leading) {
                            HStack {
                                VStack(alignment: .leading){
                                    if(hour < 16){
                                        Text(hour < 12 ? "Good Morning" : "Good AfterNoon").font(.system(size: 16)).foregroundStyle(Color.gray)
                                    }
                                    else{
                                         if(hour < 20)
                                        {
                                             Text("Good Evening").font(.system(size: 16)).foregroundStyle(Color.gray)
                                         }
                                        else{
                                            Text("Good Night").font(.system(size: 16)).foregroundStyle(Color.gray)
                                        }
                                    }
                                    HStack {
                                        Text("Ajay Manva").font(.system(size: 24,weight: .semibold)).foregroundStyle(.black)
                                        Image("wave").resizable().scaledToFill().frame(width: 28,height: 28)
                                    }
                                    
                                }.padding([.top],30)
                                Spacer()
                            }.padding([.leading],20)
                            Image("graphPlaceHolder").resizable().frame(width:328,height: 200,alignment: .center).padding([.leading,.trailing],40)
                            infoCollectionView()
                            ViewAnalyticsButton()
                            
                            HStack{
                                Button("Top Links") {
                                    isTopLinksClk =  !isTopLinksClk
                                    if(isTopLinksClk)
                                    {
                                        isRecentLinkClk = false
                                    }
                                }.padding(10)
                                   .buttonStyle(.borderedProminent)
                                   .tint( isTopLinksClk ? .blue : .gray)
                               .buttonBorderShape(.roundedRectangle(radius: 10))
                                
                                Button("Recent Links") {
                                    isRecentLinkClk =  !isRecentLinkClk
                                    if( isRecentLinkClk)
                                    {
                                        isTopLinksClk = false
                                    }
                                }.padding(10)
                                   .buttonStyle(.borderedProminent)
                                   .tint( isRecentLinkClk ? .blue : .gray)
                               .buttonBorderShape(.roundedRectangle(radius: 10))
                                Spacer()
                                Image(systemName: "magnifyingglass").padding(20)
                            }
                        //   List(0..<10){_ in
                            ForEach(0..<( (isTopLinksClk ? vm.mainData?.data.topLinks.count : vm.mainData?.data.recentLinks.count) ?? 5),id: \.self){_ in
                               ListComponents()
                              
                           }.scrollContentBackground(.hidden).listRowSpacing(20)
                                
                                
                        }
                        
                       
                        
                    }.clipShape(.rect(topLeadingRadius: 30.0,topTrailingRadius: 30.0, style: .circular), style: FillStyle())
                 
                    
                }.padding([.top],20)
            }
        
        }.ignoresSafeArea()
    }
}
    
    #Preview {
        Links()
    }

