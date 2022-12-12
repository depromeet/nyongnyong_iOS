//
//  HomeView.swift
//  Ticlemoa
//
//  Created by 김우성 on 2022/11/28.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            mainBody()
                .toolbar(content: {
                    // 네비게이션 제목
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        // TODO: 이미지로 변경 필요
                        Text("TICLEMOA")
                            .pretendFont(.title3)
                    }
                    
                    // 종모양 & 마이프로필
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(
                            destination: AlarmView(),
                            label: {
                                // TODO: 이미지 에셋 추가 시, 등록
//                                Image("alarm")
                                Image(systemName: "bell.badge")
                                    .symbolRenderingMode(.palette)
                                    .foregroundColor(.primary)
                            })
                        NavigationLink(destination: ProfileView(), label: {
                            Image("defaultProfile")
                        })
                    }
                })
                .setupBackground()
        }
    }
}

// MARK: - SubView
private extension HomeView {
    func mainBody() -> some View {
        VStack {
            Collapsible(
                label: {
                    Text("태그위치임")
                },
                content: {
                    HStack {
                        Text("짜란~")
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.secondary)
                }
            )
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            HomeArticleList()
                .environmentObject(viewModel)
            
            Spacer()
            Divider()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


// MARK: - Dummy
struct Tag: Identifiable {
    var id = UUID()
    var name: String
}

let tag01 = Tag(name: "첫번째")
let tag02 = Tag(name: "두번째")
let tag03 = Tag(name: "세번째")
let tag04 = Tag(name: "네번째")
let tag05 = Tag(name: "5번째")
let tag06 = Tag(name: "6번째")
let tag07 = Tag(name: "7번째")

var allTags: [Tag] { [tag01, tag02, tag03, tag04, tag05, tag06, tag07]}
