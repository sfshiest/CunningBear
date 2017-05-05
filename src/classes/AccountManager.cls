@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        
        Integer fin=request.requestURI.lastIndexOf('/');
        Integer start=request.requestURI.lastIndexOf('/',fin-1)+1;
        System.debug('start = '+ start);
        System.debug('end = '+ fin);
        String accountId = request.requestURI.substring(start,fin);
        System.debug('Account Id = '+ accountId);
        
        Account act =  [SELECT Name, (SELECT Name FROM Contacts) FROM Account WHERE Id = :accountID];
        System.debug('Account name = '+ act.Name);
        
        For(Contact c : act.Contacts){
            System.debug('Contact name = '+ c.Name);
        }
        return act;
        
    }
    
}