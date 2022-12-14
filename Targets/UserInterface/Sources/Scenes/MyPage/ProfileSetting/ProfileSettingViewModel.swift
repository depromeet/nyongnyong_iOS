//
//  ProfileSettingViewModel.swift
//  UserInterface
//
//  Created by 김용우 on 2023/01/08.
//  Copyright © 2023 nyongnyong. All rights reserved.
//

import SwiftUI

final class ProfileSettingViewModel: ObservableObject {
    @ObservedObject var modelContainer: ModelContainer
    @Published var isConfirmationDialogOpen: Bool = false
    @Published var isImagePickerOpen: Bool = false
    @Published var profileImageURL: URL?
    @Published var nickname: String = ""
    @AppStorage("Moamoa.userProfileImageURL") private var userProfileImageURL: URL?
    
    init(modelContainer: ModelContainer) {
        self.modelContainer = modelContainer
        self.profileImageURL = userProfileImageURL
    }
    
    func profileImageTouched() {
        isConfirmationDialogOpen = true
    }
    
    func nicknameTextfieldChanged() {
        nickname = String(nickname.prefix(10))
    }
    
    func selectPhotoInAlbumButtonTouched() {
        isImagePickerOpen = true
    }
    
    func updateProfileImage(fromUrl url: URL) {
        profileImageURL = url
    }
    
    func resetImage() {
        profileImageURL = nil
    }
    
    func saveButtonTouched() {
        userProfileImageURL = profileImageURL
        modelContainer.loginModel.nicknameChangeTo(nickname)
    }
}
