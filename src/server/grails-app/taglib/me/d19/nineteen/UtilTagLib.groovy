package me.d19.nineteen

class UtilTagLib {
	static returnObjectForTags = ['getAccounts']

    def utilService
	def accountService
    
	def getAccounts = { attrs, body ->
		accountService.getAccounts()
	}

    def formatBytes = { attrs, body ->
        out << utilService.formatBytes(attrs.bytes)
    }
}
