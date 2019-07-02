package controllers

import (
	"github.com/gin-gonic/gin"
	fileCache "github.com/haijiao1945/fileCache"
)

func db() fileCache.Cache {
	cache := new(fileCache.Cache)
	db := cache.DB()
	db.SetConfig("")
	return db
}

func Create(c *gin.Context) {
	link := c.Query("link")
	db := db()
	key := db.GetKey(link)
	db.Set(key, link)
	c.JSON(200, gin.H{"url": key})
}

func Goto(c *gin.Context) {
	url := c.Query("url")
	db := db()
	link, _ := db.Get(url)
	c.Redirect(302, link)
}

func Zhuanqu(c *gin.Context) {
	c.Redirect(302, "http://go.xboxfan.com/goto?url=fd3e716572730d14c045889c3a79fc92")
}

func Kefu(c *gin.Context) {
	c.Redirect(302, "http://go.xboxfan.com/goto?url=ee550b7f025a9fd6613d3cd513c2a246")
}

func Dingyue(c *gin.Context) {
	c.Redirect(302, "http://go.xboxfan.com/goto?url=aa0254cf4cae61fee4af860852f51a43")
}

func Yugou(c *gin.Context) {
	c.Redirect(302, "http://go.xboxfan.com/goto?url=ffc5249d85d55ca1a85c3dc40ce069a8")
}
