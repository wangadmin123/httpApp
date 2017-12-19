package cn.tyyhoa.util;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;

/**
 * 生成excel 工具类 
 * @author "sw"
 *
 */
public class ExcelUtil {
    

    /**
     * 创建excel文档，
     * @param list 数据
     * @param keys list中map的key数组集合
     * @param columnNames excel的列名
     * @throws Exception 
     * */
	public static Workbook createWorkBook(List<Map<String ,Object>> list, String []keys, String[] columnNames, String bookTitle,HttpServletRequest request) throws Exception {
        // 创建excel工作簿
        Workbook wb = new HSSFWorkbook();
        // 创建两种单元格格式
        CellStyle cs = wb.createCellStyle();
        CellStyle cs2 = wb.createCellStyle();
        CellStyle title=wb.createCellStyle();
        // 创建两种字体
        Font f_t=wb.createFont();
        Font f = wb.createFont();
        Font f2 = wb.createFont();
        //标题的字体
        f_t.setFontHeightInPoints((short)24);
        f.setColor(IndexedColors.BLACK.getIndex());
        title.setFont(f_t);
        title.setBorderLeft(CellStyle.BORDER_THIN);
        title.setBorderRight(CellStyle.BORDER_THIN);
        title.setBorderTop(CellStyle.BORDER_THIN);
        title.setBorderBottom(CellStyle.BORDER_THIN);
        title.setAlignment(CellStyle.ALIGN_CENTER);
        // 创建第一种字体样式（用于列名）
        f.setFontHeightInPoints((short) 10);
        f.setColor(IndexedColors.BLACK.getIndex());
        f.setBoldweight(Font.BOLDWEIGHT_BOLD);
        // 创建第二种字体样式（用于值）
        f2.setFontHeightInPoints((short) 10);
        f2.setColor(IndexedColors.BLACK.getIndex());
        // 设置第一种单元格的样式（用于列名）
        cs.setFont(f);
        cs.setBorderLeft(CellStyle.BORDER_THIN);
        cs.setBorderRight(CellStyle.BORDER_THIN);
        cs.setBorderTop(CellStyle.BORDER_THIN);
        cs.setBorderBottom(CellStyle.BORDER_THIN);
        cs.setAlignment(CellStyle.ALIGN_CENTER);
        // 设置第二种单元格的样式（用于值）
        cs2.setFont(f2);
        cs2.setBorderLeft(CellStyle.BORDER_THIN);
        cs2.setBorderRight(CellStyle.BORDER_THIN);
        cs2.setBorderTop(CellStyle.BORDER_THIN);
        cs2.setBorderBottom(CellStyle.BORDER_THIN);
        cs2.setAlignment(CellStyle.ALIGN_CENTER);
        //字数过多自动换行
        //cs2.setWrapText(true);  
        // 创建第一个sheet（页），并命名
        Sheet sheet = wb.createSheet("sheet1");
        //合并单元格
        sheet.addMergedRegion(new CellRangeAddress(0,0,0,keys.length-1));
        // 创建第一行  标题
        Row row = sheet.createRow((short) 0);
        Cell cel=row.createCell(0);
        cel.setCellValue(bookTitle);
        cel.setCellStyle(title);
   
        row = sheet.createRow((short) 1);

        //设置列名
        for(int i=0;i<columnNames.length;i++){
            Cell cell = row.createCell(i);
            cell.setCellValue(columnNames[i]);
            cell.setCellStyle(cs);
            sheet.autoSizeColumn(i);
        }
        //设置每行每列的值
        int i=2;
        
        for(Map<String ,Object> map:list){
            // Row 行,Cell 方格 , Row 和 Cell 都是从0开始计数的
            // 创建一行，在页sheet上
            Row row1 = sheet.createRow((short) i);
             
          
        	  
        	  /* cs2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//设置前景填充样式
               cs2.setFillForegroundColor(HSSFColor.DARK_RED.index);//前景填充色
*/          
           
            // 在row行上创建一个方格
            for(short j=0;j<keys.length;j++){
                Cell cell = row1.createCell(j);
                String str=map.get(keys[j]) == null?" ": map.get(keys[j]).toString();
                cell.setCellValue(str);
                cell.setCellStyle(cs2);
                int width=sheet.getColumnWidth(j);
                if(width < 265*str.length())  sheet.autoSizeColumn(j);
//                System.out.print(map.get(keys[j])+"\t| ");
            }
//            System.out.println();
            i++;
        }
        return wb;
    }
  
    
}
