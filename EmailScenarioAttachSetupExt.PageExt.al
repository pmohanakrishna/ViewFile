pageextension 69988 "EmailScenarioAttachSetup Ext" extends "Email Scenario Attach Setup"
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
                    TenantMedia.Get(Rec."Email Attachment".MediaId());

                    TenantMedia.Content.CreateInStream(FileInStream);
                    File.ViewFromStream(FileInStream, Rec."Attachment Name", true);
                end;
            }
        }
    }
}
