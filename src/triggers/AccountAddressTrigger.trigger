trigger AccountAddressTrigger on Account (before insert, before update) {
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        for (Account a : Trigger.new) {
            System.debug('iterating over accounts ' + a.Name);
            if (a.Match_Billing_Address__c && (a.BillingPostalCode != NULL )) {
            System.debug('matching billing address for ' + a.Name);
            System.debug('BillingPostalCode ' + a.BillingPostalCode);
                a.ShippingPostalCode = a.BillingPostalCode;
                
            }
        }
    }
}