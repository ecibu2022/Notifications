pageextension 70100 VendorExt extends "Vendor List"
{
    // Checks if Vendor list is open
    // It does not block the user from what they are doing
    trigger OnOpenPage()
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalNotification: Notification;
    begin
        ApprovalEntry.Reset();
        // Checks if they have an approval 
        ApprovalEntry.SetRange("Approver ID", UserId);
        ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);

        if not ApprovalEntry.IsEmpty() then begin
            ApprovalNotification.SetData('time', Format(Time));

            ApprovalNotification.AddAction('Open Requests To Approve', Codeunit::NotifcationCodeUnit, 'SendNotification');
            ApprovalNotification.Message(UserId+' you have open entries to approve');
            ApprovalNotification.Send();
        end;
    end;
}
