

# Notes:
# https://aws.amazon.com/premiumsupport/knowledge-center/s3-multipart-upload-cli/
# https://docs.aws.amazon.com/cli/latest/reference/s3api/create-multipart-upload.html
# https://docs.aws.amazon.com/cli/latest/reference/s3api/upload-part.html
# https://docs.aws.amazon.com/cli/latest/reference/s3api/complete-multipart-upload.html0
# 


//Get a large file: 

curl -o bigpic.jpg http://www.effigis.com/wp-content/uploads/2015/02/Airbus_Pleiades_50cm_8bit_RGB_Yogyakarta.jpg



bucket name: 
aws s3 mb s3://3456testmpb


split -b 10m bigpic.jpg part-

md5 bigpic.jpg 

echo 06cb38d17f68a7dc5db6b2d8c4122b03 | base64





aws s3api create-multipart-upload --bucket 3456testmpb --key 'multipart/bigpic.jpg'

{
    "Bucket": "3456testmpb", 
    "UploadId": "22Jsr1b4jfQXMAq210Y3Jns20NO3kUWD1n41xCgyN8NFtmSfF3cByt9XxY5PNirAecjlKpPQsYZbyfOacg758NuXtfFZ5FXeoft0CE0SQiuO64r9P.Noopv5vPHP96Gu", 
    "Key": "multipart/bigpic.jpg"
}



UploadId:
.xDj532soQMOGxMw7l7661xtoIygrICTLpsOzJrogS1NuJ1NxeltJohY9gTKHWxo4idL.krd6zShe4p3JRoO2D5k935GZfZTV3oR3_gBGHtNFldPAgle98mEFjWtJGzpvsYN7bdE8a_QYT4H0qmCYO_mk3RVEPbHKuztuKNUzwg-




aws s3api upload-part --bucket 3456testmpb --key 'multipart/bigpic.jpg' --part-number 1 --body part-aa --upload-id  "22Jsr1b4jfQXMAq210Y3Jns20NO3kUWD1n41xCgyN8NFtmSfF3cByt9XxY5PNirAecjlKpPQsYZbyfOacg758NuXtfFZ5FXeoft0CE0SQiuO64r9P.Noopv5vPHP96Gu"
aws s3api upload-part --bucket 3456testmpb --key 'multipart/bigpic.jpg' --part-number 2 --body part-ab --upload-id  "22Jsr1b4jfQXMAq210Y3Jns20NO3kUWD1n41xCgyN8NFtmSfF3cByt9XxY5PNirAecjlKpPQsYZbyfOacg758NuXtfFZ5FXeoft0CE0SQiuO64r9P.Noopv5vPHP96Gu"
aws s3api upload-part --bucket 3456testmpb --key 'multipart/bigpic.jpg' --part-number 3 --body part-ac --upload-id  "22Jsr1b4jfQXMAq210Y3Jns20NO3kUWD1n41xCgyN8NFtmSfF3cByt9XxY5PNirAecjlKpPQsYZbyfOacg758NuXtfFZ5FXeoft0CE0SQiuO64r9P.Noopv5vPHP96Gu"
aws s3api upload-part --bucket 3456testmpb --key 'multipart/bigpic.jpg' --part-number 4 --body part-ad --upload-id  "22Jsr1b4jfQXMAq210Y3Jns20NO3kUWD1n41xCgyN8NFtmSfF3cByt9XxY5PNirAecjlKpPQsYZbyfOacg758NuXtfFZ5FXeoft0CE0SQiuO64r9P.Noopv5vPHP96Gu"



//Create file: allparts.txt

{
    "Parts":
[
{
    "PartNumber": 1,
    "ETag": "e3e0ee379d288b30d835029c51c2bbf1"
},
{
    "PartNumber": 2,
    "ETag": "7b88de91139293799e34da0f668c0c10"
},
{
    "PartNumber": 3,
    "ETag": "f7a1979b30fa062794fc5620bed643cd"
},
{
    "PartNumber": 4,
    "ETag": "51dd25ac7b2a8c995a55b2d4fb03429a"
}
]
}


aws s3api complete-multipart-upload --multipart-upload file://allparts.txt --bucket 3456testmpb --key 'multipart/bigpic.jpg' --upload-id "22Jsr1b4jfQXMAq210Y3Jns20NO3kUWD1n41xCgyN8NFtmSfF3cByt9XxY5PNirAecjlKpPQsYZbyfOacg758NuXtfFZ5FXeoft0CE0SQiuO64r9P.Noopv5vPHP96Gu"



//Output

{
    "ETag": "\"a99ca485cfdce74dd1dc3ba695f323fa-4\"", 
    "Bucket": "345testmpb", 
    "Location": "https://345testmpb.s3.us-west-2.amazonaws.com/multipart%2Fbigpic.pic", 
    "Key": "multipart/bigpic.pic"
}


