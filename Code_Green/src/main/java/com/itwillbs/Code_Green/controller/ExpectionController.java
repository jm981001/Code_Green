package com.itwillbs.Code_Green.controller;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
 


@Controller
public class ExpectionController {
private static Logger LOGGER = LoggerFactory.getLogger(ExpectionController.class);
    
//        LOGGER.warn("========== ERROR 404 PAGE ==========");
    @GetMapping("/error404")
    public String Error404(HttpServletResponse res, Model model) {
        model.addAttribute("code", "ERROR_404");
        return "Error/404";
    }
    
//  LOGGER.warn("========== ERROR 400 PAGE ==========");
@GetMapping("/error400")
public String Error400(HttpServletResponse res, Model model) {
  model.addAttribute("code", "ERROR_500");
  return "Error/400";
}


//        LOGGER.warn("========== ERROR 500 PAGE ==========");
    @GetMapping("/error500")
    public String Error500(HttpServletResponse res, Model model) {
        model.addAttribute("code", "ERROR_500");
        return "Error/500";
    }
}
