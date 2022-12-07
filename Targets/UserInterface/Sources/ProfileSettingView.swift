//
//  ProfileSettingView.swift
//  Ticlemoa
//
//  Created by Shin Jae Ung on 2022/12/02.
//  Copyright © 2022 nyongnyong. All rights reserved.
//

import SwiftUI

struct ProfileSettingView: View {
    @State private var nickname: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            Circle()
                .frame(width: 59, height: 59)
                .padding(.top, 24)
                .overlay {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "gearshape.circle.fill")
                                .resizable()
                                .foregroundColor(.gray)
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .background {
                                    Circle()
                                        .foregroundColor(.white)
                                        .frame(width: 22, height: 22)
                                }
                        }
                    }
                }
            
            VStack(spacing: 0) {
                HStack {
                    Text("닉네임")
                        .foregroundColor(.init(uiColor: #colorLiteral(red: 0.6036364436, green: 0.5913313031, blue: 0.5479947329, alpha: 1)))
                        .font(.system(size: 14))
                    Spacer()
                }
                .padding(.bottom, 12)
                TextField("닉네임을 입력해주세요.", text: self.$nickname)
                    .padding(.bottom, 8)
                Divider()
                    .padding(.bottom, 8.8)
                HStack {
                    Spacer()
                    Text("\(nickname.count)/10")
                        .foregroundColor(.init(uiColor: #colorLiteral(red: 0.6036364436, green: 0.5913313031, blue: 0.5479947329, alpha: 1)))
                        .font(.system(size: 14))
                }
            }
            .padding(20)
            
            Spacer()
        }
        .navigationTitle("프로필 설정")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("완료") {
                    Void()
                }
                .foregroundColor(.black)
            }
        }
    }
}

struct ProfileSettingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NavigationLink {
                ProfileSettingView()
            } label: {
                Text("Button")
            }
        }
        ProfileSettingView()
    }
}
