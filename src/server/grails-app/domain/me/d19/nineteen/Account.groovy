package me.d19.nineteen

class Account {
    def databaseService
	def accountService
	def utilService

	static constraints = {
		mysqlPassword(nullable: true)
		sftpPassword(nullable: true)
	}

    String name // cannot be changed after creation
    String title
	
	List domains = []
    
    String mysqlPassword
	String sftpPassword
    
    long diskUsage = 0
    long databaseUsage = 0

	boolean protectedUser

	void generateSFTPPassword() {
		sftpPassword = utilService.generatePassword(30)
		accountService.changeSFTPPassword(name, sftpPassword)
	}
    
    void generateMySQLPassword() {
		mysqlPassword = utilService.generatePassword(30)

		accountService.changeMySQLPassword(name, mysqlPassword)
		//databaseService.changePassword(name, mysqlPassword)
    }

    // domain management
    void addDomain(Domain domain) {
        domain.account = this
        domains.add(domain)
    }
    
    // generate all config files and reload/update the appropriate services
    // 
    // - MySQL user configuration (passwords and such)
    // ...and anything domain-specific
    void update() {
        // MySQL
        
        
        // have each of the domains do its thing
        domains.each { domain ->
            domain.update()
        }
    }
    
    // re-calculate the cached values (things like disk space, database size
    // usage, etc.)
    void calculate() {
        
    }
}
