//
//  LogInView.swift
//  Landmarks
//
//  Created by Shaivik Dhavjekar on 13/09/22.
//

import SwiftUI

struct LogInView: View {
    
    @State private var userName = ""
    @State private var password = ""
    
    @StateObject var model = LogInViewModel()
    @StateObject private var settings = UserSettings()
    
    var body: some View {

        NavigationView {
            if settings.isLoggedIn {
                NavigationLink(destination:StoreView(), isActive: $settings.isLoggedIn) {}
            } else {
                ZStack{
                    Color.green.ignoresSafeArea()
                    VStack{
                        Text("Log In")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        
                        TextField("Username", text:$userName)
                            .padding()
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                            .background(Color.black.opacity(0.1))
                            .border(.red, width: CGFloat(model.wrongUserName))
                        
                        SecureField("Password", text:$password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .cornerRadius(10)
                            .background(Color.black.opacity(0.1))
                            .border(.red, width: CGFloat(model.wrongPassword))
                        
                        Button{
                            model.authenticateUser(username: userName, password: password)
                        } label: {
                            Text("Log In")
                                .foregroundColor(.white)
                                .frame(width: 300, height: 50)
                                .background(.green)
                                .cornerRadius(100)
                                .padding()
                        }
                    }
                    .frame(width: 360, height: 700)
                    .background(.white)
                    .cornerRadius(100)
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
