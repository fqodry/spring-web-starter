package id.mbingweb.starterwebapps.controller;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/hello")
public class HelloController {
    private static String FILE = "d:/springProj/_export/helloWorld2.pdf";
    private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
            Font.BOLD);
    private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.NORMAL, BaseColor.RED);
    private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
            Font.BOLD);
    private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.BOLD);
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String printWelcome(ModelMap model){
        model.addAttribute("message", "Spring 4 MVC Hello World");
        return "hello";
    }
    
    @RequestMapping(value = "/{name:.+}", method = RequestMethod.GET)
    public ModelAndView hello(@PathVariable("name") String name){
        ModelAndView model = new ModelAndView();
        model.setViewName("hello");
        model.addObject("msg",name);
        return model;
    }
    
    @RequestMapping(value = "/export-pdf", method = RequestMethod.GET)
    public void generatePdf(HttpServletRequest req, HttpServletResponse res){
        res.setContentType("text/html;charset=UTF-8");
        ServletOutputStream outStream = null;
        try{
            outStream = res.getOutputStream();
            res.setContentType("application/pdf");
            res.setHeader("Content-Disposition", "attachment;filename=helloWorld.pdf");
        }catch(Exception e){
            System.out.println(e.getMessage());
        }finally{
            try{
                outStream.flush();
                outStream.close();
            }catch(Exception ex){
                System.out.println("outStream: "+ex.getMessage());
            }
        }
    }
}
