public class OneLeadController {

    @AuraEnabled
    public static Id createLead(Lead theLead1) {
        insert theLead1;
        return theLead1.Id;
    }
}