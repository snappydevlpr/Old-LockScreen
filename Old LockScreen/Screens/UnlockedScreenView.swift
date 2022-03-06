//
//  UnlockedScreenView.swift
//  Old LockScreen
//
//  Created by Austin Suarez on 2/24/22.
//

import SwiftUI
import AVFoundation
struct UnlockedScreenView: View {
    
    @AppStorage("share") var isLocked: Bool = false;
    @State private var isAnimating: Bool = false;
    let  systemSoundID: SystemSoundID = 1100;

    var body: some View {
        ZStack{
            Color("Color_Blue")
                .ignoresSafeArea(.all,edges: .all)
            VStack{
            
                Spacer()
                //MARK: HEADER
                Text("Old iPhone Lock Screen")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding()
                ZStack{
                    Text("Thank you for using the simple proof of concept application.")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .opacity(isAnimating ? 0:1)
                    Text("You have locked the application")
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .padding(.horizontal, 10)
                        .opacity(isAnimating ? 1:0)
                }
               
                
                //MARK: CENTER IMAGE
                ZStack{
                    Image("unlocked")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .opacity(isAnimating ? 0:1)
                        .frame(width: 400, height: 400, alignment: .center)
                    Image("locked")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200, alignment: .center)
                        .opacity(isAnimating ? 1:0)
                }
                
                //MARK: - FOOTER
                Button(action: { withAnimation{
                    isAnimating = true;
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute:{
                        AudioServicesPlaySystemSound(systemSoundID)
                        isLocked = true;
                    })

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
