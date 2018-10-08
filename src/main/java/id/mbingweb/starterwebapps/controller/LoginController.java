package id.mbingweb.starterwebapps.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author mohammad.anugrah
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView loginPage(){
        ModelAndView model = new ModelAndView();
        model.setViewName("login");
        return model;
    }
}
