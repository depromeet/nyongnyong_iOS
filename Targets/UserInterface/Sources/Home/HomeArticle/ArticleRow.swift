//
//  ArticleRow.swift
//  Ticlemoa
//
//  Created by 김우성 on 2022/12/04.
//  Copyright © 2022 nyongnyong. All rights reserved.
//

import SwiftUI

struct ArticleRow: View {
    let title: String
    
    var body: some View {
        HStack(alignment: .center) {
            Color.grey2
                .frame(maxWidth: 88, maxHeight: 88)
                .padding(.leading, 20)
                .padding(.trailing, 12)
            VStack(alignment:.leading) {
                Text(title)
                    .pretendFont(.subhead3)
                    .padding(.top, 14)
                Spacer()
                Text("태그들")
                    .pretendFont(.body1)
                    .foregroundColor(Color.grey4)
                    .padding(5)
                    .background(Color.grey2)
                    .background(
                        RoundedRectangle(cornerRadius: 5,style: .continuous)
                            .foregroundColor(Color.grey1)
                    )
                    .padding(.bottom, 14)
            }
            Spacer()
            VStack {
                Text("...")
                    .padding(.top, 14)
                Spacer()
            }
            .padding(.trailing, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: 106)
        .listRowInsets(EdgeInsets(top: 14, leading: 0, bottom: 14, trailing: 0))
        .listRowSeparator(.hidden)
        .listRowBackground(Color.grey1)
        .background(Color.grey1)
    }
}

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(title: "프리뷰 타이틀...")
    }
}

