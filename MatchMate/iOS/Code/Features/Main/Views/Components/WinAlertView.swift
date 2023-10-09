//
//  CustomAlertView.swift
//  MatchMate
//
//  Created by Mohamed  on 7/10/2023.
//

import SwiftUI


struct WinAlertView: View {

    
    @Binding var show : Bool
    
    var body: some View {
        ZStack(alignment:Alignment(horizontal: .trailing, vertical: .top)) {
        VStack(spacing: 25)
            {
                
                HStack(spacing: 10)
                {
                
                Text("You Won")
                    .font(Bobaland.Regular.font(size:40))
                    .foregroundColor(Color("Title"))
                    .padding(.trailing,10)
                    
                    Image("trophy")
                        .resizable()
                        .frame(width: 40,height: 38)
                    
                    
                }
                
                HStack()
                {
                    GifView("Cat")
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
                                
                            
                            
                            Text("2")
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
                                .frame(width: 24,height: 26)
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
                
               
                
            }
            .padding(.vertical,25)
            .padding(.horizontal,30)
            .background()
            .cornerRadius(26)
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
        .background(
            Color.primary.opacity(0.35))
    }
}

#Preview {
    WinAlertView(show: .constant(true))
}
