codeunit 70101 NotifcationCodeUnit
{
    procedure SendNotification(ApprovalNotification: Notification)
    begin
        // Opens a page for requests to approve
        Page.Run(Page::"Requests to Approve");
    end;
}
