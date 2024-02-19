
import os
import json
import boto3
from botocore.exceptions import ClientError

def get_secret(secret_name):
    client = boto3.client('secretsmanager')

    try:
        response = client.get_secret_value(SecretId=secret_name)
    except ClientError as e:
        if e.response['Error']['Code'] == 'ResourceNotFoundException':
            print("The requested secret " + secret_name + " was not found")
        elif e.response['Error']['Code'] == 'InvalidRequestException':
            print("The request was invalid due to:", e)
        elif e.response['Error']['Code'] == 'InvalidParameterException':
            print("The request had invalid params:", e)
        else:
            print("Unexpected error:", e)
        return None
    else:
        if 'SecretString' in response:
            return response['SecretString']
        else:
            return response['SecretBinary']


def handler(event, context):
    secret_value = json.loads(get_secret(os.getenv('DB_SECRET_NAME')))
    
    message = 'Database connection details: Database URL: {} Database Username: {} Database Password: {}'.format(secret_value['DB_URL'], secret_value['DB_USERNAME'], secret_value['DB_PASSWORD'])  
    return { 
        'message' : message
    }
