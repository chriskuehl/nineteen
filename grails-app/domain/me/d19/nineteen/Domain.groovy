package me.d19.nineteen

class Domain {
    static constraints = {
        name unique: true, blank: false
        root blank: false
        sslCert nullable: true
    }
    
    String name
    String root
    boolean useWWW = false
    String sslCert = null
    
    // generate all config files and reload/update the appropriate services for
    // this specific domain
    // 
    // - Apache virtualhost + SSL certificates
    // - DNS files
    void update() {
        // TODO: update
    }
}
