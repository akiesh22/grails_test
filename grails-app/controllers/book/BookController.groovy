package book

import grails.converters.JSON

class BookController {

    def index() {
        def obj  = Book.list() as JSON
        render obj
    }

    def save() {
        def book = new Book(params)
        book.save(flush: true, failOnError: true)
        def obj  = Book.list() as JSON
        render obj
        }

    }
