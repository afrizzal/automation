import json
import boto3

def lambda_handler(event, context):
    
    s3 = boto3.client('s3')
    
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    
    s3.download_file(bucket, key, '/tmp/test.txt')
    
    with open('/tmp/test.txt', 'r') as file:
        file_contents = file.read()
    
    print(file_contents)
    
    s3.upload_file('/tmp/test.txt', bucket, 'new_key')
    
    response = {
        "statusCode": 200,
        "body": json.dumps("Sucessfullll!")
    }
    
    return response
