package me.d19.nineteen

class AccountService {
	static transactional = false

    def execService
	
	Account[] getAccounts() {
		def userNames = execService.exec("user/list.sh")
		return userNames.collect { getAccount(it) }
	}

	Account getAccount(def userName) {
		def info = execService.exec("user/info.sh ${userName}")

		def acc = new Account(
			name: userName,

			title: info[0],
			mysqlPassword: info[1]
		)

		return acc
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
