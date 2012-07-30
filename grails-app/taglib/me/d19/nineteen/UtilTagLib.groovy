package me.d19.nineteen

class UtilTagLib {
    def utilService
    
    def formatBytes = { attrs, body ->
        out << utilService.formatBytes(attrs.bytes)
    }
}
