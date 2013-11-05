package me.d19.nineteen

class AccountController {
	static transactional = false

    def utilService
    def accountService
    def databaseService
    
    def add() {
        def name = ""
        def title = ""
        
        if (params.add) {
            name = params.name
            title = params.title
            
            def account = new Account(name: name, title: title)
            
            if (account.validate()) {
                accountService.createUser(name, title)
                
				// databaseService.createUser(name)
                
                account.generateMySQLPassword()
                account.generateSFTPPassword()
                
                redirect(action: "view", params: [id: account.name])
                return
            } else {
                params.errors = utilService.domainErrorsToList(account)
            }
        }
        
        render(view: "add")
    }
    
    def list() {
        render(view: "list")
    }
    
    def view() {
        def account = accountService.getAccount(params.id)
        
        if (params.update) {
            account.title = params.title
            
            if (account.validate()) {
				accountService.changeTitle(account.name, account.title)
                redirect(action: "view", params: [id: account.name])
                return
            } else {
                flash.errors = utilService.domainErrorsToList(account)
                redirect(action: "view", params: [id: account.name])
                return
            }
        }  else if (params.mysqlRegen) {
            account.generateMySQLPassword()
            redirect(action: "view", params: [id: account.name])
        } else if (params.sftpRegen) {
            account.generateSFTPPassword()
            redirect(action: "view", params: [id: account.name])
        }
        
        render(view: "view", model: [account: account])
    }
	
	def delete() {
		def account = accountService.getAccount(params.id)
		
		if (account) {
			if (params.delete) {
				accountService.deleteAccount(params.id)
                redirect(action: "list")
                return
			} else {
				render(view: "delete", model: [account: account])
			}
		} else {
			return redirect(controller: "account", action: "list")
		}
	}
}
