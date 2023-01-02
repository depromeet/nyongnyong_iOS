//
//  HomeView.swift
//  Ticlemoa
//
//  Created by 김우성 on 2022/11/28.
//

import SwiftUI

let tagHeight = 32

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    @State var isFolding = false
    @State var isPushSearchView = false
    
    var body: some View {
        NavigationView {
            mainBody
                .setupBackground()
        }
    }
}

// MARK: - SubView
private extension HomeView {
    @ViewBuilder
    var mainBody: some View {
        ZStack {
            tagListView
            
            VStack {
                Spacer()
                    .frame(maxHeight: 36)
                
                // Taglist Height 조절
                Spacer()
                    .frame(minHeight: 0, maxHeight: isFolding ? viewModel.tagListHeight : 35)

                HomeArticleList()
                    .padding(.top, 0)
                    .animation(.default)
                    .transition(.slide)
                    .environmentObject(viewModel)
                    .setupBackground()
                
                Spacer()
                Divider()
            }
        }
    }
    
    var tagListView: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(Array(viewModel.rows.enumerated()), id:\.offset) { columnIndex, rows in
                    HStack(spacing: 10) {
                        ForEach(Array(rows.enumerated()), id: \.offset){ rowIndex, row in
                            makeTagButton(row: row)

                        }
                    }
                    .frame(height: 28)
                    .padding(.vertical, 10)
                }
                
                Spacer()
            }
            .padding(.top, 24)
            .padding(.trailing, 65)
            
            VStack {
                HStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(Color.clear)
                        .frame(width: 24, height: 24)
                        .overlay {
                            Image(systemName: isFolding ? "chevron.down" : "chevron.up")
                                .animation(.linear)
                        }
                    Spacer()
                        .frame(maxWidth: 20)
                }
                .padding(.top, 20)
                Spacer()
            }
            .onTapGesture {
                withAnimation { isFolding.toggle() }
            }
        }
    }
    
    func makeTagButton(row: TagData) -> some View{
        return Button(action: {
            HapticManager.instance.impact(style: .light)
            viewModel.selectedTag = row
        }, label: {
            Text(row.name)
        })
        .pretendFont(.body2)
        .foregroundColor(
            //                                    columnIndex == 0 && rowIndex == 0
            viewModel.selectedTag == row
            ? Color.white
            : .grey4
        )
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            ZStack(alignment: .trailing){
                RoundedRectangle(cornerRadius: 4)
                    .fill(
                        viewModel.selectedTag == row
                        ? Color.ticlemoaBlack
                        : Color.grey2
                    )
            }
        )
    }
}

import Domain
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(model: TagModel()))
    }
}


extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.width
}


extension String{
    func getSize() -> CGFloat{
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}