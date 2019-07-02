package main

import (
	"github.com/gin-gonic/gin"
	C "github.com/haijiao1945/md5url/controllers"
)

func setupRouter() *gin.Engine {
	r := gin.Default()
	r.GET("/create/", C.Create)
	r.GET("/goto/", C.Goto)
	r.GET("/share/", C.Share)
	r.GET("/360转区", C.Zhuanqu)
	r.GET("/客服", C.Kefu)
	r.GET("/订阅", C.Dingyue)
	r.GET("/取消预购", C.Yugou)
	return r
}

func main() {
	r := setupRouter()
	r.Run(":8900")
}
