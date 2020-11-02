public class TESTDEPLOY {
    //Test Deploy Pipeline FROM DEV
    void deploy(){
        List<Account> accList = [SELECT ID,Name,BillingCountry FROM Account];
        for(Account acc : accList){
            System.debug('Account Name' + acc.Name);
            System.debug('Account Name' + acc.BillingCountry);
        }
    }
    void test12(){
        
    }
}