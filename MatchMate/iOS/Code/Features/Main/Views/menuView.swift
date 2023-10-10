//
//  MenuView.swift
//  MatchMate
//
//  Created by Mohamed  on 10/10/2023.
//

import SwiftUI

struct menuView: View {
    
    @State var navigateToGame: Bool = false
    @Binding var isToggled: Bool
    
    
    var body: some View {
        
        NavigationStack
        {
            ZStack(alignment:Alignment(horizontal: .center, vertical: .center)) {
                
                GifView("BackgroundMenu")
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center)
                {
                    
                    Text("Match Mate")
                        .font(Bobaland.Regular.font(size:50))
                        .foregroundColor(Color("Title"))
                        .padding(.top,90)
                    
                    Spacer()
                    
                    VStack(spacing: 30)
                    {
                        
                        Button(action: {
                            navigateToGame = true
                            
                        }
                               
                        ) {
                            Text("Level 1")
                                .font(Bobaland.Regular.font(size:30))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 240, height: 50)
                                .background(Color("lightBlue"))
                                .cornerRadius(16)
                        }
                        .navigationDestination(
                            isPresented: $navigateToGame) {
                                ScreenTimer()
                                
                            }
                        Button(action: {
                            
                        }
                               
                        ) {
                            Text("Level 2")
                                .font(Bobaland.Regular.font(size:30))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 240, height: 50)
                                .background(Color("lightBlue"))
                                .cornerRadius(16)
                        }
                        Button(action: {
                            
                        }
                               
                        ) {
                            Text("Level 3")
                                .font(Bobaland.Regular.font(size:30))
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 240, height: 50)
                                .background(Color("lightBlue"))
                                .cornerRadius(16)
                        }
                    }
                    
                    Spacer()
                    HStack(spacing: 30)
                    {
                        Button(action: {
                                  
                               }) {
                                   RoundedRectangle(cornerRadius: 16)
                                       .fill(Color("lightBlue"))
                                       .frame(width: 60, height: 60)
                                       .overlay(Image("settings"))
                                        
                                       
                               }
                        Button(action: {
                                
                               }) {
                                   RoundedRectangle(cornerRadius: 16)
                                       .fill(Color("lightBlue"))
                                       .frame(width: 60, height: 60)
                                       .overlay(Image("ranking"))
                                       
                               }
                        Button(action: {
                            
                            withAnimation {
                                            isToggled.toggle()
                                    }
                                
                        }) {
                            
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color("lightBlue"))
                                .frame(width: 60, height: 60)
                                .overlay(Image(systemName: isToggled ? "speaker.slash.fill" : "speaker.wave.2.fill")
                                    .font(.system(size: 30))
                                    
                                    .foregroundColor(.white)
                                    .symbolEffect(.bounce , value: isToggled)
                                    .contentTransition(.symbolEffect(.replace.wholeSymbol.byLayer)))
                            
                            
                        }
                    }
                    .padding(.bottom,90)
                }
               
            }
           
        }
        .navigationBarBackButtonHidden()
    }
}
    


#Preview {
    menuView(isToggled: .constant(true))
}

