trigger emailTriggerHandler on EmailMessage (before insert) {

    if (trigger.isBefore && trigger.isInsert) {
    
        Id userId = UserInfo.getUserId();
        List<EmailServicesAddress> emailToSF = new List<EmailServicesAddress>([SELECT LocalPart, EmailDomainName FROM EmailServicesAddress WHERE Function.FunctionName = 'EmailToSalesforce' AND RunAsUserId = :userId]);    
        system.debug('SPC Running ' + emailToSF[0].EmailDomainName);

        for(EmailMessage em : trigger.new){
            system.debug('SPC mailto ' + em.FromAddress);
            system.debug('SPC mailto ' + em.FromName);
            em.FromAddress = 'emailtosalesforce@' + emailToSF[0].EmailDomainName;
            em.FromName = 'Phoebe';
            system.debug('SPC mailto ' + em.FromAddress);
            system.debug('SPC mailto ' + em.FromName);            
        }
        
        system.debug(trigger.new);
        
    }

}