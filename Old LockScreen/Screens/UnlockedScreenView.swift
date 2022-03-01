//
//  UnlockedScreenView.swift
//  Old LockScreen
//
//  Created by Austin Suarez on 2/24/22.
//

import SwiftUI

struct UnlockedScreenView: View {
    
    @AppStorage("share") var isLocked: Bool = false;
    @State private var isAnimating: Bool = false;

    var body: some View {
        ZStack{
            Color("Color_Blue")
                .ignoresSafeArea(.all,edges: .all)
            VStack{
                Spacer()
                Text("Old iPhone Lock Screen")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding()
                Text("Thank you for using the simple proof of concept application.")
                    .foregroundColor(.white)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                
                    
                Image("unlocked")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200, alignment: .center)
                   
                .frame(width: 400, height: 400, alignment: .center)


                Button(action: { withAnimation{
                    isAnimating = true;
                    isLocked = true
                    
                }},label: {
                    Text("Restart")
                        .fontWeight(.heavy)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color("Color_Gray"))
                        .cornerRadius(100)
                })
                
                Spacer()
                
                Text("Created by Austin Suarez")
                    .foregroundColor(.white)
                    .fontWeight(.ultraLight)
            }
        }
        
        
        
     
    }
}

struct UnlockedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockedScreenView()
    }
}
