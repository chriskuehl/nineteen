package me.d19.nineteen

class ServerService {
	static transactional = false

    def execService
    
    def reboot() {
        execService.exec2(["server/reboot.sh"])
    }
}
