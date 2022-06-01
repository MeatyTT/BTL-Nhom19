package DuAn2.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String index(ModelMap model) {
		return "redirect:dptp";
	}
	
	@ModelAttribute(name = "changeURL")
	public String changeURL() {
		return "dptp";
	}
	
}
