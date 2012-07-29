package me.d19.nineteen

class Account {
    static hasMany = [domains: Domain]
    
    String name // cannot be changed after creation
    String title
    
    // constructor
    Account(def name, def title) {
        this.name = name
        this.title = title
        
        save()
    }
    
    // domain management
    void addDomain(Domain domain) {
        
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