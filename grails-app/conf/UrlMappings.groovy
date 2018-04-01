import book.Book

class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		//"/"(action: "index", controller: "book")
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
