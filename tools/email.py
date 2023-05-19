import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

sender_email = ""
receiver_email = ""
password = ""
body = """\
hey how's it going
"""

message = MIMEMultipart()
message["From"] = sender_email
message["To"] = receiver_email
message["Subject"] = "test"
message["Bcc"] = ""
message.attach(MIMEText(body, "plain"))

text = message.as_string()
server = smtplib.SMTP(host="smtp.gmail.com", port=587)
server.starttls()
server.login(sender_email, password)
server.sendmail(sender_email, receiver_email, text)
server.quit()
