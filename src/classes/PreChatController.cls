global class PreChatController
{

    @remoteAction
    global static sobject findLeadOrContactByEmail(string name, string email, string phone)
    {
        sObject returnObject; //the id that will store the contact or lead this chat is related to
        //first we should see if there is a contact with this email
        list<contact> contacts = [select accountid, name, id, email from contact where email = :email limit 1];
        if(!contacts.isEmpty())
        {
            return contacts[0];
        }

        //if there is no contact, then lets look for a lead instead. Yeah we could combind both queries into a single SOSL search, but the code for that doesn't
        //end up being much cleaner when you account for having to figure out what record to return when you have a list of lists.
        else
        {
            list<lead> leads = [select name, id, email from lead where email = :email limit 1];
            if(!leads.isEmpty())
            {
                return leads[0];
            }
            else
            {            
                lead thisLead = new lead();
                string[] nameParts = name.split(' ');

                thisLead.firstname = nameParts.size() > 1 ? nameParts[0] : ''; //if name parts contains more than one element that means we likely got a full name and the first part is the firstname. Otherwise nothing
                thisLead.lastname =  nameParts.size() > 1 ? nameParts[1] : nameParts[0]; //if name parts is greater than 1 then use the 2nd element as the lastname. Otherwise use the first element
                thisLead.phone = phone;
                thisLead.email = email;
                thisLead.company = name;
                thisLead.leadSource = 'Web Site';

                insert thisLead;
                return thisLead;
            }
        }
    }
}