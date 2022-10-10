//
//  HomeView.swift
//  Weather
//
//  Created by Angela Yang on 9/10/22.
//

import SwiftUI
import BottomSheet

enum BottomSheetPostion: CGFloat, CaseIterable{
    case top = 0.83
    case middle = 0.385
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPostion = .middle
    var body: some View {

        NavigationView {
            ZStack{
                // MARK: Background Color
                Color.background
                    .ignoresSafeArea()
                
                // MARK: Background Image
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                //MARK: House Image
                Image("House")
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 257)
                    
                
                //MARK: Current Weather
                VStack(spacing:-8){
                    Text("Auckland")
                        .font(.largeTitle)
                    
                    VStack {

                        Text(attributedString)
                        
                        Text("H: 18°   L: 9°")
                            .font(.title3.weight(.semibold))
                    }
                    Spacer()
                }
                .padding(.top, 51)
                
                //MARK: Bottom Sheet
                BottomSheetView(position: $bottomSheetPosition) {
//                    Text(bottomSheetPosition.rawValue.formatted())
                } content: {
                    ForecastView()
                }
                
                //MARK: Tab Bar
                TabBar(action: {
                    bottomSheetPosition = .top
                })
            }
            .navigationBarHidden(true)
        }
    }
    
    private var attributedString: AttributedString {
        var string = AttributedString("13°" + "\n " + "Mostly Clear")
        
        if let temp = string.range(of: "13°") {
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
