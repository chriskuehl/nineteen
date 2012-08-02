package me.d19.nineteen

class ServerController {
    def update() {
        // update virtual hosts
        render "<p>Updating virtual hosts.</p>\n"
        render "<ul>\n"
        
        Domain.findAll.each { domain ->
            render "<li>${domain.name}</li>\n"
            domain.updateWeb()
        }
        
        render "</ul>\n"
        render "<p>Virtual hosts updated.</p>"
        
        // increment serial numbers
        render "<p>Incrementing serial numbers.</p>\n"
        render "<ul>\n"
        
        Domain.findAll.each { domain ->
            render "<li>${domain.name}</li>\n"
            domain.incrementSerial()
        }
        
        render "</ul>\n"
        render "<p>Serial numbers incremented.</p>"
        
        // done
        render "<p>All done.</p>"
    }
}
