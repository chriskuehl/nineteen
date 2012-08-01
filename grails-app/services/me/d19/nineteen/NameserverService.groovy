package me.d19.nineteen

class NameserverService {
    def execService
    
    def updateDomain(Domain domain) {
        execService.exec("bind/update.sh " + domain.name + " " + domain.serial)
    }
}
