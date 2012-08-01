package me.d19.nineteen

class Account {
    def databaseService
    
    static hasMany = [domains: Domain]
    static constraints = {
        name size: 2..15, blank: false, unique: true, matches: "[a-z0-9-]*"
        title size: 2..20, blank: false, unique: true
    }
    
    String name // cannot be changed after creation
    String title
    
    String mysqlPassword
    
    long cacheDiskUsage = 0
    long cacheDatabaseUsage = 0
    
    Account() {
        generateMySQLPassword()
    }
    
    void generateMySQLPassword() {
        mysqlPassword = ""
        def chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        
        (0..30).each {
            mysqlPassword += (char) chars.charAt((int) Math.floor(Math.random() * chars.length()))
        }
        
        if (name != null) {
            databaseService.changePassword(name, mysqlPassword)
        }
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