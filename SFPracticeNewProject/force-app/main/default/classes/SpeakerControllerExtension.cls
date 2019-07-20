public with sharing class SpeakerControllerExtension {
    
    public blob picture { get; set; }
	public String errorMessage { get; set; }

    private final Speaker__c speaker;
    private ApexPages.StandardController stdController;
    
    public SpeakerControllerExtension(ApexPages.StandardController stdController) {
        this.speaker = 	(Speaker__c)stdController.getRecord();
        this.stdController = stdController;
    }
    
    public PageReference save() {
        errorMessage = '';
        try {
            upsert speaker;
            if(picture != null) {
                Attachment att = new Attachment();
                att.Body = picture;
                att.Name = 'speaker_' + speaker.id + '.jpg';
                att.ParentId = speaker.Id;
                att.ContentType = 'application/jpg';
                insert att;
                speaker.Picture_Path__c = '/servlet/servlet.FileDownload?file=' + att.id;
                update speaker;
            }
            return new ApexPages.StandardController(speaker).view();
        } catch (System.Exception ex) {
            errorMessage = ex.getMessage();
            return null;
        }
    }
    
    
}