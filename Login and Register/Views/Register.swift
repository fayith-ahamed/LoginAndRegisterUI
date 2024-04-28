//
//  Register.swift
//  Login and Register
//
//  Created by Fayith  on 28/04/24.
//

import SwiftUI

struct Register: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var confirmPassword : String = ""
    @State private var isPasswordSecure : Bool = true
    @State private var isConfirmPasswordSecure : Bool = true
    @State private var isToNavigate : Bool = false
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                // Background color
                LinearGradient(colors: [Color.white , Color.blue.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                
                
            
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .center , spacing: 35){
                        VStack(alignment: .leading , spacing: 35){
                            
                            
                            
                            VStack(alignment: .leading, spacing: 15){
                                Text("Register")
                                    .foregroundColor(Color.black)
                                    .font(Font.system(size: 26,weight: Font.Weight.semibold))
                                
                                Text("Please register to login.")
                                    .foregroundColor(Color.gray)
                                
                            }
                            VStack(alignment: .leading , spacing: 15){
                                VStack(alignment: .leading ,  spacing: 12){
                                    
                                    Text("Email")
                                        .foregroundColor(Color.black)
                                    
                                    VStack{
                                        TextField("Email", text: $email)
                                            .frame(height: 44)
                                            .frame(maxWidth: .infinity)
                                            .padding(.horizontal , 15)
                                            .autocorrectionDisabled(true)
                                            .textInputAutocapitalization(.never)
                                            .accentColor(Color.black)
                                            .foregroundColor(Color.black)
                                            .keyboardType(.emailAddress)
                                            .background(
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color.black, lineWidth: 0.7 )
                                                
                                            )
                                            .onChange(of: email){
                                                self.email = email.lowercased()
                                            }
                                        
                                    }
                                }
                                
                                VStack(alignment: .leading ,  spacing: 12){
                                    
                                    Text("Password")
                                        .foregroundColor(Color.black)
                                    
                                    VStack{
                                        HStack{
                                            
                                            if isPasswordSecure{
                                                
                                                SecureField("Password", text: $password)
                                                
                                            }
                                            else{
                                                
                                                TextField("Password", text: $password)
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Image(systemName: self.isPasswordSecure ? "eye" : "eye.slash")
                                                .onTapGesture {
                                                    self.isPasswordSecure.toggle()
                                                }
                                            
                                        }
                                        .frame(height: 44)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal , 15)
                                        .autocorrectionDisabled(true)
                                        .accentColor(Color.black)
                                        .foregroundColor(Color.black)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.black , lineWidth: 0.7)
                                        )
                                        
                                    }
                                    
                                   
                                    
                                }
                                
                                VStack(alignment: .leading ,  spacing: 12){
                                    
                                    Text("Confirm Password")
                                        .foregroundColor(Color.black)
                                    
                                    VStack{
                                        HStack{
                                            
                                            if isConfirmPasswordSecure{
                                                
                                                SecureField("Confirm Password", text: $password)
                                                
                                            }
                                            else{
                                                
                                                TextField("Confirm Password", text: $password)
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Image(systemName: self.isConfirmPasswordSecure ? "eye" : "eye.slash")
                                                .onTapGesture {
                                                    self.isConfirmPasswordSecure.toggle()
                                                }
                                            
                                        }
                                        .frame(height: 44)
                                        .frame(maxWidth: .infinity)
                                        .padding(.horizontal , 15)
                                        .autocorrectionDisabled(true)
                                        .accentColor(Color.black)
                                        .foregroundColor(Color.black)
                                        .background(
                                            RoundedRectangle(cornerRadius: 12)
                                                .stroke(Color.black , lineWidth: 0.7)
                                        )
                                        
                                    }
                                    
                                    Button(action: {
                                        
                                        
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                        
                                    }, label: {
                                        
                                        Text("Register")
                                        
                                            .foregroundColor(Color.white)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 48)
                                    
                                            .background(Color.blue)
                                            .cornerRadius(12)
                                            .padding(.top , 10)
                                    })
                                    
                                    
                                }
                            }
                            
                            
                        }
                        HStack(spacing: 4){
                            
                            Text("Already have an account?")
                                .foregroundColor(Color.gray)
                            
                            Button(action: {
                                self.isToNavigate = true
                            }, label: {
                                Text("Log in")
                            })
                            .navigationDestination(isPresented: $isToNavigate){
                                Login()
                            }
                        }
                        Spacer()
                        
                    }
                    .padding(.horizontal , 20)
                    .padding([.top] , 50)
                }
            }
            .ignoresSafeArea(.container , edges: .bottom)
            
        }.navigationBarBackButtonHidden(true)
        
    }
}

#Preview {
    Register()
}
