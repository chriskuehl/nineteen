package me.d19.nineteen

class ServerService {
    def execService
    
    def reboot() {
        execService.exec("server/reboot.sh")
    }
    
    def flushVarnish() {
        execService.exec("server/flush-varnish.sh")
    }
}
