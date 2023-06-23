import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import MinMaxScaler
import openai
import warnings
import requests
import pickle
from flask import Flask, request, jsonify, make_response
import json

warnings.filterwarnings('ignore')
openai.api_key = "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"



app = Flask(__name__)
@app.route('/soil', methods=['POST'])
def process_request():
    #reccive the request data
    data=request.get_json()
    print(data)
    ###################################
    # Accessing individual values
    nitrogen = data['N']
    phosphorous = data['P']
    potassium = data['K']
    ph_value = data['pH']

    modate = np.array([[nitrogen,phosphorous,potassium,ph_value]])
    with open('RFmodel.pkl', 'rb') as file:
        RF = pickle.load(file)
    prediction = RF.predict(modate)
    print('prdiction',prediction[0])

    completion = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "user", "content": f"what kind of plants can be farming in a soil with a nitrogen is {nitrogen}, phosphorous is{phosphorous}, potassium is {potassium}, and ph value is {ph_value}"}
        ]
    )
    result = completion.choices[0].message
    print('result: ',result)  
    ###################################
#     soilmodel(data)
    
#     response_data = {
#         data
#     }

    response_data = {
        'message': f"the quality is :{prediction[0]}",
        'data': result
    }

#     convert data to json
    json_data = jsonify(response_data)
    
    print(type(response_data))
    print(type(json_data))
    
    # Create a response object
    response = make_response(json_data)
    
    # Set the status code
    response.status_code = 200
    
    return response
    

if __name__ == '__main__':
    app.run()