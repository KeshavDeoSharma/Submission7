package com.keshav.SpringBootExample.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.keshav.SpringBootExample.SendEmail;
import com.keshav.SpringBootExample.model.Otp;
import com.keshav.SpringBootExample.model.Register;
import com.keshav.SpringBootExample.model.UpdatePassword;
import com.keshav.SpringBootExample.service.RegisterServiceImpl;

@Controller
public class RegisterController {

	@Autowired
	RegisterServiceImpl registerService;
	Register reg=new Register();
	Register reg2=new Register();
	String otp;


	@RequestMapping(path="/loadRegister",method=RequestMethod.GET)
	public String loadRegister(ModelMap model)
	{
		Register register=new Register();
		model.addAttribute("register",register);
		return "SignUp";
	}

	@RequestMapping(path="/addRegisterUser",method=RequestMethod.POST)
	public String addRegisteRUser(Register register,Model model)
	{
		register.setUsertype("User");
		model.addAttribute("register", register);
		reg.setMobileNumber(register.getMobileNumber());
		reg.setPassword(register.getPassword());
		reg.setUsertype(register.getUsertype());
		reg.setEmail(register.getEmail());
		reg.setUsername(register.getUsername());
		return "redirect:/loadOtp";
	}

	


	@RequestMapping(path="/addRegisterAdmin",method=RequestMethod.POST)
	public String addRegisterAdmin(Register register,Model model)
	{
		register.setUsertype("Admin");
		model.addAttribute("register", register);
		reg.setMobileNumber(register.getMobileNumber());
		reg.setPassword(register.getPassword());
		reg.setUsertype(register.getUsertype());
		reg.setEmail(register.getEmail());
		reg.setUsername(register.getUsername());

	//if(registerService.insert(register)!=null)
		return "redirect:/loadOtp";
	}
	 

