public class EmailManager {
    public static void sendMail(String address, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toaddress = new String[] {address};
        mail.setToAddresses(toaddress);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        inspectResults(results);
    }
    
    private static boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean emailResults = true;
        for(Messaging.SendEmailResult res : results) {
            if(res.isSuccess()) {
                System.debug('Email sent successfully.');
            } else {
                emailResults = false;
                System.debug('The following errors occurred : ' + res.getErrors());
            }
        }
        return emailResults;
    } 
}