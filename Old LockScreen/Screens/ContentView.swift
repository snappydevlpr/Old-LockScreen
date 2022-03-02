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
    @State private var notificationCenterHeight: Double = UIScreen.main.bounds.height - 500;
    @State private var  buttonOffset: CGFloat = 0;
    @AppStorage("share") var isLocked: Bool = true;
    
    //haptic feedback
    let hapticFeedback = UINotificationFeedbackGenerator()
    
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
                        Text(getDate())
                            .foregroundColor(.white)
                            .font(.system(size: 100))
                            .frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
                            .background(LinearGradient(gradient: Gradient(colors: [.white.opacity(0.5), .black.opacity(0.1)]), startPoint: .top, endPoint: .bottom))
                    }
                    .ignoresSafeArea(.all, edges: .all)
                    
                    Spacer()
                    
                    //MARK: - CENTER NOTIFICATIONS
                    ZStack{
                        
                        VStack{
                            Rectangle()
                            .frame(width: notificationWidth, height: 100, alignment: .center)
                            .foregroundColor(.white)
                        }
                        .frame(width: notificationWidth, height: notificationCenterHeight, alignment: .center)
                
                    }
                    
                    
                    Spacer()
                    
                    
                    //MARK: - FOOTER
                    ZStack{
                         // start of slider
                        ZStack{
                            //slider base background
                            RoundedRectangle(cornerRadius: 25,style: .continuous)
                                .fill(Color.black)
                            
                            HStack{
                                RoundedRectangle(cornerRadius: 25,style: .continuous)
                                    .fill(Color.white)
                                    .frame(width: buttonOffset + 80)
                                Spacer()
                            }
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 25,style: .continuous)  .fill(Color.white)
                                    Image(systemName: "arrow.forward")
                                        .font(.system(size:24,weight: .bold))
                                }
                                .frame(width: 80, height: 80, alignment: .center)
                                .offset(x:buttonOffset)
                                .gesture(
                                    DragGesture()
                                        .onChanged{gesture in
                                           if gesture.translation.width > 0 && buttonOffset <= (buttonWidth - 80)
                                            {
                                                buttonOffset = gesture.translation.width
                                           }
                                        }
                                        .onEnded{ _ in withAnimation(Animation.easeOut(duration: 0.4)){
                                               if buttonOffset > buttonWidth/2{
                                                   hapticFeedback.notificationOccurred(.success)
                                                   buttonOffset = buttonWidth - 95
                                                   isLocked = false
                                               }
                                               else{
                                                   buttonOffset = 0
                                                   hapticFeedback.notificationOccurred(.warning)
                                               }
                                           }
                                       }
                                )
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
