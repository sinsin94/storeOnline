/*package com.store.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


import com.store.entity.Order;

public class Excel {
	
	public static void exportDataToExecl( List<Order> list,HttpServletResponse response) { 
	    //TODO 如需添加条件 
	    //model.addAttribute("username", nameStr); 
	    //获取需要导出的数据List 
	     if(list==null || list.size()==0)
	    	 return ;
	      //使用方法生成excle模板样式 
	    HSSFWorkbook workbook =createExcel(list); 
	    SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss"); // 定义文件名格式 
	  
	    try { 
	    //定义excle名称 ISO-8859-1防止名称乱码 
	      String msg = new String( 
	          (format.format(new Date()) + ".xls").getBytes(), 
	          "ISO-8859-1"); 
	      // 以导出时间作为文件名
	      String filename="F:/test/"+msg;
	     File file =new File(filename);
	     if(!file.exists()){
	    	 file.createNewFile();
	     }
	     response.setContentType("application/vnd.ms-excel"); 
	      response.addHeader("Content-Disposition", "attachment;filename="
	          + msg); 
	      workbook.write(response.getOutputStream()); 
	     
	    } catch (IOException e) { 
	      
	    }

	  } 
	public static HSSFWorkbook createExcel(List<Stuff	> list ) { 
		  
		    // 创建一个webbook，对应一个excel文件 
		    HSSFWorkbook workbook = new HSSFWorkbook(); 
		    // 在webbook中添加一个sheet,对应excel文件中的sheet 
		    HSSFSheet sheet = workbook.createSheet("客户信息表"); 
		    // 设置列宽 
		    sheet.setColumnWidth(0, 25 * 100); 
		    sheet.setColumnWidth(1, 35 * 100); 
		    sheet.setColumnWidth(2, 35 * 100); 
		    sheet.setColumnWidth(3, 40 * 100); 
		    sheet.setColumnWidth(4, 45 * 100); 
		    sheet.setColumnWidth(5, 45 * 100); 
		    sheet.setColumnWidth(6, 50 * 100); 
		    sheet.setColumnWidth(7, 80 * 100); 
		    sheet.setColumnWidth(8, 35 * 100); 
		    sheet.setColumnWidth(9, 40 * 100); 
		    // 在sheet中添加表头第0行 
		    HSSFRow row = sheet.createRow(0); 
		    // 创建单元格，并设置表头，设置表头居中 
		    HSSFCellStyle style = workbook.createCellStyle(); 
		    // 创建一个居中格式 
		    style.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		    // 带边框 
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN); 
		    // 生成一个字体 
		    HSSFFont font = workbook.createFont(); 
		    // 字体增粗 
		    font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); 
		    
		    // 字体大小 
		    font.setFontHeightInPoints((short) 12); 
		    // 把字体应用到当前的样式 
		    style.setFont(font); 
		  
		    // 单独设置整列居中或居左 
		    HSSFCellStyle style1 = workbook.createCellStyle(); 
		    style1.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		    HSSFCellStyle style2 = workbook.createCellStyle(); 
		    style2.setAlignment(HSSFCellStyle.ALIGN_LEFT); 
		  
		    HSSFCellStyle style3 = workbook.createCellStyle(); 
		    style3.setAlignment(HSSFCellStyle.ALIGN_LEFT); 
		    HSSFFont hssfFont = workbook.createFont(); 
		    hssfFont.setColor(HSSFFont.COLOR_RED); 
		    hssfFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); 
		    style3.setFont(hssfFont); 
		  
		    HSSFCellStyle style4 = workbook.createCellStyle(); 
		    style4.setAlignment(HSSFCellStyle.ALIGN_LEFT); 
		    HSSFFont hssfFont1 = workbook.createFont(); 
		    hssfFont1.setColor(HSSFFont.COLOR_NORMAL); 
		    hssfFont1.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); 
		    style4.setFont(hssfFont1); 
		  
		    HSSFCell cell = row.createCell(0); 
		    cell.setCellValue("序号"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(1); 
		    cell.setCellValue("编号"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(2); 
		    cell.setCellValue("姓名"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(3); 
		    cell.setCellValue("性别"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(4); 
		    cell.setCellValue("密保问题"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(5); 
		    cell.setCellValue("密保答案"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(6); 
		    cell.setCellValue("用户名"); 
		    cell = row.createCell(7); 
		    cell.setCellValue("薪资"); 
		    cell = row.createCell(8); 
		    cell.setCellValue("注册时间"); 
		    cell = row.createCell(9); 
		    cell.setCellValue("身份证"); 
		    cell = row.createCell(10); 
		    cell.setCellValue("部门"); 
		    cell = row.createCell(11); 
		    cell.setCellValue("职位"); 
		    cell = row.createCell(12); 
		    cell.setCellValue("籍贯"); 
		    cell = row.createCell(13); 
		    cell.setCellValue("民族");
		    cell = row.createCell(14); 
		    cell.setCellValue("毕业院校");
		    cell = row.createCell(15); 
		    cell.setCellValue("学历"); 
		    cell = row.createCell(16); 
		    cell.setCellValue("联系方式");
		    
		    
		    
		    
		    
		    cell.setCellStyle(style); 
		    for (int i = 0; i < list.size(); i++) { 
		      String logTypeDis = ""; 
		      row = sheet.createRow(i + 1); 
		      Stuff stuff = list.get(i);
		      // 创建单元格，并设置值 
		      // 编号列居左 
		      HSSFCell c1 = row.createCell(0); 
		      c1.setCellStyle(style2); 
		      c1.setCellValue(i); 
		      
		      HSSFCell c2 = row.createCell(1); 
		      c2.setCellStyle(style1); 
		      c2.setCellValue(stuff.getStuNo());//编号 
		  
		      String sexStr = stuff.getSex();//性别 0:女,1:男 
		     
		      HSSFCell c3 = row.createCell(2);//姓名 
		      c3.setCellStyle(style1); 
		      c3.setCellValue(stuff.getRname()); 
		      
		      HSSFCell c4 = row.createCell(3); 
		      c4.setCellStyle(style1); 
		      c4.setCellValue(stuff.getSex());//性别
		      
		      HSSFCell c5 = row.createCell(4); 
		      c5.setCellStyle(style1); 
		      c5.setCellValue(stuff.getQuestion());//密保问题
		      
		      HSSFCell c6 = row.createCell(5); 
		      c6.setCellStyle(style1); 
		      c6.setCellValue(stuff.getAnswer());//密保答案
		      
		      HSSFCell c7 = row.createCell(6); 
		      c7.setCellStyle(style1); 
		      c7.setCellValue(stuff.getName());//用户名
		      
		      HSSFCell c8 = row.createCell(7); 
		      c8.setCellStyle(style1); 
		      c8.setCellValue(stuff.getSalary());//薪资
		      
		      HSSFCell c9 = row.createCell(8); 
		      c9.setCellStyle(style1); 
		      c9.setCellValue(stuff.getRegTime());//入职时间
		      
		      HSSFCell c10 = row.createCell(9); 
		      c10.setCellStyle(style1); 
		      c10.setCellValue(stuff.getCardNo());//身份证号
		      
		      HSSFCell c11 = row.createCell(10); 
		      c11.setCellStyle(style1); 
		      c11.setCellValue(stuff.getProfession());//部门
		      
		      HSSFCell c12 = row.createCell(11); 
		      c12.setCellStyle(style1); 
		      c12.setCellValue(stuff.getPosition());//职位
		      
		      HSSFCell c13 = row.createCell(12); 
		      c13.setCellStyle(style1); 
		      c13.setCellValue(stuff.getPlace());//籍贯
		      
		      HSSFCell c14 = row.createCell(13); 
		      c14.setCellStyle(style1); 
		      c14.setCellValue(stuff.getNation());//民族
		      
		      HSSFCell c15 = row.createCell(14); 
		      c15.setCellStyle(style1); 
		      c15.setCellValue(stuff.getSchool());//毕业院校
		      
		      HSSFCell c16 = row.createCell(15); 
		      c16.setCellStyle(style1); 
		      c16.setCellValue(stuff.getEducation());//学历
		      
		      HSSFCell c17 = row.createCell(16); 
		      c17.setCellStyle(style1); 
		      c17.setCellValue(stuff.getNum());//联系方式
		      
		      
		        
		     
		      //使用默认格式 
		      row.createCell(1).setCellValue(cMcustomer.getCustomername()); 
		      row.createCell(2).setCellValue(sex); 
		    } 
		    return workbook; 
		} 


	public static void main(String[] args) {
		//exportDataToExecl();
		System.out.println("ok");
	}
	

}
*/