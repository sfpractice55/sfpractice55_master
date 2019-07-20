trigger updateCountryFullNameonContact on Contact (before insert, before update) {
    Set<String> setCountryCodes;
    Set<String> setOwnerIds;
    Map<Id, String> ownerProfileMap = new Map<Id, String>();
    Map<String, Country__c> mapCountryDetails = new Map<String, Country__c>();
    String oldOwnerProfile;
    String currentOwnerProfile;
    try{        
        setCountryCodes = new Set<String>();
        setOwnerIds = new Set<String>();
        setOwnerIds.add(UserInfo.getUserId());
        for(Contact con : Trigger.new) {
            if(con.MailingCountry != null) {
                setCountryCodes.add((con.MailingCountry).toUpperCase());
            }
            if(con.OtherCountry != null) {
                setCountryCodes.add((con.OtherCountry).toUpperCase());
            }
            //setOwnerIds.add(con.OwnerId);
        }
        
        if(Trigger.isUpdate) {
            for(Contact c : Trigger.old) {
                setOwnerIds.add(c.OwnerId);
            }    
        }
        
        
        List<User> lstUsers = new List<User>([SELECT Id, Name, ProfileId, user.profile.Name
                                                FROM User
                                                WHERE Id IN : setOwnerIds
                                                AND ProfileId in (SELECT Id FROM Profile)]);
        
        for(User u : lstUsers) {
            System.debug('User Id : ' + u.id);
            System.debug('User Profile Name : ' + u.profile.Name);
            ownerProfileMap.put(u.id, u.profile.Name);
        }
        
        for(Country__c c : [SELECT Name,Full_Name__c from Country__c WHERE Name IN:setCountryCodes]) {
            mapCountryDetails.put(c.Name, c);
        }
        
        for(Contact c : Trigger.new) {
            if(Trigger.isInsert) {
                if(c.MailingCountry != null) {
                    Country__c cc= mapCountryDetails.get(c.Name);
                    if(cc != null) {
                        c.Physical_Country_Full_Name__c = cc.Full_Name__c;
                    }
                }
                if(c.OtherCountry != null) {
                    Country__c cc = mapCountryDetails.get(c.Name);
                    if(cc != null) {
                        c.Correspondence_Country_Full_Name__c = cc.Full_Name__c;
                    }                    
                }
            } 
            
            if(Trigger.isUpdate) {
                Contact cOld = Trigger.oldMap.get(c.Id);
                if(UserInfo.getUserId() != cOld.OwnerId) {
                    oldOwnerProfile = ownerProfileMap.get(cOld.id);
                    currentOwnerProfile = ownerProfileMap.get(UserInfo.getUserId());
                    
                    Config__c profileConfig = Config__c.getInstance('ContactTriggerSysAdminProfilesConfig');
                    Set<String> setOwnerProfile = new Set<String>();
                    setOwnerProfile.addAll(profileConfig.Value__c.split(';'));
                    
                    Set<String> setUserProfile = new Set<String>();
                    setUserProfile.addAll(profileConfig.Value1__c.split(';'));
                    
                    if(setOwnerProfile.contains(oldOwnerProfile) && (!setUserProfile.contains(currentOwnerProfile))) {
                        c.addError('You are not allowed to Edit...........');
                    }                    
                }
                
                if(cOld.MailingCountry <> c.MailingCountry){
                    if(c.MailingCountry != null) {
                        Country__c cc= mapCountryDetails.get(c.Name);
                        if(cc != null) {
                            c.Physical_Country_Full_Name__c = cc.Full_Name__c;
                        }
                    } else {
                        c.Physical_Country_Full_Name__c = '';
                    }
                    
                    if(c.OtherCountry != null) {
                        Country__c cc = mapCountryDetails.get(c.Name);
                        if(cc != null) {
                            c.Correspondence_Country_Full_Name__c = cc.Full_Name__c;
                        }                    
                    } else {
                        c.Correspondence_Country_Full_Name__c = '';
                    }
                }
            }
        }
        
         
        
        
        
    } catch(Exception e) {
        System.debug('Error occurred :' + e.getLineNumber());
    }
}