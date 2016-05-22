module web;
import vibe.web.common: path;

class WebService {
	
	@path("/")
	void getIndex() {
		import vibe.http.fileserver;
		serveStaticFile("public/index.html");
	}
}
