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
            //MARK: - WALLPAPER
            Image("earth")
                .resizable()
                .scaledToFit()
                .frame(width: 900, height: 900, alignment: .center)
            
                VStack{
                    //MARK: - HEADER
                    ZStack{
                        VStack(spacing:0){
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(width: UIScreen.main.bounds.width, height: 180, alignment: .center)
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: UIScreen.main.bounds.width, height: 145, alignment: .center)
                        }
                       
                        Text(getDate())
                            .foregroundColor(.white)
                            .font(.system(size: 100))

                    }
                    .ignoresSafeArea(.all, edges: .all)
                    Spacer()

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
