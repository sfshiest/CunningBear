global class NotonSafariPolicyCondition implements TxnSecurity.PolicyCondition {

 public boolean evaluate(TxnSecurity.Event e) {
LoginHistory eObj = [SELECT Browser FROM LoginHistory WHERE Id = :e.data.get('LoginHistoryId')];
  if(eObj.Browser == 'Safari') {
   return true;
 }

 return false; 
}
 }