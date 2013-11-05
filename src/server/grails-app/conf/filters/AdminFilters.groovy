package filters

import org.codehaus.groovy.grails.commons.GrailsApplication
import grails.util.GrailsUtil

class AdminFilters {
	def request
	def response
	def hashingService

	def filters = {
		adminFilter(uri: "/**") {
			before = {
				// check the provided username and password
				def success = false
				def auth = request.getHeader("Authorization")

				if (auth) {
					def b64 = auth - 'Basic '  
					def raw =  new String(new sun.misc.BASE64Decoder().decodeBuffer(b64));  
					def parts = raw.split(':')

					if (parts.size() == 2 && parts[0].length() > 0 && parts[1].length() > 0) {
						def hash = System.env["NINETEEN_ADMIN_" + parts[0].toUpperCase()]

						try {
							if (hash && hash.length() > 0 && hashingService.matches(hash, parts[1])) {
								success = true
							}
						} catch (IllegalArgumentException ex) {}
					}
				}	

				if (! success) {
					response.addHeader("WWW-Authenticate", "Basic realm=\"Nineteen\"")
					render(view: "/denied", status: 401)
					return false
				}
			}
		}
	}
}
