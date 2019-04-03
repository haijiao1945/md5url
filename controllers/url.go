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
