package me.d19.nineteen

class DomainController {
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
            
            def domain = new Domain(name: name, root: root, useWWW: www)
            
            if (domain.validate()) {
                domain.save()
                
                account.addDomain(domain)
                account.save()
                
                redirect(action: "view", params: [id: domain.name])
                return
            } else {
                params.errors = utilService.domainErrorsToList(domain)
            }
        }
        
        render(view: "add", model: [account: account])
    }
}
