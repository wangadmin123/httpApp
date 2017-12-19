package cn.tyyhoa.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.EnumMap;
import java.util.Map;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

/**
 * 生成二维码
 * 
 * @author "sw"
 * 
 */
public class QRCodeGeneratorUtils {

	// 默认是黑色
	private static final int QRCOLOR = 0xFF000000;
	// 背景颜色
	private static final int BGWHITE = 0xFFFFFFFF;
	// 二维码图片宽度
	private static final int width = 400;
	// 二维码图片高度
	private static final int height = 400;
	// 二维码格式参数 枚举 集合
	private static final EnumMap<EncodeHintType, Object> hints = new EnumMap<EncodeHintType, Object>(
			EncodeHintType.class);
	// 二维码配置
	static {
		/**
		 * 二维码的纠错级别(排错率),4个级别： L (7%)、 M (15%)、 Q (25%)、 H (30%)(最高H)
		 * 纠错信息同样存储在二维码中，纠错级别越高，纠错信息占用的空间越多，那么能存储的有用讯息就越少；共有四级； 选择M，扫描速度快。
		 */
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
		// 二维码边界空白大小 1,2,3,4 (4为默认,最大)
		hints.put(EncodeHintType.MARGIN, 1);
		hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
		hints.put(EncodeHintType.MAX_SIZE, 350);
		hints.put(EncodeHintType.MIN_SIZE, 150);
	}

