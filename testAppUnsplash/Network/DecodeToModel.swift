//
//  DecodeToModel.swift
//  testAppUnsplash
//
//  Created by fedot on 12.01.2022.
//

import Foundation
import UnsplashPhotoPicker

class DecodeToModel {
    private let key = "XKM_v1wPvif7JnLzYihma-KBkKuFvZf9IDC08_lziV0"
    
    var reguest: ReguestProtocol?
    init(reguest: ReguestProtocol = Reguest()) {
        self.reguest = reguest
    }
    
    func getUsers(completion: @escaping (Result<[UnsplashPhoto], Error>) -> Void) {
    
        let url = "https://api.unsplash.com/photos/?client_id=\(key)"
        reguest?.getReguest(url, completion: completion)
    }

}
