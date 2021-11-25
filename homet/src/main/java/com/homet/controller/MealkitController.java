package com.homet.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.homet.model.Mealkit;
import com.homet.model.Orders;
import com.homet.model.SetMenu;
import com.homet.model.User;
import com.homet.service.MealkitService;

import lombok.Builder;

@Controller
@RequestMapping("/mealkit")
public class MealkitController {
	
	@Autowired
	MealkitService service;
	
	//이게 밀키트 메인 페이지
	@RequestMapping(value = {"/","/mealkitHome"})
	public String mealkithome(HttpSession session, @SessionAttribute("cart") List<List<Mealkit>> cart, String idx_list) {
		
		if(idx_list != null) {	// 카트에 담고 mealkitHome 으로 올때 동작
			List<Mealkit> list = new ArrayList<Mealkit>();
			
			StringTokenizer token = new StringTokenizer(idx_list, "/");
			while(token.hasMoreTokens()) {
				Mealkit meal = service.getByIdx(Integer.parseInt(token.nextToken()));
				list.add(meal);
			}
			cart.add(list);
			session.setAttribute("cart", cart);
		}
		
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

	/*
	 * @RequestMapping(value = "/mealkit", params = "idx_list") public String
	 * makeKit2(Model model, @RequestParam String idx_list, HttpServletRequest
	 * request) {
	 * 
	 * HttpSession session = request.getSession();
	 * 
	 * //list에 list를 담음 List<List<Mealkit>> cart = new ArrayList<List<Mealkit>>();
	 * 
	 * List<Mealkit> list = new ArrayList<Mealkit>();
	 * 
	 * StringTokenizer token = new StringTokenizer(idx_list, "/");
	 * while(token.hasMoreTokens()) { Mealkit meal =
	 * service.getByIdx(Integer.parseInt(token.nextToken())); list.add(meal); }
	 * cart.add(list); session.setAttribute("cart", cart);
	 * 
	 * 
	 * model.addAttribute("meatList",service.getByCategory("meat"));
	 * model.addAttribute("saladList",service.getByCategory("salad"));
	 * model.addAttribute("toppingList",service.getByCategory("topping"));
	 * model.addAttribute("sauceList",service.getByCategory("sauce")); return
	 * "kit/mealkit"; }
	 */
	
	//장바구니로 그냥 가기
	@RequestMapping(value = "/cart")
	public String cart() {
		
		return "kit/cart";
	}
	
	// 장바구니에 담고 장바구니로 이동
	@RequestMapping(value = "/cart", params = "idx_list")
	public String cart2(@RequestParam String idx_list, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		//list에 list를 담음			// 세션에서 장바구니 불러옴
		if(idx_list != null) {
			List<List<Mealkit>> cart = (List<List<Mealkit>>) session.getAttribute("cart");
			
			List<Mealkit> list = new ArrayList<Mealkit>();
			
			StringTokenizer token = new StringTokenizer(idx_list, "/");
			while(token.hasMoreTokens()) {
				Mealkit meal = service.getByIdx(Integer.parseInt(token.nextToken()));
				list.add(meal);	//재료정보를 누적해서 밀키트에 담음
			}
			cart.add(list);		//장바구니에 밀키트 하나 추가!
			session.setAttribute("cart", cart);
		}
		System.out.println(idx_list);
		return "kit/cart";
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
	
	//주문하기
	@RequestMapping(value="/order")
	public String order(Model model, HttpServletRequest request, String type) {
		HttpSession session = request.getSession();		//로그인 한 id의 것만 보여주려고
		User user = (User)session.getAttribute("user");	//세션에서 user 정보 가져오기
		
		if(type != null && type.equals("1")) {
			List<List<Mealkit>> cart = (List<List<Mealkit>>)session.getAttribute("cart");//세션에서 cart 정보 가져오기
			List<String> idx_lists = new ArrayList<String>();
			
			for(List<Mealkit> list : cart) {
				String idx_list = "";
				for(Mealkit vo : list) {
					idx_list += "/" + vo.getMidx();
				}
				idx_lists.add(idx_list);
			}
			// 인서트 하는곳
			for(String x : idx_lists) {	
				Orders order = Orders.builder().nickname(user.getNickname()).order_list(x).build();
				service.insertOrder(order); //밀키트 하나씩 insert
			}
			
		}
		
		List<Orders> orderList = service.getOrdersByNickname(user.getNickname());
		model.addAttribute("orderList",orderList);
		System.out.println(orderList);
		return "kit/purchase";
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
