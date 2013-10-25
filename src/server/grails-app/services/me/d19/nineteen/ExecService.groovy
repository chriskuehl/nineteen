package me.d19.nineteen

class ExecService {
	static transactional = false

	def grailsApplication
    
    def exec(def cmd) {
		def scriptPath = grailsApplication.config.nineteen.scriptPath
        def output = ""
        cmd = "sudo " + scriptPath + cmd + "\n"
        
        System.err.println("exec: " + cmd)
        
        try {
            Process p = Runtime.getRuntime().exec(cmd)
            p.waitFor()
            
            BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()))
            
            while (r.ready()) {
                output += r.readLine() + "\n"
            }
        } catch (Throwable t) {
            t.printStackTrace()
            return null
        }
        
        output = output.substring(0, output.length() - 1) // remove newline at the end
        
        return output
    }
}