	/**
	 * 
	 * 生成带logo的二维码图片
	 * 
	 * @param content
	 * @param request
	 * @param productName
	 * @param logoUrl
	 *            logo的路径
	 * @return
	 */
	public static String getLogoQRCode(String content,
			HttpServletRequest request, String productName, String logoUrl) {

		try {
			BufferedImage bim = getQR_CODEBufferedImage(content,
					BarcodeFormat.QR_CODE, width, height, hints);

			BufferedImage logo = null;
			if (logoUrl == null || logoUrl.equals("")) {
				String filePath = request.getServletContext().getRealPath("/")
						.replace("\\", "/")
						+ "statics/common/images/06.jpg";

				File logoPic = new File(filePath);
				logo = ImageIO.read(logoPic);

			} else {
				logo = IMGUtil.getImg(request, logoUrl);
			}
			return addLogo_QRCode(bim, logo, new LogoConfig(), productName);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 生成普通的二维码
	 * 
	 * @param content
	 * @param request
	 * @param productName
	 * @return
	 */
	public static String getCode(String content, HttpServletRequest request) {
		BufferedImage image = null;
		try {
			image = getQR_CODEBufferedImage(content, BarcodeFormat.QR_CODE,
					width, height, hints);
			if (image != null) {
				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				baos.flush();
				ImageIO.write(image, "png", baos);
				String result = Base64Util.encode(baos.toByteArray());
				return result;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 给二维码图片添加Logo
	 * 
	 * @param bim
	 * @param logoPic
	 * @param logoConfig
	 * @param productName
	 * @return
	 */
	public static String addLogo_QRCode(BufferedImage bim, BufferedImage logo,
			LogoConfig logoConfig, String productName) {
		try {
			/**
			 * 读取二维码图片，并构建绘图对象
			 */
			BufferedImage image = bim;
			Graphics2D g = image.createGraphics();

			/**
			 * 设置logo的大小,默认二维码图片的20%,因为过大会盖掉二维码
			 */
			int widthLogo = logo.getWidth(null) > image.getWidth() * 3 / 10 ? (image
					.getWidth() * 3 / 10) : logo.getWidth(null);
			int heightLogo = logo.getHeight(null) > image.getHeight() * 3 / 10 ? (image
					.getHeight() * 3 / 10) : logo.getWidth(null);
			/**
			 * logo放在中心
			 */
			int x = (image.getWidth() - widthLogo) / 2;
			int y = (image.getHeight() - heightLogo) / 2;
			/**
			 * logo放在右下角 int x = (image.getWidth() - widthLogo); int y =
			 * (image.getHeight() - heightLogo);
			 */
			// 开始绘制图片
			g.drawImage(logo, x, y, widthLogo, heightLogo, null);
			// g.drawRoundRect(x, y, widthLogo, heightLogo, 15, 15);
			// g.setStroke(new BasicStroke(logoConfig.getBorder()));
			// g.setColor(logoConfig.getBorderColor());
			// g.drawRect(x, y, widthLogo, heightLogo);
			g.dispose();

			// 把名称添加上去，名称不要太长哦，这里最多支持两行。太长就会自动截取啦
			if (productName != null && !productName.equals("")) {
				// 新的图片，把带logo的二维码下面加上文字
				BufferedImage outImage = new BufferedImage(400, 445,
						BufferedImage.TYPE_4BYTE_ABGR);
				Graphics2D outg = outImage.createGraphics();
				// 画二维码到新的面板
				outg.drawImage(image, 0, 0, image.getWidth(),
						image.getHeight(), null);
				// 画文字到新的面板
				outg.setColor(Color.BLACK);
				outg.setFont(new Font("宋体", Font.BOLD, 15)); // 字体、字型、字号
				int strWidth = outg.getFontMetrics().stringWidth(productName);
				if (strWidth > 399) {
					// 长度过长就截取前面部分
					String productName1 = productName.substring(0,
							productName.length() / 2);
					int strWidth1 = outg.getFontMetrics().stringWidth(
							productName1);
					// 长度过长就换行
					String productName2 = productName.substring(
							productName.length() / 2, productName.length());
					int strWidth2 = outg.getFontMetrics().stringWidth(
							productName2);
					outg.drawString(
							productName1,
							200 - strWidth1 / 2,
							image.getHeight()
									+ (outImage.getHeight() - image.getHeight())
									/ 2 + 12);
					BufferedImage outImage2 = new BufferedImage(400, 485,
							BufferedImage.TYPE_4BYTE_ABGR);
					Graphics2D outg2 = outImage2.createGraphics();
					outg2.drawImage(outImage, 0, 0, outImage.getWidth(),
							outImage.getHeight(), null);
					outg2.setColor(Color.BLACK);
					outg2.setFont(new Font("宋体", Font.BOLD, 15)); // 字体、字型、字号
					outg2.drawString(
							productName2,
							200 - strWidth2 / 2,
							outImage.getHeight()
									+ (outImage2.getHeight() - outImage
											.getHeight()) / 2 + 5); // 画文字
					outg2.dispose();
					outImage2.flush();
					outImage = outImage2;
				} else {
					outg.drawString(
							productName,
							200 - strWidth / 2,
							image.getHeight()
									+ (outImage.getHeight() - image.getHeight())
									/ 2 + 12); // 画文字
				}
				outg.dispose();
				outImage.flush();
				image = outImage;
			}
			if (logo != null) {
				logo.flush();
			}
			image.flush();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			baos.flush();
			ImageIO.write(image, "png", baos);
			String imageBase64QRCode = Base64Util.encode(baos.toByteArray());
			baos.close();
			return imageBase64QRCode; // 项目需求返回一个64base码 此时image对象已经重写生成
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * 生成二维码
	 * 
	 * @param content
	 *            编码内容
	 * @param barcodeFormat
	 *            编码类型
	 * @param width
	 *            图片宽度
	 * @param height
	 *            图片高度
	 * @param hints
	 *            设置参数
	 * @return bufferedImage图片
	 */
	public static BufferedImage getQR_CODEBufferedImage(String content,
			BarcodeFormat barcodeFormat, Integer width, Integer height,
			Map<EncodeHintType, ?> hints) {
		MultiFormatWriter multiFormatWriter = null;
		BitMatrix bm = null;
		BufferedImage image = null;
		try {
			multiFormatWriter = new MultiFormatWriter();
			// 参数顺序分别为：编码内容，编码类型，生成图片宽度，生成图片高度，设置参数
			bm = multiFormatWriter.encode(content, barcodeFormat, width,
					height, hints);
			int w = bm.getWidth();
			int h = bm.getHeight();
			image = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
			// 开始利用二维码数据创建Bitmap图片，分别设为黑（0xFFFFFFFF）白（0xFF000000）两色
			for (int x = 0; x < w; x++) {
				for (int y = 0; y < h; y++) {
					image.setRGB(x, y, bm.get(x, y) ? QRCOLOR : BGWHITE);
				}
			}
		} catch (WriterException e) {
			e.printStackTrace();
		}
		return image;
	}

}

/**
 * 二维码Logo实体类
 * 
 * @author "sw"
 * 
 */
class LogoConfig {

	// logo 默认边框颜色
	public static final Color DEFAULT_BORDERCOLOR = Color.WHITE;
	// logo 默认边框宽度
	public static final int DEFAULT_BORDER = 2;
	// logo 大小默认为照片的1/5
	public static final int DEFAULT_LOGOPART = 5;
	// logo border
	private final int border = DEFAULT_BORDER;
	// logo border颜色
	private final Color borderColor;
	// logo logoPart
	private final int logoPart;

	public LogoConfig() {
		this(DEFAULT_BORDERCOLOR, DEFAULT_LOGOPART);
	}

	public LogoConfig(Color borderColor, int logoPart) {
		this.borderColor = borderColor;
		this.logoPart = logoPart;
	}

	public Color getBorderColor() {
		return borderColor;
	}

	public int getBorder() {
		return border;
	}

	public int getLogoPart() {
		return logoPart;
	}
}