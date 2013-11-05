package me.d19.nineteen

import org.apache.commons.io.FileUtils

class UtilService {
	static transactional = false
    def messageSource
    
    def domainErrorsToList(def object) {
        def locale = Locale.getDefault()
        def messages = []
        
        object.errors.allErrors.each { error ->
            def message = messageSource.getMessage(error, locale)
            messages.add(message)
        }
        
        messages
    }
    
    def formatBytes(def size) {
        def displaySize
        
        if (Math.floor(size / FileUtils.ONE_GB)  > 0) {
            double newSize = Math.floor(size / FileUtils.ONE_GB * 10)
            displaySize = String.valueOf(newSize / 10) + " GB"
        } else if (Math.floor(size / FileUtils.ONE_MB)  > 0) {
            double newSize = Math.floor(size / FileUtils.ONE_MB * 10)
            displaySize = String.valueOf(newSize / 10) + " MB"
        } else if (Math.floor(size / FileUtils.ONE_KB)  > 0) {
            double newSize = Math.floor(size / FileUtils.ONE_KB * 10)
            displaySize = String.valueOf(newSize / 10) + " KB"
        } else {
            displaySize = String.valueOf(size) + " bytes"
        }
        
        displaySize
    }

	def generatePassword(def nchars) {
        def chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		def password = ""

        (0..nchars).each {
            password += (char) chars.charAt((int) Math.floor(Math.random() * chars.length()))
        }

		password
	}
}
