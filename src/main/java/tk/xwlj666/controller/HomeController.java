package tk.xwlj666.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import tk.xwlj666.pojo.User;
import tk.xwlj666.service.UserService;
import tk.xwlj666.util.IPutil;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Created by 123 on 2016/1/16.
 */
@Controller
@RequestMapping("/home")
public class HomeController {
    @Inject
    private UserService userService;
    private IPutil iPutil;

    @Autowired
    private HttpSession session;
    @Autowired
    private HttpServletRequest request;

    @RequestMapping(method = RequestMethod.GET)
    public String ind() {
        return "index";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String login(Model model, String username, String password) {
        System.out.println(111);
        if (username != null &&username!=""&&password!=""&& password != null) {
            User user = userService.findByUsername(username);
            if (password.equals(user.getPassword())) {
                //System.out.println(iPutil.getRemortIP(request));
               //user.setLastip(iPutil.getRemortIP(request));
                user.setLastip("127.0.0.1");
               user.setLasttime("\""+new Date().getTime()+"\"");

                userService.update(user);
                HttpSession session= request.getSession();
                session.setAttribute("currUser",user);
                return "index";
            }
        } else {
            model.addAttribute("code", "1000");
        }
        return "index";
    }

    @RequestMapping(value = "manage")
    public String manage() {
        return "users";
    }

    @RequestMapping(value = "edit")
    public String edit() {
        return "users-setting";
    }

    @RequestMapping(value = "new-project")
    public String project() {
        return "new-project";
    }

   @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(){
       return "redirect:/users-setting/";
   }
}
