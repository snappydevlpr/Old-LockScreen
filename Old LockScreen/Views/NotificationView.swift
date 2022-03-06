//
//  NotificationView.swift
//  Old LockScreen
//
//  Created by Austin Suarez on 3/5/22.
//

import SwiftUI
import AVFoundation

struct NotificationView: View {
    @State private var notificationWidth: Double = UIScreen.main.bounds.width - 40;
    @State private var notificationCenterHeight: Double = UIScreen.main.bounds.height - 500;
     
    let systemSoundID: SystemSoundID = 1012;
    let hapticFeedback = UINotificationFeedbackGenerator()

    

    let imageIcon: String;
    let imageSubIcon: String;
    let notifcationHeader: String;
    let notificationMessage: String;
    
    @State var isAnimating: Bool = false;

    
    var body: some View {
        //MARK: - NOTIFICATION
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
            .frame(width: notificationWidth, height: 100, alignment: .center)
            .foregroundColor(.gray.opacity(0.8))
            HStack(spacing: 0){
                ZStack{
                    // Contact icon
                    ZStack{
                        Circle()
                            .frame(width: 50, height:50)
                            .foregroundColor(.gray)
                        
                        Image(systemName:"person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height:20)
                            .foregroundColor(.white)
                    }
                   
                    // App Icon
                    Image(imageSubIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height:50)
                        .offset(x:20,y:20)
                }
                .frame(width: 70, height:50)

                // Text Message
                VStack(alignment: .leading) {
                    Text("SnappyDevlpr")
                    Text("Thanks for downloading my app!")
                        .fontWeight(.light)
                }
                .offset(x:10)
                                                    
            }
            .frame(width: notificationWidth, height:100,alignment:.leading)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute:{
                isAnimating = true;
                AudioServicesPlaySystemSound(systemSoundID)
                hapticFeedback.notificationOccurred(.success)
            })
        })
        .opacity(isAnimating ?1:0)
    
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(imageIcon: "person.fill",
        imageSubIcon: "imessage",
        notifcationHeader: "SnappyDevlpr",
        notificationMessage: "Thanks for downloading my app!"
        )
    }
}
