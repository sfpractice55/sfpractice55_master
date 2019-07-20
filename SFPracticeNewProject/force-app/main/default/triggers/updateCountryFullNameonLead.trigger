trigger updateCountryFullNameonLead on Lead (before insert, before update) {
    Set<String> setCountryCodes = new Set<String>();
    Map<String, Country__c> mapCountryDetails = new Map<String, Country__c>();
    try {
        for(Lead l : Trigger.New) {
            if(l.Country != null) {
                setCountryCodes.add(l.Country);
            }
        }
        
        for(Country__c c : [SELECT Name,Full_Name__c from Country__c WHERE Name IN:setCountryCodes]) {
            mapCountryDetails.put(c.Name, c);
        }
        
        for(Lead l : Trigger.new) {
            if(Trigger.isInsert) {
                if(l.Country != null) {
                    Country__c c = mapCountryDetails.get((l.Country).toUpperCase());
                    if(c != null) {
                        l.Country_Full_Name__c = c.Full_Name__c;    
                    }                    
                }
            }
            
            if(Trigger.isUpdate) {
                Lead lOld = Trigger.oldMap.get(l.Id);
                if((lOld.Country <> l.Country) || (lOld.Country_Full_Name__c <> l.Country_Full_Name__c)) {
                    if(l.Country != null) {
                        Country__c c = mapCountryDetails.get((l.Country).toUpperCase());
                        if(c != null) {
                            l.Country_Full_Name__c = c.Full_Name__c;    
                        } 
                    }
                }    
            }
        }
    } catch (Exception e) {
        System.debug('## Error for country lookup: ' + e);
    }    
}