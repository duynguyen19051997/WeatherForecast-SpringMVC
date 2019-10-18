package vn.edu.vinaenter.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.edu.vinaenter.model.bean.User;
import vn.edu.vinaenter.model.dao.CategoryDao;
import vn.edu.vinaenter.model.dao.ContactDao;
import vn.edu.vinaenter.model.dao.LandDao;
import vn.edu.vinaenter.model.dao.SlideDao;
import vn.edu.vinaenter.model.dao.UserDao;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	
	@Autowired
	private CategoryDao catDao;
	
	@Autowired
	private LandDao landDao;
	
	@Autowired
	private ContactDao contactDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private SlideDao slideDao;
	
	@ModelAttribute
	public void common(ModelMap modelMap, Principal principal) {
		User inforUser = userDao.getItemByUsername(principal.getName());
		modelMap.addAttribute("inforUser", inforUser);
	}
	
	@GetMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("totalCat", catDao.totalCat());
		modelMap.addAttribute("totalLand", landDao.totalLand());
		modelMap.addAttribute("totalContact", contactDao.totalContact());
		modelMap.addAttribute("totalSlide", slideDao.totalSlide());
		modelMap.addAttribute("totalUser", userDao.totalUser());
		return "cland.admin.index.index";
	}

}
