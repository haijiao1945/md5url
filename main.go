package main

import (
	"github.com/gin-gonic/gin"
	C "github.com/haijiao1945/shorturl/controllers"
)

func setupRouter() *gin.Engine {
	r := gin.Default()
	r.GET("/create/", C.Create)
	r.GET("/goto/", C.Goto)
	return r
}

func main() {
	r := setupRouter()
	r.Run(":8900")
}
