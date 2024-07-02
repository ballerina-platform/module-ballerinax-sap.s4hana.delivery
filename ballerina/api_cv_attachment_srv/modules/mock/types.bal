// AUTO-GENERATED FILE.
// This file is auto-generated by the Ballerina OpenAPI tool.

import ballerina/constraint;

public type AttachmentHarmonizedOperation record {
    string? DocumentInfoRecordDocType?;
    string? DocumentInfoRecordDocNumber?;
    string? DocumentInfoRecordDocVersion?;
    string? DocumentInfoRecordDocPart?;
    @constraint:String {maxLength: 32}
    string LogicalDocument?;
    @constraint:String {maxLength: 40}
    string ArchiveDocumentID?;
    @constraint:String {maxLength: 90}
    string LinkedSAPObjectKey?;
    string? BusinessObjectTypeName?;
    string? FileSize?;
    string? FileName?;
    string? MimeType?;
    string? CheckoutUser?;
    string? CheckoutUserFullName?;
    string? CreatedByUser?;
    string? CreatedByUserFullName?;
    string? CreationDateTime?;
    string? LastChangedByUser?;
    string? LastChangedByUserFullName?;
    string? ChangedDateTime?;
    string? StorageCategory?;
    string? ArchiveLinkRepository?;
    @constraint:String {maxLength: 30}
    string SAPObjectType?;
    string? SAPObjectNodeType?;
    @constraint:String {maxLength: 40}
    string HarmonizedDocumentType?;
    boolean? AttachmentDeletionIsAllowed?;
    boolean? AttachmentRenameIsAllowed?;
    string? URLToUploadAttachment?;
    string? URLToReadAttachment?;
    string? OneTimeValidTokenForAttachment?;
};

public type CreateAttachmentHarmonizedOperation record {
    string? MimeType?;
};

# The number of entities in the collection. Available when using the [$inlinecount](https://help.sap.com/doc/5890d27be418427993fafa6722cdc03b/Cloud/en-US/OdataV2.pdf#page=67) query option.
public type count string;

public type CollectionOfA_DocumentInfoRecordAttch record {
    count __count?;
    A_DocumentInfoRecordAttch[] results?;
};

public type AttachmentContent record {
    @constraint:String {maxLength: 3}
    string DocumentInfoRecordDocType?;
    @constraint:String {maxLength: 25}
    string DocumentInfoRecordDocNumber?;
    @constraint:String {maxLength: 2}
    string DocumentInfoRecordDocVersion?;
    @constraint:String {maxLength: 3}
    string DocumentInfoRecordDocPart?;
    @constraint:String {maxLength: 32}
    string LogicalDocument?;
    @constraint:String {maxLength: 40}
    string ArchiveDocumentID?;
    @constraint:String {maxLength: 90}
    string LinkedSAPObjectKey?;
    @constraint:String {maxLength: 40}
    string BusinessObjectTypeName?;
    string? SemanticObject?;
    string? WorkstationApplication?;
    string? FileSize?;
    string? FileName?;
    string? DocumentURL?;
    string? MimeType?;
    string? Content?;
    string? CreatedByUser?;
    string? CreatedByUserFullName?;
    string? CreationDateTime?;
    string? BusinessObjectType?;
    string? LastChangedByUser?;
    string? LastChangedByUserFullName?;
    string? ChangedDateTime?;
    string? StorageCategory?;
    string? ArchiveLinkRepository?;
    string? SAPObjectType?;
    string? SAPObjectNodeType?;
    string? HarmonizedDocumentType?;
    boolean? AttachmentDeletionIsAllowed?;
    boolean? AttachmentRenameIsAllowed?;
    string? Source?;
    string? AttachmentContentHash?;
};

public type CollectionOfA_DocumentInfoRecordAttchWrapper record {
    CollectionOfA_DocumentInfoRecordAttch d?;
};

public type A_DocumentInfoRecordAttchOrderByOptions ("DocumentInfoRecordDocType"|"DocumentInfoRecordDocType desc"|"DocumentInfoRecordDocNumber"|"DocumentInfoRecordDocNumber desc"|"DocumentInfoRecordDocVersion"|"DocumentInfoRecordDocVersion desc"|"DocumentInfoRecordDocPart"|"DocumentInfoRecordDocPart desc"|"DocumentInfoRecord"|"DocumentInfoRecord desc"|"DocumentDescription"|"DocumentDescription desc"|"ExternalDocumentStatus"|"ExternalDocumentStatus desc"|"DocumentStatusName"|"DocumentStatusName desc"|"DocInfoRecdIsMarkedForDeletion"|"DocInfoRecdIsMarkedForDeletion desc")[];

public type A_DocumentInfoRecordAttchSelectOptions ("DocumentInfoRecordDocType"|"DocumentInfoRecordDocNumber"|"DocumentInfoRecordDocVersion"|"DocumentInfoRecordDocPart"|"DocumentInfoRecord"|"DocumentDescription"|"ExternalDocumentStatus"|"DocumentStatusName"|"DocInfoRecdIsMarkedForDeletion"|"DocumentInfoRecordToAttachmentNavigation")[];

public type A_DocumentInfoRecordAttch_DocumentInfoRecordToAttachmentNavigation record {
    AttachmentContent[] results?;
};

public type AttachmentHarmonizedOperation_1 record {
    AttachmentHarmonizedOperation d?;
};

public type A_DocumentInfoRecordAttchExpandOptions ("DocumentInfoRecordToAttachmentNavigation")[];

public type A_DocumentInfoRecordAttch record {
    # Document Type
    @constraint:String {maxLength: 3}
    string DocumentInfoRecordDocType?;
    # Document number
    @constraint:String {maxLength: 25}
    string DocumentInfoRecordDocNumber?;
    # Document Version
    @constraint:String {maxLength: 2}
    string DocumentInfoRecordDocVersion?;
    # Document Part
    @constraint:String {maxLength: 3}
    string DocumentInfoRecordDocPart?;
    # Document Info Record key in concatenated form
    string? DocumentInfoRecord?;
    # Document Description
    string? DocumentDescription?;
    # Status of a document (language-dependent)
    string? ExternalDocumentStatus?;
    # Description of document status
    string? DocumentStatusName?;
    # Deletion Indicator
    boolean? DocInfoRecdIsMarkedForDeletion?;
    A_DocumentInfoRecordAttch_DocumentInfoRecordToAttachmentNavigation DocumentInfoRecordToAttachmentNavigation?;
};
