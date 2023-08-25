package cl.Main.Soecsa.Ltda.controller;

import cl.Main.Soecsa.Ltda.service.AdminService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@Controller
public class AdminController {
	@Autowired
    private AdminService adminService;

    
    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }
    

    
  

}
