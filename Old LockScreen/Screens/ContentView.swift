//
//  ContentView.swift
//  Old LockScreen
//
//  Created by Austin Suarez on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80;

    var body: some View {
        ZStack{
            Color("Color_Black")
                .ignoresSafeArea(.all,edges:.all)
            VStack{
                Spacer()
                
                //MARK: - HEADER
                Text(getDate())
                    .foregroundColor(.white)
                    .font(.system(size: 100))
                
                //MARK: - CENTER
                Image("earth")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 500, alignment: .center)
                
                //MARK: - FOOTER
                ZStack{
                    Capsule()
                        .fill(Color.white.opacity(0.20))
                        .frame(width: buttonWidth, height: 80, alignment: .center)
  
                }
                //MARK: - END FOOTER
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
