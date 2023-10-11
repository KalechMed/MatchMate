//
//  LoseAlertView.swift
//  MatchMate
//
//  Created by Mohamed  on 9/10/2023.
//

import SwiftUI

struct LoseAlertView: View {
    
    @Binding var show : Bool
    @State var NavigateToMenu : Bool = false
    @Binding var isToggled: Bool
    var body: some View {
        
        NavigationStack
        {
            ZStack(alignment:Alignment(horizontal: .trailing, vertical: .top)) {
                VStack(spacing: 25)
                {
                    
                    HStack(spacing: 10)
                    {
                        
                        Text("Game Over")
                            .font(Bobaland.Regular.font(size:40))
                            .foregroundColor(Color("Title"))
                            .padding(.trailing,10)
                        
                        
                        
                        
                    }
                    
                    HStack()
                    {
                        GifView("cryingCat")
                            .frame(width: 92,height: 121)
                            .padding(.trailing,10)
                        
                        VStack()
                        {
                            HStack()
                            {
                                Image("attempts")
                                    .resizable()
                                    .frame(width: 24,height: 26)
                                    .padding(.trailing,10)
                                
                                
                                
                                Text("3")
                                    .font(Bobaland.Regular.font(size:30))
                                    .foregroundColor(Color("GrayTxt"))
                                Text("Attempts")
                                    .font(Bobaland.Regular.font(size:20))
                                    .foregroundColor(Color("GrayTxt"))
                                
                                
                            }
                            
                            HStack()
                            {
                                Image("seconds")
                                    .resizable()
                                    .frame(width: 26,height: 26)
                                    .padding(.trailing,10)
                                
                                
                                
                                Text("2")
                                    .font(Bobaland.Regular.font(size:30))
                                    .foregroundColor(Color("GrayTxt"))
                                Text("Seconds  ")
                                    .font(Bobaland.Regular.font(size:20))
                                    .foregroundColor(Color("GrayTxt"))
                                
                                
                            }
                            
                            
                            
                        }
                        
                    }
                    Button(action: {
                        NavigateToMenu = true
                        
                    }
                           
                    ) {
                        Text("Menu")
                            .font(Bobaland.Regular.font(size:30))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 240, height: 50)
                            .background(Color("lightBlue"))
                            .cornerRadius(16)
                    }
                    .padding(.top,20)
                    .navigationDestination(isPresented: $NavigateToMenu)
                    {
                        menuView(isToggled: $isToggled)
                    }
                    
                    
                    
                }
                .onAppear
                {
                    AudioManager.instance.playSound(sound: .GameOver)
                }
                .padding(.vertical,25)
                .padding(.horizontal,30)
                .background()
                .cornerRadius(26)
                
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(
                Color.primary.opacity(0.35))
        }
    }
}

#Preview {
    LoseAlertView(show: .constant(true), isToggled: .constant(true))
}
