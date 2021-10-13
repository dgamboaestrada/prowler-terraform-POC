import boto3
from botocore.exceptions import ClientError

def lambda_handler(event,context):
  codebuil_client = boto3.client('codebuild')
  try:
    response = codebuil_client.start_build(projectName=event['ProjectName'])
    print(response)
    print("Respond: SUCCESS")
  except Exception as ex:
    print(ex.response['Error']['Message'])

