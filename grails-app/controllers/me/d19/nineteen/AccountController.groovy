package me.d19.nineteen

class AccountController {
    def utilService
    
    def add() {
        def name = ""
        def title = ""
        
        if (params.add) {
            name = params.name
            title = params.title
            
            def account = new Account(name: name, title: title)
            
            if (account.validate()) {
                account.save()
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
        def account = Account.findByName(params.id)
        
        if (params.update) {
            account.title = params.title
            
            if (account.validate()) {
                account.save()
                redirect(action: "view", params: [id: account.name])
                return
            } else {
                flash.errors = utilService.domainErrorsToList(account)
                redirect(action: "view", params: [id: account.name])
                return
            }
        } else if (params.mysqlRegen) {
            account.generateMySQLPassword()
            account.save()
            
            redirect(action: "view", params: [id: account.name])
        }
        
        render(view: "view", model: [account: account])
    }
}