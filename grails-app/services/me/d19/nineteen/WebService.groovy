package me.d19.nineteen

class WebService {
    def execService
    def userService
    
    def updateDomain(def domain) { // usage: update.sh hostname username root useWWW useSSL javaPath
        execService.exec("apache/update.sh ${domain.name} ${userService.getUserName(domain.account.name)} ${domain.root} ${domain.useWWW ? "www" : "no-www"} ${domain.sslCert != null ? "ssl" : "no-ssl"} ${domain.javaContext == null ? "-" : domain.javaContext}")
    }
}