package me.d19.nineteen

class AccountService {
	static transactional = false

    def execService
	
	Account[] getAccounts() {
		def userNames = execService.exec(["user/list.sh"])
		return userNames.collect { getAccount(it) }
	}

	Account getAccount(def userName) {
		println userName
		def info = execService.exec(["user/info.sh", userName])
		println "info="
		println info

		def acc = new Account(
			name: userName,

			title: info[0],
			mysqlPassword: info[1],
			sftpPassword: info[2],
			diskUsage: info[3].toLong(),
			databaseUsage: info[4].toLong(),
			protectedUser: info[5] == "1"
		)
		println "acc="
		println acc

		return acc
	}

	def changeTitle(def userName, def title) {
		execService.exec(["user/change-title.sh", userName, title])
	}

	def changeSFTPPassword(def userName, def password) {
		execService.exec(["user/change-sftp-password.sh", userName, password])
	}

	def changeMySQLPassword(def userName, def password) {
		execService.exec(["user/change-mysql-password.sh", userName, password])
	}
    
    def createUser(def userName, def title) {
		execService.exec(["user/add.sh", userName, title])
    }
    
    def createRoot(def userName, def root) {
        userName = getuserName(userName)
        
        execService.exec(["user/create-root.sh", userName, root])
    }

	def deleteAccount(def userName) {
		execService.exec(["user/del.sh", userName])
	}
}
