package vn.edu.vinaenter.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.constant.Defines;
import vn.edu.vinaenter.model.bean.Category;
import vn.edu.vinaenter.model.bean.Land;
import vn.edu.vinaenter.model.bean.User;
import vn.edu.vinaenter.model.dao.CategoryDao;
import vn.edu.vinaenter.model.dao.LandDao;
import vn.edu.vinaenter.model.dao.UserDao;
import vn.edu.vinaenter.util.FileUtil;

@Controller
@RequestMapping("admin/land")
public class AdminLandController {

	@Autowired
	private LandDao landDao;

	@Autowired
	private CategoryDao catDao;

	@Autowired
	private ServletContext context;
	
	@Autowired
	private UserDao userDao;
	
	@ModelAttribute
	public void common(ModelMap modelMap, Principal principal) {
		User inforUser = userDao.getItemByUsername(principal.getName());
		modelMap.addAttribute("inforUser", inforUser);
	}

	@GetMapping({"index/{i}", "index", "{cid}/index/{i}"})
	public String index(ModelMap modelMap, @PathVariable(name = "i", required = false) Integer currentPage, @PathVariable(name = "cid", required = false) Integer cid) {
		if(currentPage == null) {
			currentPage = 1;
		}
		if (cid == null) {
			int totalLand = landDao.totalLand();
			int numberOfPage = (int)Math.ceil((double)totalLand / Defines.ROW_COUNT);
			int offset = (currentPage - 1) * Defines.ROW_COUNT;
			List<Land> listLand = landDao.getItems(offset, Defines.ROW_COUNT);
			modelMap.addAttribute("numberOfPage", numberOfPage);
			modelMap.addAttribute("currentPage", currentPage);
			modelMap.addAttribute("listLand", listLand);
			return "cland.admin.land.index";
		} else {
			Category objCat = catDao.getItemByCid(cid);
			int totalLandByCid = landDao.totalLanByCid(cid);
			int numberOfPage = (int)Math.ceil((double)totalLandByCid / Defines.ROW_COUNT);
			int offset = (currentPage - 1) * Defines.ROW_COUNT;
			List<Land> listLand = landDao.getItemsByCid(cid, offset, Defines.ROW_COUNT);
			modelMap.addAttribute("numberOfPage", numberOfPage);
			modelMap.addAttribute("currentPage", currentPage);
			modelMap.addAttribute("listLand", listLand);
			modelMap.addAttribute("objCat", objCat);
			return "cland.admin.land.index";
		}
		
	}

	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<Category> listCat = catDao.getItems();
		modelMap.addAttribute("listCat", listCat);
		return "cland.admin.land.add";
	}

	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objland") Land objLand, BindingResult br, @RequestParam("avatar") CommonsMultipartFile cmf,
			RedirectAttributes ra) {
		if (br.hasErrors()) {
			return "cland.admin.land.add";
		}
		String filename = FileUtil.rename(cmf.getOriginalFilename());
		objLand.setPicture(filename);
		if (!"".equals(filename)) {
			String dirPath = context.getRealPath("") + Defines.DIR_UPLOAD;
			File dir = new File(dirPath);
			if (dir.exists()) {
				dir.mkdirs();
			}
			String filePath = dirPath + File.separator + filename;
			try {
				cmf.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "redirect:/admin/land/add";
			}
		}
		if (landDao.addItem(objLand) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
			return "redirect:/admin/land/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/land/add";
		}
	}

	@GetMapping("edit/{id}/{page}")
	public String edit(@PathVariable("id") int lid, ModelMap modelMap, @PathVariable(name="page", required=false) Integer page, RedirectAttributes ra) {
		Land objLand = landDao.getItemByLid(lid);
		if (objLand == null) {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
			return "redirect:/admin/land/index/1";
		}
		try {
			if(page == null) {
				page = 1;
			}
		} catch (NumberFormatException e) {
			page = 1;
		}
		List<Category> listCat = catDao.getItems();
		modelMap.addAttribute("listCat", listCat);
		modelMap.addAttribute("objLand", objLand);
		return "cland.admin.land.edit";
	}

	@PostMapping("edit/{lid}/{page}")
	public String edit(@PathVariable("lid") int lid, @Valid @ModelAttribute("objLand") Land objLand, BindingResult br, @PathVariable(name="page", required=false) Integer page,  @RequestParam("avatar") CommonsMultipartFile cmf,
			RedirectAttributes ra) {
		if (br.hasErrors()) {
			return "cland.admin.land.edit";
		}
		String fileName = FileUtil.rename(cmf.getOriginalFilename());
		if (!"".equals(fileName)) {
			objLand.setPicture(fileName);
			String dirPath = context.getRealPath("") + Defines.DIR_UPLOAD;
			File dir = new File(dirPath);
			if (dir.exists()) {
				dir.mkdirs();
			}
			String filePath = dirPath + File.separator + fileName;
			try {
				cmf.transferTo(new File(filePath));
			} catch (IllegalStateException | IOException e) {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "redirect:/admin/land/index";
			}
		} else {
			Land oldLand = landDao.getItemByLid(lid);
			objLand.setPicture(oldLand.getPicture());
		}
		try {
			if (landDao.editItem(objLand) > 0) {
				ra.addFlashAttribute("msg", Defines.MSG_UPDATE_SUCCESS);
				return "redirect:/admin/land/index/" + page;
			} else {
				ra.addFlashAttribute("msg", Defines.MSG_ERROR);
				return "cland.admin.land.edit";
			}
		} catch (Exception e) {
			return "cland.admin.land.edit";
		}
	}
	
	@GetMapping("delete/{lid}")
	public String delete(@PathVariable("lid") int lid, RedirectAttributes ra) {
		Land objLand = landDao.getItemByLid(lid);
		if (objLand == null) {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR_ID);
			return "redirect:/admin/land/index/1";
		}
		if (landDao.deleteItem(lid) > 0) {
			String dirPath = context.getRealPath("") + Defines.DIR_UPLOAD;
			String fileName = objLand.getPicture();
			String filePath = dirPath + File.separator + fileName;
			File file = new File(filePath);
			file.delete();
			ra.addFlashAttribute("msg", Defines.MSG_DELETE_SUCCESS);
			return "redirect:/admin/land/index";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "redirect:/admin/land/index";
		}
	}
	
	@GetMapping("search")
	public String search(@RequestParam("search") String search,ModelMap modelMap) {
		List<Land> listSearch = landDao.getItemsBySearch(search);
		modelMap.addAttribute("listSearch", listSearch);
		modelMap.addAttribute("search", search);
		return "cland.admin.land.search";
	}

}
