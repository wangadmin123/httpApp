package cn.tyyhoa.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Decoder.BASE64Encoder;



@Controller
@RequestMapping("/random")
public class OarlzybRandomImageContorller {

	private ByteArrayInputStream inputStream;

	private static int WIDTH = 100;

	private static int HEIGHT = 35;

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	private static String createRandom() {
		String str = "0123456789qwertyuiopasdfghjklzxcvbnm";

		char[] rands = new char[4];

		Random random = new Random();

		for (int i = 0; i < 4; i++) {
			rands[i] = str.charAt(random.nextInt(36));
		}

		return new String(rands);
	}

	private void drawBackground(Graphics g) {
		// 画背景
		g.setColor(new Color(0xDCDCDC));

		g.fillRect(0, 0, WIDTH, HEIGHT);

		// 随机产生 120 个干扰点

		for (int i = 0; i < 120; i++) {
			int x = (int) (Math.random() * WIDTH);

			int y = (int) (Math.random() * HEIGHT);

			int red = (int) (Math.random() * 255);

			int green = (int) (Math.random() * 255);

			int blue = (int) (Math.random() * 255);

			g.setColor(new Color(red, green, blue));

			g.drawOval(x, y, 1, 0);
		}
	}
	
	
	private void drawRands(Graphics g, String rands) {
		g.setColor(Color.BLACK);

		g.setFont(new Font(null, Font.ITALIC | Font.BOLD, 25));

		// 在不同的高度上输出验证码的每个字符

		g.drawString("" + rands.charAt(0), 3, 25);

		g.drawString("" + rands.charAt(1), 25, 20);

		g.drawString("" + rands.charAt(2), 31, 30);

		g.drawString("" + rands.charAt(3), 46, 20);

		/*System.out.println(rands);*/

	}
	
	@RequestMapping("/getrandom")
	@ResponseBody
	public String getImag(HttpServletRequest request, HttpSession session,HttpServletResponse response){
		
		response.setHeader("Pragma", "no-cache");

		response.setHeader("Cache-Control", "no-cache");

		response.setDateHeader("Expires", 0);

		String rands = createRandom();
		
		

		BufferedImage image = new BufferedImage(WIDTH, HEIGHT,
				BufferedImage.TYPE_INT_RGB);

		Graphics g = image.getGraphics();

		// 产生图像
		drawBackground(g);

		drawRands(g, rands);

		// 结束图像 的绘制 过程， 完成图像
		g.dispose();
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		String baseCode = "";
		try {
			ImageIO.write(image, "png", outputStream);
			BASE64Encoder encoder = new BASE64Encoder(); 
			baseCode = encoder.encode(outputStream.toByteArray());
		/*	ByteArrayInputStream input = new ByteArrayInputStream(
					outputStream.toByteArray());
			this.setInputStream(input);
			session.setAttribute("checkCode", rands);
	
			input.close();*/
			outputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
/*		System.out.println("data:image/png;base64,"+baseCode);*/
		session.setAttribute("rands", rands);
		return "data:image/png;base64,"+baseCode;
	}
}
