codeunit 70102 "Send Email With Attachment"
{
    procedure SendEmailWithAttachment()
    var
        Email: codeunit Email;
        EmailMsg: Codeunit "Email Message";
        Inputstr: InStream;
        FileName: Text;
        EmailBody: Label 'Dear <b>%1</b>,<br><p> Please find attached the document below</p><hr>';
    begin
        EmailMsg.Create('michaelecibu@gmail.com', 'Sending an Email in AL', '', true);
        // EmailMsg.Create(Recepient/s, Subject, Body, htmlformat, cc, bcc);
        EmailMsg.AppendToBody(StrSubstNo(EmailBody, UserId));

        if UploadIntoStream('Select the file', '', 'This Files|*.jpg;*.pdf;*.docx;*.xlsx;*.png', FileName, Inputstr) then
            EmailMsg.AddAttachment(FileName, '', Inputstr)
        else
            Error('Failed try again %1', GetLastErrorText());
        if Email.Send(EmailMsg) then
            Message('The Email was sent successfully')
        else
            Error('Failed try again %1', GetLastErrorText());

    end;
}
