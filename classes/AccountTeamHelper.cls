public with sharing class AccountTeamHelper{
    public static Map<Id, List<Id>> userToTeamMap = new Map<Id, List<Id>>();
    public static Map<Id, Map<Id, AccountTeamMember>> accountAndTeamMap = new Map<Id, Map<Id, AccountTeamMember>>();

    private void trackUserAccountTeam(List<Account> accountList, Set<Id> userIds){
        List<Id> memberList;
        for(UserAccountTeamMember member : [SELECT UserId, OwnerId from UserAccountTeamMember WHERE OwnerID = :userIds]){
            if (AccountTeamHelper.userToTeamMap.containsKey(member.OwnerId)){
                memberList = AccountTeamHelper.userToTeamMap.get(member.OwnerId);
            } else{
                memberList = new List<Id>();
            }
            if (memberList.contains(member.UserId)){
                continue;
            }
            memberList.add(member.UserId);
            AccountTeamHelper.userToTeamMap.put(member.OwnerId, memberList);
        }
    }

    private void insertPreviousAccountTeam(List<Account> accountList){
        List<AccountTeamMember> accountTeamMemberList = new List<AccountTeamMember>();
        Map<Id, AccountTeamMember> memberMap;
        List<Id> userToTeamList;
        for (Account account : accountList){
            if (AccountTeamHelper.accountAndTeamMap.containsKey(account.Id)){
                memberMap = AccountTeamHelper.accountAndTeamMap.get(account.Id);
                if (AccountTeamHelper.userToTeamMap.containsKey(account.OwnerId)){
                    userToTeamList = AccountTeamHelper.userToTeamMap.get(account.OwnerId);
                    for (Id userId : userToTeamList){
                        if (memberMap.containsKey(userId)){
                            memberMap.remove(userId);
                        }
                    }
                }
                if (!memberMap.isEmpty()){
                    accountTeamMemberList.addAll(memberMap.values());
                }
                AccountTeamHelper.accountAndTeamMap.remove(account.Id);
            }
        }

        if (!accountTeamMemberList.isEmpty()){
            insert accountTeamMemberList;
        }
    }
}
