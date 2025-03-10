pageextension 69987 "MPA Email Attachments Ext" extends "Email Attachments"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast(Processing)
        {
            action(ViewFile)
            {
                ApplicationArea = All;
                Caption = 'View File';
                Image = View;

                trigger OnAction()
                var
                    TenantMedia: Record "Tenant Media";
                    FileInStream: InStream;
                begin
                    TenantMedia.SetAutoCalcFields(Content);
                    TenantMedia.Get(Rec.Data.MediaId());

                    TenantMedia.Content.CreateInStream(FileInStream);
                    File.ViewFromStream(FileInStream, Rec."Attachment Name", true);
                end;
            }
        }
    }

}