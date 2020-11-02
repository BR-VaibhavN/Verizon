public with sharing class AccountController { 
    //Dev1
    public AccountController(){
        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 5];
    }
    void test1(){}   
}
