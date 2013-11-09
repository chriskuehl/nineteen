package me.d19.nineteen

class AccountService {
	static transactional = false

    def execService
	
	Account[] getAccounts() {
		def userNames = execService.exec(["user/list"])
		return userNames.collect { getAccount(it) }
	}

	Account getAccount(def userName) {
		def info = execService.exec(["user/info", userName])

		def acc = new Account(
			name: userName,

			title: info[0],
			mysqlPassword: info[1],
			sftpPassword: info[2],
			diskUsage: info[3].toLong(),
			databaseUsage: info[4].toLong(),
			protectedUser: info[5] == "1"
		)

		return acc
	}

	def changeTitle(def userName, def title) {
		execService.exec(["user/change-title", userName, title])
	}

	def changeSFTPPassword(def userName, def password) {
		execService.exec(["user/change-sftp-password", userName, password])
	}

	def changeMySQLPassword(def userName, def password) {
		execService.exec(["user/change-mysql-password", userName, password])
	}
    
    def createUser(def userName, def title) {
		execService.exec(["user/add", userName, title])
    }
    
    def createRoot(def userName, def root) {
        userName = getuserName(userName)
        
        execService.exec(["user/create-root", userName, root])
    }

	def deleteAccount(def userName) {
		execService.exec(["user/del", userName])
	}
}
