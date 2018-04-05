package book

import grails.converters.JSON

class BookController {

    def index() {
        def obj  = Book.list() as JSON
        print obj
        if (request.isXhr()){
            render obj
        }else
        {
            render view : "/index", model: [message: "The end"]
        }
    }

    def save() {
        print "+++++++++++"+ request.isGet()
        def book = new Book(params)
        book.save(flush: true, failOnError: true)
        def obj  = Book.list() as JSON
        render obj
        }

    }
