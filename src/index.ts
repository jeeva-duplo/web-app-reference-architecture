import * as express from 'express';
const fs = require('fs');

export const app = express();
const port = process.env.PORT || 3000;

const db_url = process.env.DB_URL
const db_username = process.env.DB_USERNAME
const db_password = process.env.DB_PASSWORD
const integration_api_key = process.env.INTEGRATION_API_KEY
const sqs_fullname = process.env.SQS_FULLNAME
const aws_region = process.env.AWS_REGION

var fileContents = ''

fs.readFile('/data/foo', 'utf8', (err, data) => {
  if (err) {
    console.error('Error reading file:', err);
    return;
  }
  fileContents = data;
});

app.get('/', (req, res) => {
  // res.send(contents);
  res.writeHead(200, {'Content-Type': 'text/html'}); // Set the Content-Type to HTML
  const multiLineString = `
    <html>
      <head>
        <title>Multi-line String Example</title>
      </head>
      <body>
        <h1>Hello, World!</h1>
        
        <br></br>
        <br></br>

        <p>Here are examples of reading environment variables that came from k8s secrets and the k8s secrets where created from AWS SecretsManager secrets via the k8s secret provider:</p>
        <p>DB URL: ${db_url}</p>
        <p>DB username: ${db_username}</p>
        <p>DB password: ${db_password}</p>

        <br></br>
        <br></br>

        <p>Here are examples of reading environment variables that came from k8s secrets where the value came from GitHub Action Secrets:</p>
        NOTE: if you do not see a value here set a GitHub Action secret key INTEGRATION_API_KEY with a random value
        <p>Integration API Key: ${integration_api_key}</p>

        <br></br>
        <br></br>
        <p>Here are examples of reading from a config map:</p>
        <p>/data/foo: ${fileContents}</p>

        <br></br>
        <br></br>
        <p>SQS details:</p>
        <p>Queue name: ${sqs_fullname}</p>
        <p>Queue region: ${aws_region}</p>
      </body>
    </html>
  `;

  res.end(multiLineString);
});

export const server = app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

