package me.d19.nineteen

class ExecService {
	static transactional = false

	def grailsApplication

	def exec2(def cmd) {
		def lines = []
		def scriptPath = grailsApplication.config.nineteen.scriptPath

		cmd[0] = "${scriptPath}${cmd[0]}"
		cmd.add(0, "sudo")

        System.err.println("exec: " + cmd)

		def proc = cmd.execute()
		proc.in.eachLine { line -> lines.add(line) }

        return lines
	}
}
