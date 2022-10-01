//
//  ProfileViewModel.swift
//  Twentyfour
//
//  Created by Sebastian Fox on 01.10.22.
//

import Swift
import Foundation
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift

class ProfileViewModel: ObservableObject {
    // MARK: - Output
    @Published var publicProfile: PublicProfile
    
    // Published and saved to local device
    @Published var publicProfiles = [PublicProfile]()
    
    init() {
        self.publicProfile = PublicProfile.empty
    }
    
    init(publicProfile: PublicProfile) {
        self.publicProfile = publicProfile
    }
    
    init(uid: String) {
        self.publicProfile = PublicProfile.empty
        fetchPublicProfile(uid)
    }
    
    let db = Firestore.firestore()
    
    // Get a list of all users
    func fetchAllPublicProfiles(_ completion: @escaping (Bool, String) ->Void) {
        self.publicProfiles = []
        db.collection("publicProfiles").addSnapshotListener { (querySnapshot, error) in

            if error != nil {
                completion(false, "\(error!.localizedDescription)")
            }
            // Get Snapshot
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            // add users from snapshot to array
                self.publicProfiles = documents.map { queryDocumentSnapshot -> PublicProfile in
                    var tmpPublicProfile = PublicProfile.empty
                    do {
                        tmpPublicProfile =  try queryDocumentSnapshot.data(as: PublicProfile.self)
                    } catch {

                    }
                    return tmpPublicProfile
                }
                completion(true, "\(self.publicProfiles.count) users found")
            }

    }
    
    func fetchPublicProfile(_ uid: String) {
        db.collection("publicProfiles")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                }
                else {
                    if let querySnapshot = querySnapshot {
                        if let document = querySnapshot.documents.first {
                            do {
                                self.publicProfile = try document.data(as: PublicProfile.self)
                            }
                            catch {
                                
                            }
                        }
                    }
                }
            }
    }
    
}
