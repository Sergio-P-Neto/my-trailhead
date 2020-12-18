public class DocumentPreviewController {
    @AuraEnabled
    public static List<Id> registerAttachments(Id registerId) {
        List<ContentDocumentLink> lstContentDocument = [SELECT Id, LinkedEntityId, ContentDocumentId FROM ContentDocumentLink 
                                                        WHERE LinkedEntityId =: registerId];
        List<Id> setContentDocumentId = new List<Id>();
        for (ContentDocumentLink contentDocument : lstContentDocument) {
            setContentDocumentId.add(contentDocument.ContentDocumentId);
        }
        return setContentDocumentId;
    }
}