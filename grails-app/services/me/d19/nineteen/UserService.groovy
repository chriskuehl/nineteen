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
}
