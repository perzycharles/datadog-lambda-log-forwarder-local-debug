# dd-lambda-forwarder-local-debug

We can use the AWS Serverless Application Model (AWS SAM) to test and debug Datadog Lambda forwarder locally.

## Prerequisites

AWS CLI installed

https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/prerequisites.html 

Docker installed

https://docs.docker.com/desktop/install/mac-install/ 

AWS SAM CLI installed

https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/install-sam-cli.html

## Steps

```bash
git clone https://github.com/perzycharles/datadog-lambda-log-forwarder-local-debug.git
```

Set the correct `DD_API_KEY` and `DD_SITE` of your datadog organization.
https://github.com/perzycharles/datadog-lambda-log-forwarder-local-debug/blob/main/template.yaml#L13-L14

Generate a sample event with the current timestamp
```bash
cd datadog-lambda-log-forwarder-local-debug
chmod +x events/script.sh
./events/script.sh
```

Build the SAM project
```bash
sam build
```

Invoke lambda forwarder with current_event.json
```bash
sam local invoke DatadogLogForwarderFunction  -e events/current_event.json
```
View the logs in Datadog Logs Explorer
