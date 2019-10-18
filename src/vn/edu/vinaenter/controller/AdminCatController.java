package vn.edu.vinaenter.controller;

import java.io.File;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
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
import vn.edu.vinaenter.model.bean.Category;
import vn.edu.vinaenter.model.bean.Land;
import vn.edu.vinaenter.model.bean.User;
import vn.edu.vinaenter.model.dao.CategoryDao;
import vn.edu.vinaenter.model.dao.LandDao;
import vn.edu.vinaenter.model.dao.UserDao;

@Controller
@RequestMapping("admin/cat")
public class AdminCatController {
	@Autowired
	private CategoryDao catDao;
	
	@Autowired
	private LandDao landDao;
	
	@Autowired
	private ServletContext context;
	
	@Autowired
	private UserDao userDao;
	
	@ModelAttribute
	public void common(ModelMap modelMap, Principal principal) {
		User inforUser = userDao.getItemByUsername(principal.getName());
		modelMap.addAttribute("inforUser", inforUser);
	}

	@GetMapping({"index", "index/{page}"})
	public String index(ModelMap modelMap, @PathVariable(name="page", required=false) Integer currentPage) {
		try {
			if (currentPage == null) {
				currentPage = 1;
			}
		} catch (NumberFormatException e) {
			currentPage = 1;
		}
		int totalCat = catDao.totalCat();
		int numberOfPage = (int)Math.ceil((double)totalCat / Defines.ROW_COUNT);
		if (currentPage > numberOfPage) {
			currentPage = numberOfPage;
		}
		int offset = (currentPage - 1) * Defines.ROW_COUNT;
		List<Category> listCat = catDao.getItems(offset, Defines.ROW_COUNT);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("numberOfPage", numberOfPage);
		modelMap.addAttribute("listCat", listCat);
		modelMap.addAttribute("landDao", landDao);
		return "cland.admin.cat.index";
	}
	
	@GetMapping("edit/{cid}")
	public String edit(@PathVariable(name="cid", required=false) Integer cid, ModelMap modelMap, RedirectAttributes ra) {
		if (catDao.getItemByCid(cid) != null) {
			Category objCat = catDao.getItemByCid(cid);
			modelMap.addAttribute("objCat", objCat);
			return "cland.admin.cat.edit";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
			return "redirect:/admin/cat/index";
		}
	}

	@PostMapping("edit/{cid}")
	public String edit(@Valid @ModelAttribute("objCat") Category objCat, BindingResult br, @PathVariable(name="cid", required=false) Integer cid, RedirectAttributes ra) {
		if (br.hasErrors()) {
			return "cland.admin.cat.edit";
		}
		try {
			objCat.setCid(cid);
			if (catDao.editItem(objCat) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
				return "redirect:/admin/cat/index";
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "cland.admin.cat.edit";
			}
		} catch (Exception e) {
			return "cland.admin.cat.edit";
		}
	}

	@GetMapping("add")
	public String add() {
		return "cland.admin.cat.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objCat") Category objCat, BindingResult br, RedirectAttributes ra) {
		if(br.hasErrors()) {
			return "cland.admin.cat.add";
		}
		if (catDao.addItem(objCat) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
			return "redirect:/admin/cat/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/cat/add";
		}
	}
	
	@GetMapping("delete/{cid}")
	public String delete(@PathVariable("cid") int cid, RedirectAttributes ra) {
		if (catDao.getItemByCid(cid) == null) {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
			return "redirect:/admin/user/index";
		}
		List<Land> list = landDao.getItemsByCid(cid);
		if(catDao.deleteItem(cid) > 0) {
			if(list.size() > 0) {
				for (Land land : list) {
					String filePath = context.getRealPath("") + Defines.DIR_UPLOAD + File.separator + land.getPicture();
					File file = new File(filePath);
					file.delete();
				}
				if(landDao.deleteByCid(cid) > 0) {
					ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
					return "redirect:/admin/cat/index";
				} else {
					ra.addFlashAttribute("msg", Defines.MSG_ERROR);
					return "redirect:/admin/cat/index";
				}
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
				return "redirect:/admin/cat/index";
			}
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/cat/index";
		}
	}
	
	@GetMapping("search")
	public String search(@RequestParam("search") String search, ModelMap modelMap) {
		List<Category> listSearch = catDao.getItemsBySearch(search);
		modelMap.addAttribute("listSearch", listSearch);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("landDao", landDao);
		return "cland.admin.cat.search";
	}
}
