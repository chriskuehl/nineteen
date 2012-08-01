package me.d19.nineteen

class UserService {
    def execService
    
    def createUser(def username) {
        username = getUserName(username)
        
        execService.exec("user/add.sh " + username)
    }
    
    def getUserName(def username) {
        return "www-" + username
    }
    
    def createRoot(def username, def root) {
        username = getUserName(username)
        
        execService.exec("user/create-root.sh " + username + " " + root)
    }
}