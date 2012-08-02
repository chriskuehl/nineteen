package me.d19.nineteen

class WebService {
    def execService
    
    def updateDomain(def domain) { // usage: update.sh hostname username root useWWW useSSL javaPath
        execService.exec("apache/update.sh ${domain.name} ${domain.account.name} ${domain.root} ${domain.www ? "www" : "no-www"} ${domain.ssl != null ? "ssl" : "no-ssl"} ${domain.javaContext == null ? "-" : domain.javaContext}")
    }
}
