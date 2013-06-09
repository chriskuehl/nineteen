package me.d19.nineteen

class ServerController {
    def serverService
    
    def flushVarnish() {
        if (params.flush) {
            flash.successes = ["<strong>Varnish flushed.</strong> All caches should now be empty."]
            redirect(action: "flushVarnish")
            serverService.flushVarnish()
            
            return
        }
        
        render(view: "flush-varnish")
    }
    
    def stats() {
        render(view: "stats")
    }
    
    def reboot() {
        if (params.reboot) {
            flash.successes = ["<strong>Reboot scheduled.</strong> The server is now restarting."]
            redirect(action: "reboot")
            serverService.reboot()
            
            return
        }
        
        render(view: "reboot")
    }
    
    def update() {
        if (params.update) {
            def str = "<strong>Forcing update.</strong><br />"
            
            // update virtual hosts
            str += "<p>Updating virtual hosts.</p>\n"
            str += "<ul>\n"

            Domain.findAll().each { domain ->
                str += "<li>${domain.name}</li>\n"
                domain.updateWeb()
            }

            str += "</ul>\n"
            str += "<p>Virtual hosts updated.</p>"

            // increment serial numbers
            str += "<p>Incrementing serial numbers.</p>\n"
            str += "<ul>\n"

            Domain.findAll().each { domain ->
                str += "<li>${domain.name}</li>\n"
                domain.incrementSerial()
            }

            str += "</ul>\n"
            str += "<p>Serial numbers incremented.</p>"

            // done
            str += "<p>All done.</p>"
            
            flash.successes = [str]
            redirect(action: "update")
            
            return
        }
        
        render(view: "update")
    }
}
