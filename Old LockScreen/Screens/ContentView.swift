//
//  ContentView.swift
//  Old LockScreen
//
//  Created by Austin Suarez on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80;
    @State private var notificationWidth: Double = UIScreen.main.bounds.width - 40;
    @State private var notificationCenterHeight: Double = UIScreen.main.bounds.height - 600;
    @State private var  buttonOffset: CGFloat = 0;

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
                    //MARK: - CENTER NOTIFICATIONS
                    
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: notificationWidth, height: notificationCenterHeight, alignment: .center)
                    }
                    Spacer()
                    //MARK: - FOOTER
                    ZStack{
                         
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 25,style: .continuous)
                                .fill(Color.black)
                            HStack{
                                    RoundedRectangle(cornerRadius: 25,style: .continuous)  .fill(Color.white)
                                        .frame(width: buttonOffset + 80)
                                    Spacer()
     
                            }
                            Text("Slide to Unlock")
                                .foregroundColor(Color.white)
                                .offset(x:20)
                                .font(.system(.title3, design: .rounded))
                            
                        }
                        .frame(width: buttonWidth, height: 80, alignment: .center)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                    .background(Color.white.opacity(0.20))


                   

                    //MARK: - END FOOTER
                    Spacer()
                }
               
                

            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
