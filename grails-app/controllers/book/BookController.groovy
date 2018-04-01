package book

import grails.converters.JSON

class BookController {

    def index() {
        print request.isPost()
        print request.isGet()
        print request.isXhr()

        def obj  = Book.list() as JSON
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