	@RequestMapping(path="/loadLogin",method=RequestMethod.GET)
	public String loadLogin(ModelMap model,HttpSession session)
	{
		session.invalidate();
		Register register=new Register();
		model.addAttribute("user",register);
		return "Login";	
	}

	
	@RequestMapping(path="/login",method=RequestMethod.POST)
	public String login(Register register,BindingResult result,HttpSession session,ModelMap model)
	{
	
		Register register1=new Register();
		 register1=registerService.authenticate(register);
		 System.out.println("====in the login");
		// System.out.println(register1.getUsername()+" "+register1.getPassword());
		 if(register1!=null)
		 {
			 if(register.getPassword().equals(register1.getPassword())&&(register1.getUsertype().equalsIgnoreCase("User")))
			{ 
				  session.setAttribute("user", register1);
				
				  return "homeuser";
					 }
			 else
				 if(register.getPassword().equals(register1.getPassword())&&(register1.getUsertype().equalsIgnoreCase("admin")))
				 {
				
				  session.setAttribute("admin", register1);
				 
					 
					 return "home";
				 }
		 
		 }
		 else if(register1==null)
		 
			 return "denied";
		 return "denied";
		 
	}
	

	
	
	 
	@RequestMapping(path="/loadOtp",method=RequestMethod.GET)
	public String loadOtp(ModelMap model)
	{
		Register register=new Register();
		model.addAttribute("otp", register);
		return "Otp";
	}
	@RequestMapping(path="/generateOtp",method=RequestMethod.POST)
	public String addingOtp(ModelMap model)
	{
		//Register register=new Register();
		model.addAttribute("GenerateOtp", reg);
		SendEmail sm=new SendEmail();
		otp=sm.otp1(reg.getEmail());
		return "redirect:/loadSubmitOtp";
	}
	@RequestMapping(path="/loadSubmitOtp",method=RequestMethod.GET)
	public String loadSubmitOtp(Otp otp,ModelMap model)
	{
		model.addAttribute("SubmitOtp",otp);
		return "SubmitOtp";
	}
	@RequestMapping(path="/submitOtp",method=RequestMethod.POST)
	public String submitOtp(Otp otp1,BindingResult result)
	{
		System.out.println(reg);
		System.out.println(this.otp+"==============================================================");
		if(this.otp.equals(otp1.getOtp()))
		{
			System.out.println("++++++++++++++++++++++++++++++inside otp=otp");
			reg.setConfirmed(1);
			if(registerService.insert(reg)!=null) {
				System.out.println("++++++++++++++++++++++inside if service");
			}
				return "redirect:/loadLogin";
		}
		return "redirect:/loadOtp";
	}
	@RequestMapping(path="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session)
	{
		//System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[in logout");
		session.invalidate();
		return "redirect:/loadLogin";	}
	@RequestMapping(path="/loadUpdatePassword",method=RequestMethod.GET)
	public String updatePass(ModelMap model,HttpSession session)
	{
		UpdatePassword update =new UpdatePassword();
	System.out.println(session.getAttribute("user"));
		model.addAttribute("register", update);
		return "updatePassword";
	}
	@RequestMapping(path="/updatePassword",method=RequestMethod.POST)
	public String updatePasssword(UpdatePassword update)
	{
		Register register=registerService.getUser(update.getUsername());
		if(register!=null) {
if(register.getPassword().equals(update.getCurrentpassword()))
		{
		register.setPassword(update.getNewpassword());
		registerService.updateUser(register);
		return "redirect:/loadLogin";
		}
		}
		else
		{
			if(register==null)
			
			return "deniedPasswordchange";
		}
		return "deniedPasswordchange";
		
	}
	
	
	
	  @RequestMapping(path="/loadforgotPassword",method=RequestMethod.GET)
	   public String loadForgot(Register register,ModelMap model) {
		  model.addAttribute("register", register);
		  return "forgotPassword";
		  		
	  }
	  @RequestMapping(path="/forgotPasswordafter",method=RequestMethod.POST)
	  public String forgot(Register register,ModelMap model)
	  {
		  System.out.println("inside forgoitr");;
		  System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"+register.getUsername());
			SendEmail sm=new SendEmail();
			Register register3=registerService.getUser(register.getUsername());
			System.out.println("|||||||||||||||||||||||||||||"+register3);
			reg2.setUsername(register3.getUsername());
			otp=sm.otp1(register3.getEmail());
		  return "redirect:/loadSubmitOtp1";
	  }
	  @RequestMapping(path="/loadSubmitOtp1",method=RequestMethod.GET)
		public String loadSubmitOtpforpass(Otp otp,ModelMap model)
		{
			model.addAttribute("SubmitOtp",otp);
			return "SubmitOtp2";
		}
	  
	  @RequestMapping(path="/submitOtp1",method=RequestMethod.POST)
		public String submitOtpforpass(Otp otp1,BindingResult result)
		{
			System.out.println(reg);
			System.out.println(this.otp+"==============================================================");
			if(this.otp.equals(otp1.getOtp()))
			{
				System.out.println("++++++++++++++++++++++++++++++inside otp=otp");
				return "redirect:/loadchangepassword";
			}
			else
				return "redirect:/laodSubmitOtp";
}
	  @RequestMapping(path="/loadchangepassword",method=RequestMethod.GET)
	  public String change1(UpdatePassword register,ModelMap model)
	  {
		  model.addAttribute("register", register);
		  return "changePassword";
	  }
	  @RequestMapping(path="/changePassword",method=RequestMethod.POST)
	  public String change(UpdatePassword update,ModelMap model)
	  {
		  System.out.println("[][][][][][][][][][][][");
		  System.out.println("in the chAMGE PASSWORD"+reg2.getUsername());
		  Register register1=registerService.getUser(reg2.getUsername());
		  System.out.println("from change password"+register1);
		  register1.setPassword(update.getNewpassword());
		  registerService.updateUser(register1);
		  return "redirect:/loadLogin";
	  }
	  
	  
	  @RequestMapping("/validate")
	  @ResponseBody
	  public String checkEmail(@RequestParam String uname)
	  {
		  System.out.println("in check email"+uname);
	   if(registerService.checkEmail(uname)==null)
	   { 
		   System.out.println(registerService.checkEmail(uname));
		   return "Right";
	   }
	   else
	   {
		   System.out.println("In else statement");
		   return "Wrong";
	   }
	  }
	  @RequestMapping(path="/loadUpdateUser",method=RequestMethod.GET)
	  public String update(HttpSession session,ModelMap model)
	  {
		  Register register=(Register)session.getAttribute("user");
		  System.out.println(register+"lllllllllllllllllllllllllllllllssssssssssssss");
		  model.addAttribute("register", register);
		  return "updateUser";
		  
	  }
	  @RequestMapping(path="/updateUser",method=RequestMethod.POST)
	  public String updateUser(Register register,HttpSession session,ModelMap model)
	  {
		  
		  register.setConfirmed(1);
		  register.setUsertype("user");
		  register.setPassword(((Register) session.getAttribute("user")).getPassword());
		 registerService.updateUser(register);
		model.addAttribute("message", "Successfully updated profile");
		return "redirect:/loadhomeuser";
		  
	  }
	
	  @RequestMapping(path="/loadhomeuser",method=RequestMethod.GET) 
	  public String loadhomeuser(HttpSession session,ModelMap model) 
	  {
		
		  String name=((Register)  session.getAttribute("user")).getUsername(); 
		  Register register=registerService.getUser(name); 
		  model.addAttribute("user", register);
	  return "homeuser";
	  
	  }
	  
	 
		}

