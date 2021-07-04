package main

import (
	"fmt"
	"log"
	"net/url"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/minio/minio-go"
)

func check(err error) {
	if err != nil {
		panic(err)
	}
}

var endpoint = "server:9000"
var accessKeyID = "username"
var secretAccessKey = "password"
var useSSL = false
var bucketName = "furniture"
var minioClient *minio.Client

func uploadFile(ctx *gin.Context) {
	file, fileHeader, err := ctx.Request.FormFile("file")
	fmt.Print("收到文件名为:")
	fmt.Println(fileHeader.Filename)
	check(err)
	defer file.Close()
	// 上传一个zip文件。
	objectName := fileHeader.Filename
	contentType := "application/octet-stream"
	// 使用FPutObject上传一个文件。
	n, err := minioClient.PutObject(bucketName, objectName, file, fileHeader.Size, minio.PutObjectOptions{ContentType: contentType})
	check(err)
	log.Printf("Successfully uploaded %s of size %d\n", objectName, n)
}

func getFileList(ctx *gin.Context) {
	fileUrls := make([]string, 0, 100)
	// Create a done channel to control 'ListObjectsV2' go routine.
	doneCh := make(chan struct{})
	// Indicate to our routine to exit cleanly upon return.
	defer close(doneCh)
	// Set request parameters for content-disposition.
	reqParams := make(url.Values)
	//reqParams.Set("response-content-disposition", "attachment; filename=\"your-filename.txt\"")
	isRecursive := true
	objectCh := minioClient.ListObjectsV2(bucketName, "", isRecursive, doneCh)
	for object := range objectCh {
		if object.Err != nil {
			fmt.Println(object.Err)
			return
		}
		url, err := minioClient.PresignedGetObject(bucketName, object.Key, time.Second*24*60*60, reqParams)
		check(err)
		fileUrls = append(fileUrls, url.String())
	}
	ctx.JSON(200, fileUrls)
}

func main() {
	var e error
	minioClient, e = minio.New(endpoint, accessKeyID, secretAccessKey, useSSL)
	check(e)
	// 创建一个存储桶。
	location := "us-east-1"
	// 检查存储桶是否已经存在。
	exists, err := minioClient.BucketExists(bucketName)
	if err == nil && exists {
		log.Printf("We already own %s\n", bucketName)
	} else {
		err = minioClient.MakeBucket(bucketName, location)
		check(err)
		log.Printf("Successfully created %s\n", bucketName)
	}
	r := gin.Default()
	r.POST("/upload", uploadFile)
	r.GET("/filelist", getFileList)
	r.Run(":9999")
}
