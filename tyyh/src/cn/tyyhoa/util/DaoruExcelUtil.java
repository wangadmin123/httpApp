package cn.tyyhoa.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import cn.tyyhoa.pojo.OaScbDaoRuCon;

public class DaoruExcelUtil {

	/**
	 * 读取xls文件内容
	 * 
	 * @return List<XlsDto>对象
	 * @throws IOException
	 *             输入/输出(i/o)异常
	 */
	/**
	 * @param path
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */	
	public static List<OaScbDaoRuCon> readXls(String filePath) throws IOException,ParseException {// 得到文件
		
		System.out.println("路径为" + filePath);
		// 根据指定的文件输入流导入Excel从而产生Workbook对象
		InputStream is = new FileInputStream(new File(filePath));
		HSSFWorkbook hssfworkbook = new HSSFWorkbook(is);
		List<OaScbDaoRuCon> list = new ArrayList<OaScbDaoRuCon>();
		OaScbDaoRuCon oaScbDaoRuCon = null;
		// 循环工作表Sheet
		for (int numSheet = 0; numSheet < hssfworkbook.getNumberOfSheets(); numSheet++) {
			
			HSSFSheet hssfSheet = hssfworkbook.getSheetAt(numSheet);// 获得EXCEL工作表
			if (hssfSheet == null) {
				continue;
			}
			// 循环行Row
			for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				if (hssfRow == null) {
					continue;
				}
				oaScbDaoRuCon = new OaScbDaoRuCon();
				// 循环列Cell
				HSSFCell id = hssfRow.getCell(0); // 第rowNum行。第1列
		
				if (id == null || getValue(id).equals("")
						|| getValue(id) == null) { // 如果值值为空 就跳出循环
					continue; // 继续
				}
				HSSFCell firstConsultTime = hssfRow.getCell(1); // 第rowNum行。第2列
				
				HSSFCell consultTeacher = hssfRow.getCell(2); // 第rowNum行。第2列
				if (consultTeacher == null || getValue(consultTeacher).equals("")
						|| getValue(consultTeacher) == null) { // 如果值值为空 就跳出循环
					continue;// 继续
				}
				HSSFCell consultWay = hssfRow.getCell(3); // 第rowNum行。第2列
				if (consultWay == null || getValue(consultWay).equals("")
						|| getValue(consultWay) == null) { // 如果值值为空 就跳出循环
					continue;// 继续
				}
				HSSFCell consultLesson = hssfRow.getCell(4); // 第rowNum行。第2列
				
				HSSFCell rank = hssfRow.getCell(5); // 第rowNum行。第2列
				
				HSSFCell name = hssfRow.getCell(6); // 第rowNum行。第2列
				if (name == null || getValue(name).equals("")
						|| getValue(name) == null) { // 如果值值为空 就跳出循环
					continue;// 继续
				}
				HSSFCell sex = hssfRow.getCell(7); // 第rowNum行。第2列
				if (sex == null || getValue(sex).equals("")
						|| getValue(sex) == null) { // 如果值值为空 就跳出循环
					continue;// 继续
				}
				HSSFCell age = hssfRow.getCell(8); // 第rowNum行。第2列
				
				HSSFCell telphone1 = hssfRow.getCell(9); // 第rowNum行。第2列
				if (telphone1 == null || getValue(telphone1).equals("")
						|| getValue(telphone1) == null) { // 如果值值为空 就跳出循环
					continue;// 继续
				}
				HSSFCell telphone2 = hssfRow.getCell(10); // 第rowNum行。第2列
				
				HSSFCell wechat = hssfRow.getCell(11); // 第rowNum行。第2列
				
				HSSFCell city = hssfRow.getCell(12); // 第rowNum行。第2列
				
				HSSFCell district = hssfRow.getCell(13); // 第rowNum行。第2列
				
				HSSFCell education = hssfRow.getCell(14); // 第rowNum行。第2列
				
				HSSFCell specialty = hssfRow.getCell(15); // 第rowNum行。第2列
				
				HSSFCell status = hssfRow.getCell(16); // 第rowNum行。第2列
				
				
				HSSFCell infoSource = hssfRow.getCell(17); // 第rowNum行。第2列
				
				
				HSSFCell keywords = hssfRow.getCell(18); // 第rowNum行。第2列
				
				
				// 得到数据 提交数据到数据库
				oaScbDaoRuCon.setId(getValue(id));
				if (firstConsultTime == null || getValue(firstConsultTime).equals("")
						|| getValue(firstConsultTime) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setFirstConsultTime(null);
				}else{
					oaScbDaoRuCon.setFirstConsultTime(getValue(firstConsultTime));
				}
				
				oaScbDaoRuCon.setConsultTeacher(getValue(consultTeacher));
				oaScbDaoRuCon.setConsultWay(getValue(consultWay));
				if (consultLesson == null || getValue(consultLesson).equals("")
						|| getValue(consultLesson) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setConsultLesson(null);
				}else{
					oaScbDaoRuCon.setConsultLesson(getValue(consultLesson));
				}
				if (rank == null || getValue(rank).equals("")
						|| getValue(rank) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setRank(null);
				}else{
					oaScbDaoRuCon.setRank(getValue(rank));
				}
			
				oaScbDaoRuCon.setName(getValue(name));
				oaScbDaoRuCon.setSex(getValue(sex));
				if (age == null || getValue(age).equals("")
						|| getValue(age) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setAge(null);
				}else{
					oaScbDaoRuCon.setAge(getValue(age));
				}
				
				oaScbDaoRuCon.setTelphone1(getValue(telphone1));
				if(telphone2==null || getValue(telphone2).equals("") || getValue(telphone2)==null){
					oaScbDaoRuCon.setTelphone2(null);
				}else{
					oaScbDaoRuCon.setTelphone2(getValue(telphone2));
				}
				if (wechat == null || getValue(wechat).equals("")
						|| getValue(wechat) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setWechat(null);
				}else{
					oaScbDaoRuCon.setWechat(getValue(wechat));
				}
				
				if (city == null || getValue(city).equals("")
						|| getValue(city) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setCity(null);
				}else{
					oaScbDaoRuCon.setCity(getValue(city));
				}
				if (district == null || getValue(district).equals("")
						|| getValue(district) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setDistrict(null);
				}else{
					oaScbDaoRuCon.setDistrict(getValue(district));
				}
				if (education == null || getValue(education).equals("")
						|| getValue(education) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setEducation(null);
				}else{
					oaScbDaoRuCon.setEducation(getValue(education));
				}
				if (specialty == null || getValue(specialty).equals("")
						|| getValue(specialty) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setSpecialty(null);
				}else{
					oaScbDaoRuCon.setSpecialty(getValue(specialty));
				}
				
				if (status == null || getValue(status).equals("")
						|| getValue(wechat) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setStatus(null);
				}else{
					oaScbDaoRuCon.setStatus(getValue(status));
				}
				if (infoSource == null || getValue(infoSource).equals("")
						|| getValue(wechat) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setInfoSource(null);
				}else{
					oaScbDaoRuCon.setInfoSource(getValue(infoSource));
				}
				
				if (keywords == null || getValue(keywords).equals("")
						|| getValue(wechat) == null) { // 如果值值为空 就跳出循环
					oaScbDaoRuCon.setKeywords(null);
				}else{
					oaScbDaoRuCon.setKeywords(getValue(keywords));
				}
				
				list.add(oaScbDaoRuCon);// 提交数据
			}
		}
		
		return list; // 返回集合

}
	
	

	/**
	 * 得到Excel表中的值
	 * 
	 * @param hssfCell
	 *            Excel中的每一个格子
	 * @return Excel中每一个格子中的值
	 */
	private static String getValue(HSSFCell hssfCell) {
		if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) { // 判断得到的数据是否是布尔类型的
			return String.valueOf(hssfCell.getBooleanCellValue());

		} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) { // 判断得到的数据是否是数值类型的
																			// 并且
																			// 判断是否得到的是时间类型并且进行转换

			if (HSSFDateUtil.isCellDateFormatted(hssfCell)) { // 判断是否是时间类型
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				return sdf
						.format(HSSFDateUtil.getJavaDate(hssfCell
								.getNumericCellValue())).toString();
			}

			DecimalFormat df = new DecimalFormat("#");
			return String.valueOf(df.format(hssfCell.getNumericCellValue()));

		} else {
			// 返回字符串类型的值
			return String.valueOf(hssfCell.getStringCellValue());
		}
	}

}
