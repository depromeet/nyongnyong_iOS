//
//  MyPageView.swift
//  UserInterface
//
//  Created by Shin Jae Ung on 2022/11/30.
//  Copyright © 2022 nyongnyong. All rights reserved.
//

import SwiftUI

struct MyPageView: View {
    @State private var isAccountDeleteButtonTouched: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            NavigationLink {
                ProfileSettingView()
            } label: {
                VStack(spacing: 0) {
                    Group {
                        Rectangle()
                            .foregroundColor(.grey4)
                            .frame(width: 59, height: 59)
                            .overlay(
                                VStack(spacing: 0) {
                                    Circle()
                                        .frame(width: 21, height: 21)
                                        .padding(.top, 14)
                                    Ellipse()
                                        .frame(width: 42.14, height: 27.39)
                                        .padding(.top, 5.4)
                                }
                                .foregroundColor(.grey2)
                            )
                    }
                    .clipShape(Circle())
                    .padding(.top, 18)
                    .padding(.bottom, 12)
                    HStack(spacing: 0) {
                        Text("가나다라마바사")
                            .customFont(16, .semiBold)
                            .foregroundColor(.ticlemoaBlack)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                        Image("Pen")
                    }
                    Text("asdf12345@gmail.com")
                        .customFont(14, .medium)
                        .tint(.grey3)
                        .padding(.top, 2)
                        .padding(.bottom, 14)
                }
            }
            .padding(.top, 8)
            .padding(.bottom, 12)
            .padding(.horizontal, 81)
            
            VStack(spacing: 0) {
                MyPageNavigationView(imageName: "bell", title: "알림") {
                    AlertSettingView()
                }
                MyPageNavigationView(imageName: "Information", title: "서비스 정보") {
                    ServiceInformationView()
                }
                MyPageNavigationView(imageName: "QuestionMark", title: "문의하기") {
                    EmptyView()
                }
            }
            .padding(.bottom, 16)
            
            Button {
                Void()
            } label: {
                HStack {
                    Text("앱 버전정보 1.1.1")
                        .customFont(14, .medium)
                        .foregroundColor(.grey4)
                    Spacer()
                    Group {
                        if true {
                            Text("업데이트")
                                .customFont(12, .semiBold)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(
                                    Capsule()
                                        .foregroundColor(.ticlemoaBlack)
                                )
                                .padding(.vertical, 10)
                        } else {
                            Text("최신버전")
                                .customFont(14, .medium)
                                .foregroundColor(.grey3)
                                .padding(.vertical, 16.5)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            
            Button {
                Void()
            } label: {
                HStack {
                    Text("로그아웃")
                        .customFont(14, .medium)
                        .foregroundColor(.grey4)
                    Spacer()
                }
            }
            .padding(.vertical, 16.5)
            .padding(.horizontal, 20)
            
            Button {
                isAccountDeleteButtonTouched = true
            } label: {
                HStack {
                    Text("계정삭제")
                        .foregroundColor(.secondaryRed)
                        .customFont(14, .medium)
                    Spacer()
                }
            }
            .padding(.vertical, 16.5)
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .setupBackground()
        .navigationTitle("마이페이지")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAccountDeleteButtonTouched) {
            MyPageAccountDeletingView()
                .presentationDetents([.medium])
        }
    }
}

fileprivate struct MyPageNavigationView<Destination: View>: View {
    let imageName: String
    let title: String
    let destination: () -> Destination
    
    init(imageName: String, title: String, destination: @escaping () -> Destination) {
        self.imageName = imageName
        self.title = title
        self.destination = destination
    }
    
    var body: some View {
        NavigationLink {
            destination()
        } label: {
            VStack(spacing: 0) {
                HStack {
                    Image(imageName)
                    Text(title)
                        .customFont(16, .medium)
                    Spacer()
                    Image("Arrow.right")
                }
                .foregroundColor(.ticlemoaBlack)
                .padding(.vertical, 20)
                Divider()
                    .foregroundColor(.grey2)
            }
            .padding(.horizontal, 20)
        }
    }
}

fileprivate struct MyPageAccountDeletingView: View {
    var body: some View {
        VStack(spacing: 0) {
            Capsule()
                .foregroundColor(.ticlemoaBlack)
                .frame(width: 42, height: 4)
                .padding(18)
            Text("계정삭제")
                .font(.system(size: 18))
                .fontWeight(.bold)
                .padding(.top, 6.5)
                .padding(.bottom, 30.5)
            Spacer()
                .background(Rectangle())
                .padding(.horizontal, 36)
            VStack(spacing: 0) {
                HStack {
                    Text("정말로 계정을 삭제하시겠어요?")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.vertical, 4.5)
                .padding(.bottom, 4)
                
                HStack {
                    Text("N개의 콘텐츠가 모두 삭제되고, 계정은 복구할 수 없어요")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.grey4)
                    Spacer()
                }
                .padding(.vertical, 3.5)
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 36)
            HStack(spacing: 11) {
                Button {
                    Void()
                } label: {
                    HStack {
                        Spacer()
                        Text("취소")
                            .foregroundColor(.ticlemoaBlack)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(.grey2Line)
                    )
                }
                Button {
                    Void()
                } label: {
                    HStack {
                        Spacer()
                        Text("삭제")
                            .foregroundColor(.white)
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(.secondaryRed)
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 16)
        }
    }
}
