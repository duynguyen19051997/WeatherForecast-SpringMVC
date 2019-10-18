package vn.edu.vinaenter.controller;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import vn.edu.vinaenter.model.bean.Role;
import vn.edu.vinaenter.model.bean.User;
import vn.edu.vinaenter.model.dao.RoleDao;
import vn.edu.vinaenter.model.dao.UserDao;

@Controller
@RequestMapping("admin/user")
public class AdminUserController {
	@Autowired
	private UserDao userDao;

	@Autowired
	private RoleDao roleDao;

	@Autowired
	BCryptPasswordEncoder encoder;

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
		int totalUser = userDao.totalUser();
		int numberOfPage = (int) Math.ceil((double) totalUser / Defines.ROW_COUNT);
		if (currentPage > numberOfPage) {
			currentPage = numberOfPage;
		}
		int offset = (currentPage - 1) * Defines.ROW_COUNT;
		List<User> listUser = userDao.getItems(offset, Defines.ROW_COUNT);
		modelMap.addAttribute("numberOfPage", numberOfPage);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("listUser", listUser);
		return "cland.admin.user.index";
	}

	@GetMapping("profile")
	public String profile(Principal principal, ModelMap modelMap) {
		String username = principal.getName();
		User inforUser = userDao.getItemByUsername(username);
		modelMap.addAttribute("inforUser", inforUser);
		return "cland.admin.user.profile";
	}

	@GetMapping({ "edit/{id}" })
	public String edit(ModelMap modelMap, @PathVariable(name = "id", required = false) Integer id,
			RedirectAttributes ra, Principal principal) {
		User inforUser = userDao.getItemByUsername(principal.getName());
		if (inforUser.getId() == 5) {
			User objUser = userDao.getItemById(id);
			if (objUser != null) {
				List<Role> listRole = roleDao.getItems();
				modelMap.addAttribute("listRole", listRole);
				modelMap.addAttribute("objUser", objUser);
				return "cland.admin.user.edit";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
				return "redirect:/admin/user/index/1";
			}
		} else {
			if (inforUser.getId() == id) {
				User objUser = userDao.getItemById(id);
				if (objUser != null) {
					List<Role> listRole = roleDao.getItems();
					modelMap.addAttribute("listRole", listRole);
					modelMap.addAttribute("objUser", objUser);
					return "cland.admin.user.edit";
				} else {
					ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
					return "redirect:/admin/user/index/1";
				}
			} else {
				return "error/403";
			}
		}

	}

	@PostMapping("edit/{id}")
	public String edit(@PathVariable(name = "id", required = false) Integer id, RedirectAttributes ra,
			@Valid @ModelAttribute("objUser") User objUser, BindingResult br) {
		if (userDao.getItemById(id) == null) {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
			return "redirect:/admin/user/index/1";
		}
		if (br.hasErrors()) {
			return "cland.admin.user.edit";
		}
		try {
			String password = objUser.getPassword();
			objUser.setPassword(encoder.encode(password));
			objUser.setId(id);
			try {
				if (objUser.getEnable() != 0) {
					objUser.setEnable(1);
				}
			} catch (NumberFormatException e) {
				objUser.setEnable(1);
			}
			if (userDao.editItem(objUser) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
				return "redirect:/admin/user/index/1";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "cland.admin.user.edit";
			}
		} catch (Exception e) {
			return "cland.admin.user.edit";
		}
	}

	@GetMapping("add")
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("listRole", roleDao.getItems());
		return "cland.admin.user.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objUser") User objUser, BindingResult br, RedirectAttributes ra,
			ModelMap modelMap) {
		if (br.hasErrors()) {
			return "cland.admin.user.add";
		}
		if (userDao.getItemByUsername(objUser.getUsername()) == null) {
			String password = objUser.getPassword();
			objUser.setPassword(encoder.encode(password));
			try {
				if (objUser.getEnable() != 0) {
					objUser.setEnable(1);
				} else {
					objUser.setEnable(0);
				}
			} catch (NumberFormatException e) {
				objUser.setEnable(1);
			}
			if (userDao.addItem(objUser) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
				return "redirect:/admin/user/index/1";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "cland.admin.user.add";
			}
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_USERNAME);
			return "redirect:/admin/user/add";
		}
	}

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Integer id, ModelMap modelMap, RedirectAttributes ra,
			Principal principal) {
		User inforUser = userDao.getItemByUsername(principal.getName());
		if (inforUser.getId() == 5) {
			if (id != 5) {
				User objUser = userDao.getItemById(id);
				if (objUser != null) {
					if (userDao.delete(id) > 0) {
						ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
						return "redirect:/admin/user/index/1";
					} else {
						ra.addFlashAttribute("msg", Defines.MSG_ERROR);
						return "redirect:/admin/user/index/1";
					}
				} else {
					ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
					return "redirect:/admin/user/index/1";
				}
			} else {
				return "error/403";
			}
		} else {
			return "error/403";
		}
		
	}

	@GetMapping("search")
	public String search(@RequestParam("search") String search, ModelMap modelMap) {
		List<User> listUser = userDao.getItemBySearch(search);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("listUser", listUser);
		return "cland.admin.user.search";
	}
}
