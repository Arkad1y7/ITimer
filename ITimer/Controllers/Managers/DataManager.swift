
import Foundation
import FirebaseDatabase

final class DataManager {
    static let shared = DataManager()
    
    private let dataBase = Database.database().reference()
    public func insertUser(with user: ITimer){
        dataBase.child(user.email).setValue([
            "nickname": user.nickname
        ])
    }
}

struct ITimer {
    let nickname: String
    let email: String
    
}
