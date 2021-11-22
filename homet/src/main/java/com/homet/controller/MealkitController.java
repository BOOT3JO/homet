package com.homet.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.homet.model.Mealkit;
import com.homet.model.SetMenu;
import com.homet.service.MealkitService;

@Controller
@RequestMapping("/mealkit")
public class MealkitController {
	
	@Autowired
	MealkitService service;
	
	//이게 밀키트 메인 페이지
	@RequestMapping(value = {"/","/mealkitHome"}, method = RequestMethod.GET)
	public String mealkithome() {
		
		return "kit/mealkitHome";
	}
	
	//나만의 밀키트 선택 첫페이지
	@RequestMapping(value = "/mealkit", method = RequestMethod.GET)
	public String makeKit(Model model) {
		model.addAttribute("meatList",service.getByCategory("meat"));
		model.addAttribute("saladList",service.getByCategory("salad"));
		model.addAttribute("toppingList",service.getByCategory("topping"));
		model.addAttribute("sauceList",service.getByCategory("sauce"));
		return "kit/mealkit";
	}

	//추천 세트 모음 페이지
	@RequestMapping(value = "/mealkitset", method = RequestMethod.GET)
	public String mealkitset(Model model) {
		
		List<SetMenu> setList = new ArrayList<SetMenu>();
		setList = service.getSetByCategory("set");
		model.addAttribute("setList",setList);
		
		return "kit/mealkitset";
	}
	
	//1번 추천 세트로 이동
	@RequestMapping(value = "/chooseSet", params = "category=1")
	public String setList1(Model model) {
		
		List<SetMenu> setList = new ArrayList<SetMenu>();
		setList = service.getSetByCategory("bulk");
		model.addAttribute("setList",setList);
		
		return "kit/set1";
	}
	
	
	@RequestMapping(value = "/chooseDetail")
	   public String setDetail1(Model model,@RequestParam String idx_list) {
		System.out.println(idx_list);
	      List<Mealkit> meal_list = new ArrayList<Mealkit>();
	      StringTokenizer token = new StringTokenizer(idx_list, "/");
	      
	      while(token.hasMoreTokens()) {
	    	  Mealkit meal = service.getByIdx(Integer.parseInt(token.nextToken()));
	    	  meal_list.add(meal);
	      }
	      
	      model.addAttribute("meal_list",meal_list);
	      return "kit/set1detail";
	   }
	
	
	
	
	@RequestMapping(value = "/chooseSet", params = "category=2")
	public String setList2() {
		return "kit/set2.html";
	}
	
	@RequestMapping(value = "/chooseSet", params = "category=3")
	public String setList3() {
		return "kit/set3.html";
	}
	
	@RequestMapping(value = "/chooseSet", params = "category=4")
	public String setList4() {
		return "kit/set4.html";
	}
	
	@RequestMapping(value = "/chooseSet", params = "category=5")
	public String setList5() {
		return "kit/set5.html";
	}
	
	
	
	
	
	
	
}
