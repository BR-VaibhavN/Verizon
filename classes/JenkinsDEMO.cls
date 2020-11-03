public class JenkinsDEMO {
    void fun1(){
        List<Account> accountList = [SELECT Id, Name FROM Account LIMIT 5];
        for (Account acc : accountList){
            System.debug(acc.Id);
        }   
    }

    void fun2(){
        // Added Sprint 2 functionality
    }


}