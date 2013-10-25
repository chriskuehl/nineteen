package me.d19.nineteen

class AccountService {
	static transactional = false

    def execService
	
	Account[] getAccounts() {
		def outt = execService.exec("user/list.sh")
		println outt

		return []
	}
    
    def createUser(def username) {
        username = getUserName(username)
        
        execService.exec("user/add.sh " + username)
    }
    
    public def getUserName(def username) {
        return "www-" + username
    }
    
    def createRoot(def username, def root) {
        username = getUserName(username)
        
        execService.exec("user/create-root.sh " + username + " " + root)
    }
}
