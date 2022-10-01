//
//  User.swift
//  Twentyfour
//
//  Created by Sebastian Fox on 27.09.22.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

enum OnlineStatus {
    case online
    case offline
}

struct PublicProfile: Identifiable, Codable, Hashable {
    @DocumentID var id: String? = ""
    var name: String
    var email: String
    var imageUrl: String
//    var isOnline: Bool
//    var lastSeenOnline: Date
    var uid: String
}

extension PublicProfile {
    static let empty = PublicProfile(
        name: "",
        email: "",
        imageUrl: "",
//        isOnline: false,
//        lastSeenOnline: Date(),
        uid: ""
    )
}
