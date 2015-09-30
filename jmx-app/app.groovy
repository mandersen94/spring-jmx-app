
@Controller
class ThisWillActuallyRun {

    @RequestMapping("/")
	@ResponseBody
    String home(javax.servlet.http.HttpServletRequest request) {
        "debug page." + request.getMethod()
    }

    @RequestMapping("/status.do")
    String status() {
        return "Status Repsonse."
    }
}
