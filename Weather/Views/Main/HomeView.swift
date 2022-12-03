//
//  HomeView.swift
//  Weather
//
//  Created by Olha Hladush on 12/2/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            
            //MARK: Background Color
            Color.background
                .ignoresSafeArea()
            
            //MARK: Background Image
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            //MARK: House Image
            Image("House")
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top, 257)
            
            //MARK: Current Wether
            VStack(spacing: -10) {
                Text("Montreal")
                    .font(.largeTitle)
                
                VStack {
                    Text(attributedString)
                    
                    Text("H:24°    L:18°")
                        .font(.title3.weight(.semibold))
                }

                Spacer()
            }
            .padding(.top, 51)
        }
    }
    
    private var attributedString: AttributedString {
        var string = AttributedString("19°" + "\n " + "Mostly Clear")
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
 
        
        if let wether = string.range(of: "Mostly Clear") {
            string[wether].font = .title3.weight(.semibold)
            string[wether].foregroundColor = .secondary
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
