package vn.edu.vinaenter.controller;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.constant.Defines;
import vn.edu.vinaenter.model.bean.Contact;
import vn.edu.vinaenter.model.bean.User;
import vn.edu.vinaenter.model.dao.ContactDao;
import vn.edu.vinaenter.model.dao.UserDao;

@Controller
@RequestMapping("admin/contact")
public class AdminContactController {
	@Autowired
	private ContactDao contactDao;
	
	@Autowired
	private UserDao userDao;
	
	@ModelAttribute
	public void common(ModelMap modelMap, Principal principal) {
		User inforUser = userDao.getItemByUsername(principal.getName());
		modelMap.addAttribute("inforUser", inforUser);
	}

	@GetMapping({ "index/{i}", "index" })
	public String index(ModelMap modelMap, @PathVariable(name = "i", required = false) Integer currentPage) {
		if (currentPage == null) {
			currentPage = 1;
		}
		int totalContact = contactDao.totalContact();
		int numberOfPage = (int)Math.ceil((double)totalContact / Defines.ROW_COUNT);
		if(currentPage > numberOfPage) {
			currentPage = numberOfPage;
		}
		int offset = (currentPage - 1) * Defines.ROW_COUNT;
		List<Contact> listContact = contactDao.getItems(offset, Defines.ROW_COUNT);
		modelMap.addAttribute("numberOfPage", numberOfPage);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("listContact", listContact);
		return "cland.admin.contact.index";
	}

	@GetMapping({"edit/{cid}/{page}", "edit/{cid}"})
	public String edit(ModelMap modelMap, @PathVariable(name = "cid", required = false) Integer cid,
			@PathVariable(name = "page", required = false) Integer page, RedirectAttributes ra) {
		if (page == null) {
			page = 1;
		}
		Contact objCon = contactDao.getItemByCid(cid);
		if (objCon != null) {
			modelMap.addAttribute("objCon", objCon);
			return "cland.admin.contact.edit";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
			return "redirect:/admin/contact/index/1";
		}
	}

	@PostMapping({"edit/{cid}/{page}", "edit/{cid}"})
	public String edit(@PathVariable(name = "cid", required = false) Integer cid,
			@PathVariable(name = "page", required = false) Integer page,
			@Valid @ModelAttribute("objCon") Contact objCon, BindingResult br, ModelMap modelMap,
			RedirectAttributes ra) {
		if (page == null) {
			page = 1;
		}
		if (br.hasErrors()) {
			return "cland.admin.contact.edit";
		}
		try {
			objCon.setCid(cid);
			if (contactDao.editItem(objCon) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
				return "redirect:/admin/contact/index/" + page;
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "cland.admin.contact.edit";
			}
		} catch (Exception e) {
			return "cland.admin.contact.edit";
		}
	}
	
	@GetMapping({"delete/{cid}/{page}", "delete/{cid}"})
	public String delete(@PathVariable(name="cid", required=false) Integer cid, @PathVariable(name="page", required=false) Integer page, RedirectAttributes ra) {
		Contact objCon = contactDao.getItemByCid(cid);
		if (page == null) {
			page = 1;
		}
		if (objCon != null) {
			if (contactDao.deleteItem(cid) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
				return "redirect:/admin/contact/index/" + page;
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "redirect:/admin/contact/index/" + page;
			}
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
			return "redirect:/admin/contact/index/1";
		}
	}
	
	@GetMapping("search")
	public String search(@RequestParam("search") String search, ModelMap modelMap) {
		List<Contact> listContact = contactDao.getItemBySearch(search);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("listContact", listContact);
		return "cland.admin.contact.search";
	}
}
