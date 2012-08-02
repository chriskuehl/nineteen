package me.d19.nineteen

import java.text.SimpleDateFormat

class Domain {
    def nameserverService
    def userService
    def webService
    
    static constraints = {
        name unique: true, blank: false
        root blank: false
        sslCert nullable: true
        javaContext nullable: true
    }
    
    String name
    String root
    boolean useWWW = false
    String sslCert = null
    String serial = "1970010100"
    String javaContext = null
    
    Account account
    
    def updateWeb() {
        webService.updateDomain(this)
    }
    
    def createRoot() {
        userService.createRoot(account.name, root)
    }
    
    def resetSerial() {
        def dateFormat = new SimpleDateFormat("yyyyMMdd")
        serial = dateFormat.format(new Date()) + "00"
        
        updateSerial()
    }
    
    def incrementSerial() {
        long lSerial = Long.valueOf(serial) + 1
        serial = String.valueOf(lSerial)
        
        updateSerial()
    }
    
    def updateSerial() {
        nameserverService.updateDomain(this)
    }
    
    // generate all config files and reload/update the appropriate services for
    // this specific domain
    // 
    // - Apache virtualhost + SSL certificates
    // - DNS files
    void update() {
        // TODO: update
    }
}
