# Flask_API

![test2 (5)](https://user-images.githubusercontent.com/82989538/124403323-9f6b4f00-dcea-11eb-85d6-83b0ec464331.png)


The Flask API consists of three endpoints:

GET '/': This a simple health check which returns the response of 'Healthy' <br />
POST '/auth': This takes an email and a password as a JSON payload and returns a JWT based on a custom secret <br />
GET '/contents': This requires a valid JWT, and returns the un-encrypted contents of that token. 
