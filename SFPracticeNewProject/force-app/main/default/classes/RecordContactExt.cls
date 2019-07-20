public class RecordContactExt{

private Contact contact;

public RecordContactExt(ApexPages.StandardController sController){

this.contact = (Contact)sController.getRecord();

}

public String getCustomMessage(){

return 'Aquaman, Wayne told the ' + contact.FirstName + ', I believe that an enemy is coming from far away. ';

}

}