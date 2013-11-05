package me.d19.nineteen

class DatabaseService {
	static transactional = false
    def execService
    
    def createUser(def username) {
        username = getUserName(username)
        
        execService.exec2(["mysql/add.sh", username])
    }
    
    def changePassword(def username, def password) {
        username = getUserName(username)
        
        execService.exec2(["mysql/change-password.sh", username, password])
    }
    
    def getUserName(def username) {
        return "www-" + username
    }
}
