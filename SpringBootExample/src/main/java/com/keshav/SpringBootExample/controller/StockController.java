package com.keshav.SpringBootExample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.keshav.SpringBootExample.model.CompareStock;
import com.keshav.SpringBootExample.model.StockExchange;
import com.keshav.SpringBootExample.service.StockExchangeService;

@Controller
public class StockController {
	@Autowired
	StockExchangeService stockExchangeService;
	
	
	  @RequestMapping(value="/loadStock", method=RequestMethod.GET)
	  public String stockLoad(ModelMap model) 
	  { 
		  StockExchange stockExchange =new StockExchange();
	  model.addAttribute("stockExchange", stockExchange); 
	  return "AddStock"; 
	  }
	  
	  @RequestMapping(value="/addStock",method=RequestMethod.POST)
	  public String addStock(StockExchange stockExchange)
	  {
		
		  if(stockExchangeService.insertStockExchange(stockExchange)!=null)
		  {
			  return "redirect:/listStock";
		  }
		  else
			  return "redirect:/loadStock";
	  }
	  @RequestMapping(value="/listStock")
	  public ModelAndView listStock()
	  {
		ModelAndView mv=new ModelAndView();
		mv.addObject("stockList",stockExchangeService.getAllStockExchange());
		mv.setViewName("ListStock");
		  return mv;
	  }
	  @RequestMapping(path="/loadstock",method=RequestMethod.GET)
	  public String loadStock(ModelMap model)
	  {
	CompareStock stock=new CompareStock();
		  model.addAttribute("stockList",stockExchangeService.getAllStockExchange());
		  model.addAttribute("stock",stock);
		  return "compareStock";
	  }
	  @RequestMapping(path="/compareStock",method=RequestMethod.POST)
	  public String compareStock(CompareStock stock)
	  {
		  
		  return "chart";
	  }
	 
}
