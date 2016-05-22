import vibe.d;
import web: WebService;

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "0.0.0.0"];

	auto webSettings = new WebInterfaceSettings();
	webSettings.urlPrefix = "/";

	auto router = new URLRouter;
	//router.registerWebInterface(new WebService(), webSettings);
	router.any("/assets/*", serveStaticFiles("public/assets/"));
	router.any("/", serveStaticFile("public/index.html"));

	listenHTTP(settings, router);
}

