//
//  StatisticCardView.swift
//  Crypto
//
//  Created by TheGIZzz on 28/4/2566 BE.
//

import SwiftUI

struct StatisticCardView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    @State var translation: CGSize = .zero
    @State var isDragging = false
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation
                isDragging = true
            }
            .onEnded { value in
                withAnimation {
                    translation = .zero
                    isDragging = false
                }
            }
    }
    
    var body: some View {
        ZStack {
            
            Image("Background 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 250)
                .overlay(
                    HStack(spacing: 5) {
                        cardBackground
                        
                        mainCardBackground
                        
                        cardBackground
                    }
                )
                .overlay(gloss1.blendMode(.softLight))
                .overlay(gloss2.blendMode(.luminosity))
                .overlay(gloss2.blendMode(.overlay))
                .overlay(LinearGradient(colors: [.clear, .white.opacity(0.5), .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(translation.height)/100+1, y: abs(translation.height)/100+1)))
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .strokeBorder(.linearGradient(colors: [.clear, .white.opacity(0.75), .clear, .white.opacity(0.75), .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(translation.width)/100+0.5, y: abs(translation.height)/100+0.5)))
                )
                .overlay(
                    LinearGradient(colors: [Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 0.5152369619)), Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 0.5))], startPoint: .topLeading, endPoint: .bottomTrailing)
                        .blendMode(.overlay)
                )
                .cornerRadius(25)
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.black)
                        .opacity(0.5)
                        .blur(radius: 50)
                        .offset(y: 50)
                        .blendMode(.overlay)
                )
                .scaleEffect(0.9)
                .rotation3DEffect(.degrees(isDragging ? 10 : 0), axis: (x: -translation.height, y: translation.width, z: 0))
//                .rotation3DEffect(.degrees(translation.width), axis: (x: 0, y: 1, z: 0)) // flip card
                .gesture(drag)
        }
    }
    
    var gloss1: some View {
        Image("Gloss 1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .mask(
                LinearGradient(colors: [.clear, .white, .clear, .white, .clear, .white, .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(translation.height)/100+1, y: abs(translation.height)/100+1))
                    .frame(width: 392)
            )
    }

    var gloss2: some View {
        Image("Gloss 2")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .mask(
                LinearGradient(colors: [.clear, .white, .clear, .white, .clear, .white, .clear], startPoint: .topLeading, endPoint: UnitPoint(x: abs(translation.height)/100+1, y: abs(translation.height)/100+1))
                    .frame(width: 392)
            )
    }
    
    var cardBackground: some View {
        ZStack {
            Image("Logo 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
            .offset(x: translation.width/10, y: translation.height/20)
            
            Image("Logo 3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 180)
                .cornerRadius(25)
                .blendMode(.overlay)
                .offset(x: translation.width/15, y: translation.height/30)
        }
    }
    
    var mainCardBackground: some View {
        ZStack {
            Image("Logo 2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
            .offset(x: translation.width/10, y: translation.height/20)
            
            Image("Logo 3")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 220)
                .cornerRadius(25)
                .blendMode(.overlay)
                .offset(x: translation.width/15, y: translation.height/30)
        }
    }
    
}

struct StatisticCardView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticCardView(showPortfolio: .constant(true))
    }
}
