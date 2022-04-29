//
//  TabBar.swift
//  Shop
//
//  Created by Artem Kutasevich on 29.04.22.
//

import SwiftUI

struct TabBar: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .menu
    @State var tabItemWidth: CGFloat = 0
    let backgroundColor = Color("Color-3")
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack {
                Spacer()
                buttons
                Spacer()
            }
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(backgroundColor, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
    }
    
    var buttons: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.7)) {
                        selectedTab = item.tab
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .font(.title3)
                        .frame(width: tabItemWidth, height: 29)
                    Text(item.text)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .overlay(
                GeometryReader { proxy in
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
