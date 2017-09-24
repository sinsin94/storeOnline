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
	    //TODO ����������� 
	    //model.addAttribute("username", nameStr); 
	    //��ȡ��Ҫ����������List 
	     if(list==null || list.size()==0)
	    	 return ;
	      //ʹ�÷�������excleģ����ʽ 
	    HSSFWorkbook workbook =createExcel(list); 
	    SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss"); // �����ļ�����ʽ 
	  
	    try { 
	    //����excle���� ISO-8859-1��ֹ�������� 
	      String msg = new String( 
	          (format.format(new Date()) + ".xls").getBytes(), 
	          "ISO-8859-1"); 
	      // �Ե���ʱ����Ϊ�ļ���
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
		  
		    // ����һ��webbook����Ӧһ��excel�ļ� 
		    HSSFWorkbook workbook = new HSSFWorkbook(); 
		    // ��webbook�����һ��sheet,��Ӧexcel�ļ��е�sheet 
		    HSSFSheet sheet = workbook.createSheet("�ͻ���Ϣ��"); 
		    // �����п� 
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
		    // ��sheet����ӱ�ͷ��0�� 
		    HSSFRow row = sheet.createRow(0); 
		    // ������Ԫ�񣬲����ñ�ͷ�����ñ�ͷ���� 
		    HSSFCellStyle style = workbook.createCellStyle(); 
		    // ����һ�����и�ʽ 
		    style.setAlignment(HSSFCellStyle.ALIGN_CENTER); 
		    // ���߿� 
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN); 
		    // ����һ������ 
		    HSSFFont font = workbook.createFont(); 
		    // �������� 
		    font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD); 
		    
		    // �����С 
		    font.setFontHeightInPoints((short) 12); 
		    // ������Ӧ�õ���ǰ����ʽ 
		    style.setFont(font); 
		  
		    // �����������о��л���� 
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
		    cell.setCellValue("���"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(1); 
		    cell.setCellValue("���"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(2); 
		    cell.setCellValue("����"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(3); 
		    cell.setCellValue("�Ա�"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(4); 
		    cell.setCellValue("�ܱ�����"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(5); 
		    cell.setCellValue("�ܱ���"); 
		    cell.setCellStyle(style); 
		  
		    cell = row.createCell(6); 
		    cell.setCellValue("�û���"); 
		    cell = row.createCell(7); 
		    cell.setCellValue("н��"); 
		    cell = row.createCell(8); 
		    cell.setCellValue("ע��ʱ��"); 
		    cell = row.createCell(9); 
		    cell.setCellValue("���֤"); 
		    cell = row.createCell(10); 
		    cell.setCellValue("����"); 
		    cell = row.createCell(11); 
		    cell.setCellValue("ְλ"); 
		    cell = row.createCell(12); 
		    cell.setCellValue("����"); 
		    cell = row.createCell(13); 
		    cell.setCellValue("����");
		    cell = row.createCell(14); 
		    cell.setCellValue("��ҵԺУ");
		    cell = row.createCell(15); 
		    cell.setCellValue("ѧ��"); 
		    cell = row.createCell(16); 
		    cell.setCellValue("��ϵ��ʽ");
		    
		    
		    
		    
		    
		    cell.setCellStyle(style); 
		    for (int i = 0; i < list.size(); i++) { 
		      String logTypeDis = ""; 
		      row = sheet.createRow(i + 1); 
		      Stuff stuff = list.get(i);
		      // ������Ԫ�񣬲�����ֵ 
		      // ����о��� 
		      HSSFCell c1 = row.createCell(0); 
		      c1.setCellStyle(style2); 
		      c1.setCellValue(i); 
		      
		      HSSFCell c2 = row.createCell(1); 
		      c2.setCellStyle(style1); 
		      c2.setCellValue(stuff.getStuNo());//��� 
		  
		      String sexStr = stuff.getSex();//�Ա� 0:Ů,1:�� 
		     
		      HSSFCell c3 = row.createCell(2);//���� 
		      c3.setCellStyle(style1); 
		      c3.setCellValue(stuff.getRname()); 
		      
		      HSSFCell c4 = row.createCell(3); 
		      c4.setCellStyle(style1); 
		      c4.setCellValue(stuff.getSex());//�Ա�
		      
		      HSSFCell c5 = row.createCell(4); 
		      c5.setCellStyle(style1); 
		      c5.setCellValue(stuff.getQuestion());//�ܱ�����
		      
		      HSSFCell c6 = row.createCell(5); 
		      c6.setCellStyle(style1); 
		      c6.setCellValue(stuff.getAnswer());//�ܱ���
		      
		      HSSFCell c7 = row.createCell(6); 
		      c7.setCellStyle(style1); 
		      c7.setCellValue(stuff.getName());//�û���
		      
		      HSSFCell c8 = row.createCell(7); 
		      c8.setCellStyle(style1); 
		      c8.setCellValue(stuff.getSalary());//н��
		      
		      HSSFCell c9 = row.createCell(8); 
		      c9.setCellStyle(style1); 
		      c9.setCellValue(stuff.getRegTime());//��ְʱ��
		      
		      HSSFCell c10 = row.createCell(9); 
		      c10.setCellStyle(style1); 
		      c10.setCellValue(stuff.getCardNo());//���֤��
		      
		      HSSFCell c11 = row.createCell(10); 
		      c11.setCellStyle(style1); 
		      c11.setCellValue(stuff.getProfession());//����
		      
		      HSSFCell c12 = row.createCell(11); 
		      c12.setCellStyle(style1); 
		      c12.setCellValue(stuff.getPosition());//ְλ
		      
		      HSSFCell c13 = row.createCell(12); 
		      c13.setCellStyle(style1); 
		      c13.setCellValue(stuff.getPlace());//����
		      
		      HSSFCell c14 = row.createCell(13); 
		      c14.setCellStyle(style1); 
		      c14.setCellValue(stuff.getNation());//����
		      
		      HSSFCell c15 = row.createCell(14); 
		      c15.setCellStyle(style1); 
		      c15.setCellValue(stuff.getSchool());//��ҵԺУ
		      
		      HSSFCell c16 = row.createCell(15); 
		      c16.setCellStyle(style1); 
		      c16.setCellValue(stuff.getEducation());//ѧ��
		      
		      HSSFCell c17 = row.createCell(16); 
		      c17.setCellStyle(style1); 
		      c17.setCellValue(stuff.getNum());//��ϵ��ʽ
		      
		      
		        
		     
		      //ʹ��Ĭ�ϸ�ʽ 
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