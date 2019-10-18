package vn.edu.vinaenter.controller;

import java.util.Comparator;
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
import vn.edu.vinaenter.model.bean.Category;
import vn.edu.vinaenter.model.bean.Contact;
import vn.edu.vinaenter.model.bean.Land;
import vn.edu.vinaenter.model.bean.Slide;
import vn.edu.vinaenter.model.dao.CategoryDao;
import vn.edu.vinaenter.model.dao.ContactDao;
import vn.edu.vinaenter.model.dao.LandDao;
import vn.edu.vinaenter.model.dao.SlideDao;

@Controller
@RequestMapping("")
public class PublicIndexController {

	@Autowired
	private LandDao landDao;

	@Autowired
	private CategoryDao catDao;
	
	@Autowired
	private ContactDao contactDao;
	
	@Autowired
	private SlideDao slideDao;

	@ModelAttribute
	public void commonObject(ModelMap modelMap) {
		List<Category> listCat = catDao.getItems();
		List<Land> listCountViews = landDao.getItemCountViews();
		List<Category> listCatSort = catDao.getItems();
		for (Category category : listCatSort) {
			category.setTotal(landDao.totalLanByCid(category.getCid()));
		}
		listCatSort.sort(new Comparator<Category>() {
			@Override
			public int compare(Category o1, Category o2) {
				if(o1.getTotal() == o2.getTotal()){
		            return 0;
		        }
		        return o1.getTotal() > o2.getTotal() ? -1 : 1;
			}
			
		});
		modelMap.addAttribute("listCatSort", listCatSort);
		modelMap.addAttribute("listCountViews", listCountViews);
		modelMap.addAttribute("landDao", landDao);
		modelMap.addAttribute("listCat", listCat);
	}

	@GetMapping({ "{name}/{page}.html", "{name}.html" })
	public String index(ModelMap modelMap, @PathVariable(name = "page", required = false) Integer currentPage) {
		if (currentPage == null) {
			currentPage = 1;
		}
		int totalLand = landDao.totalLand();
		int numberOfPage = (int) Math.ceil((double)totalLand / Defines.ROW_COUNT);
		if (currentPage > numberOfPage) {
			currentPage = numberOfPage;
		}
		if (currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * Defines.ROW_COUNT;
		List<Land> listLand = landDao.getItems(offset, Defines.ROW_COUNT);
		List<Slide> listSlide = slideDao.getItem();
		modelMap.addAttribute("listSlide", listSlide);
		modelMap.addAttribute("numberOfPage", numberOfPage);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("listLand", listLand);
		return "cland.public.index.index";
	}

	@GetMapping({ "{name}/{id}/{page}.html" })
	public String cat(@PathVariable(name = "id", required = false) Integer id,
			@PathVariable(name = "page", required = false) Integer currentPage, ModelMap modelMap) {
		if (currentPage == null) {
			currentPage = 1;
		}
		if (catDao.getItemByCid(id) == null) {
			return "error/404";
		}
		int totalLandByCat = landDao.totalLanByCid(id);
		int numberOfPage = (int) Math.ceil((double)totalLandByCat / Defines.ROW_COUNT);
		if (currentPage > numberOfPage) {
			currentPage = numberOfPage;
		}
		if (currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * Defines.ROW_COUNT;
		List<Land> listLand = landDao.getItemsByCid(id, offset, Defines.ROW_COUNT);
		Category objCat = catDao.getItemByCid(id);
		List<Slide> listSlide = slideDao.getItem();
		modelMap.addAttribute("listSlide", listSlide);
		modelMap.addAttribute("numberOfPage", numberOfPage);
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("listLand", listLand);
		modelMap.addAttribute("objCat", objCat);
		modelMap.addAttribute("cid", id);
		return "cland.public.index.cat";
	}

	@GetMapping("{cname}/{cid}/{lname}/{lid}.html")
	public String single(@PathVariable(name="lid", required = false) Integer lid, @PathVariable(name="cid", required = false) Integer cid, ModelMap modelMap) {
		Land objLand = landDao.getItemByLid(lid);
		if (objLand == null) {
			return "error/404";
		}
		List<Land> listLand = landDao.getItemsByCid(cid, lid);
		/*int offset = Math.abs(landDao.nextLand(lid) - 1);
		Land nextLand = landDao.getItem(offset);
		modelMap.addAttribute("nextLand", nextLand);*/
		modelMap.addAttribute("listLand", listLand);
		modelMap.addAttribute("objLand", objLand);
		return "cland.public.index.single";
	}

	@GetMapping("contact.html")
	public String contact() {
		return "cland.public.index.contact";
	}
	
	@PostMapping("contact.html")
	public String contact(@Valid @ModelAttribute("objCon") Contact objCon, BindingResult br, RedirectAttributes ra, ModelMap modelMap) {
		if(br.hasErrors()) {
			modelMap.addAttribute("objCon", objCon);
			return "cland.public.index.contact";
		} 
		if(contactDao.addItem(objCon) > 0) {
			ra.addFlashAttribute("msg", Defines.MSG_ADD_SUCCESS);
			return "redirect:/contact.html";
		} else {
			ra.addFlashAttribute("msg", Defines.MSG_ERROR);
			return "cland.public.index.contact";
		}
	}
	
	@GetMapping("test")
	public String test() {
		return "public/test";
	}
	
	@GetMapping("search.html")
	public String search(@RequestParam("search") String search, ModelMap modelMap) {
		List<Land> listSearch = landDao.getItemsBySearch(search);
		modelMap.addAttribute("search", search);
		modelMap.addAttribute("listSearch", listSearch);
		return "cland.public.index.search";
	}
}
