from flask import Flask,request,jsonify
from twilio.rest import Client

app = Flask(__name__)

@app.route("/api", methods=['POST', 'GET'])
def msg():
    if request.method == 'POST':
        content = request.get_json()
        account_sid = '<account_sid>'  
        auth_token = '<auth_token>'
        client = Client(account_sid, auth_token)
        sms = "This is a test sms to " + content['name'] + "\nMobile Number: " + content['num']
        message = client.messages \
        .create(
             body=sms,
             from_='+12057724797',
             to=content['num']
         )
        print(content)
        return "success"



if __name__=="__main__":
    app.run(host='0.0.0.0',port ='5000',debug=True)
