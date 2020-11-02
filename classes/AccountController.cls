public with sharing class AccountController { 
    //Dev1
    public AccountController(){
        List<Account> accList = [SELECT Id, Name FROM Account];
        for(Account acc : accList){
            System.debug(acc);
        }
    }
    void test1(){}   
}