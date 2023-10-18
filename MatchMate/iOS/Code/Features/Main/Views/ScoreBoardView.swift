//
//  ScoreBoardView.swift
//  MatchMate
//
//  Created by Mohamed  on 17/10/2023.
//

import SwiftUI

struct ScoreBoardView: View {
    var body: some View {
        
        GeometryReader
        {
            proxy in
            let _: CGFloat = proxy.size.height
            
        
        
            
            ZStack(alignment:Alignment(horizontal: .center, vertical: .top)) {
                VStack(spacing: 25)
                {
                    
                    HStack(alignment: .center,spacing: 20)
                    {
                        Image("ranking")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .colorMultiply(Color("Title"))
                        
                        Text("Stats")
                            .font(Bobaland.Regular.font(size:24))
                            .foregroundColor(Color("Title"))
                        
                        Spacer()
                    }
                    .padding(.leading,30)
                    
                    
                    ZStack()
                    {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(Color("Box"))
                            .frame(width: 326 ,height: 378)
                        
                      
                        
                            
                        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            {
                                Text("Highest Score :")
                                    .font(Bobaland.Regular.font(size: 20))
                                
                                GifManager("Carlo")
                                .frame(width: 136,height: 136)
                                
                                HStack()
                                {
                                    Text("29")
                                    Text("Points")
                                       
                                }
                                .font(Bobaland.Regular.font(size:44))
                                .foregroundColor(Color("Title"))
                                
                                
                                VStack()
                                {
                                    HStack()
                                    {
                                        Text("1")
                                        Text("Attempts")
                                        
                                    }
                                   
                                    
                                    HStack()
                                    {
                                        Text("19")
                                        Text("Seconds")
                                        
                                    }
                                    
                                }
                                .font(Bobaland.Regular.font(size:20))
                                .foregroundColor(Color("GrayTxt"))
                            }
                            
                            
                        
                    }
                    
                    VStack()
                    {
                        HStack()
                        {
                            Text("Other Players")
                                .font(Bobaland.Regular.font(size:20))
                                .foregroundColor(.black)
                                .padding(.leading,40)
                            Spacer()
                        }
                        
                        RoundedRectangle(cornerRadius: 23)
                            .foregroundColor(Color("Box"))
                            .frame(width: 326 ,height: 80)
                        
                        RoundedRectangle(cornerRadius: 23)
                            .foregroundColor(Color("Box"))
                            .frame(width: 326 ,height: 80)
                        
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    ScoreBoardView()
}
