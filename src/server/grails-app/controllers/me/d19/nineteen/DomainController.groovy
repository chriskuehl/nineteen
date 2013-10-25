package me.d19.nineteen

class DomainController {
	static transactional = false

    def utilService
    
    def add() {
        def account = Account.findByName(params.id)
        
        def name = ""
        def root = ""
        def www = false
        
        if (params.add) {
            name = params.name
            root = params.root
            www = params.www ? true : false
            
            def domain = new Domain(name: name, root: root, useWWW: www, account: account)
            
            if (domain.validate()) {
                account.addDomain(domain)
                domain.resetSerial()
                domain.createRoot()
                domain.updateWeb()
                
                account.save()
                domain.save()
                
                redirect(action: "view", params: [id: domain.name])
                return
            } else {
                params.errors = utilService.domainErrorsToList(domain)
            }
        }
        
        render(view: "add", model: [account: account])
    }
    
    def view() {
        def domain = Domain.findByName(params.id)
        
        if (params.update) {
            domain.root = params.root
            domain.useWWW = params.www ? true : false
            domain.sslCert = params.ssl ? "ssl" : null
            domain.javaContext = params.java.length() > 0 ? params.java : null
            domain.useAuth = params.auth ? true : false
            
            if (domain.validate()) {
                domain.createRoot()
                domain.updateWeb()
                domain.save()
                redirect(action: "view", params: [id: domain.name])
                return
            } else {
                flash.errors = utilService.domainErrorsToList(domain)
                redirect(action: "view", params: [id: domain.name])
                return
            }
        }
        
        render(view: "view", model: [domain: domain])
    }
}
