package me.d19.nineteen

class Domain {
    String root
    boolean useWWW = false
    boolean useSSL = false
    String cert = null
    
    Domain(String name) {
        
    }
    
    // generate all config files and reload/update the appropriate services for
    // this specific domain
    // 
    // - Apache virtualhost + SSL certificates
    // - DNS files
    void update() {
        domains.each { domain ->
            domain.update()
        }
    }
}
