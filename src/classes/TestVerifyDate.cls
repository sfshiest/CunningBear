@isTest
private class TestVerifyDate {
    
   @isTest static void testDateOrder() {       
       Date date1 = Date.newInstance(2017,4,10);
       Date date2 = Date.newInstance(2017,3,30);
       Date EOM = Date.newInstance(2017,4,30);
       Date dtc = VerifyDate.CheckDates(date1, date2);
       System.assertEquals(EOM, dtc);
   }
    
   @isTest static void testDatewithin30days() {       
       Date date1 = Date.newInstance(2017,4,10);
       Date date2 = Date.newInstance(2017,4,30);
       Date EOM = Date.newInstance(2017,4,30);
       Date dtc = VerifyDate.CheckDates(date1, date2);
       System.assertEquals(date2, dtc);
   }
    
    
    
    
}