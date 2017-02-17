public class LeadData {
  @AuraEnabled
    public static List<String> getpickval() {
        List<String> options = new List<String>();

        Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();

        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();

        for (Schema.PicklistEntry f: ple) {
            options.add(f.getLabel());
        }       
        return options;
    }
}