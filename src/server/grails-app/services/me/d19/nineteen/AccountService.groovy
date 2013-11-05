package me.d19.nineteen

class AccountService {
	static transactional = false

    def execService
	
	Account[] getAccounts() {
		def userNames = execService.exec2(["user/list.sh"])
		return userNames.collect { getAccount(it) }
	}

	Account getAccount(def userName) {
		def info = execService.exec2(["user/info.sh", userName])

		def acc = new Account(
			name: userName,

			title: info[0],
			mysqlPassword: info[1],
			sftpPassword: info[2],
			diskUsage: info[3],
			databaseUsage: info[4]
		)

		return acc
	}

	def changeTitle(def userName, def title) {
		execService.exec2(["user/change-title.sh", userName, title])
	}

	def changeSFTPPassword(def userName, def password) {
		execService.exec2(["user/change-sftp-password.sh", userName, password])
	}

	def changeMySQLPassword(def userName, def password) {
		execService.exec2(["user/change-mysql-password.sh", userName, password])
	}
    
    def createUser(def userName, def title) {
		execService.exec2(["user/add.sh", userName, title])
    }
    
    def createRoot(def userName, def root) {
        userName = getuserName(userName)
        
        execService.exec2(["user/create-root.sh", userName, root])
    }

	def deleteAccount(def userName) {
		execService.exec2(["user/del.sh", userName])
	}
}
