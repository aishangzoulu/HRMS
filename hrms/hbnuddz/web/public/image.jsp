<%@page import="java.io.OutputStream"%>
<%@ page contentType="image/JPEG"   
         import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"   
         pageEncoding="GBK"%>

<%!Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }%><%

        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);//��ֹjs����
        
        int width = 70, height = 25;
        BufferedImage image = new BufferedImage(width, height,
                BufferedImage.TYPE_INT_RGB);

        Graphics g = image.getGraphics();

        Random random = new Random();

        g.setColor(getRandColor(150, 250));//��ɫ���Ƿ������ɫ//�������涨��ĺ���
        g.fillRect(0, 0, width, height);//����

        g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
        //����

        g.setColor(getRandColor(50, 150));//�ǵ����ɫ
        for (int i = 0; i < 100; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(2);
            int yl = random.nextInt(2);
            g.drawLine(x, y, x + xl, y + yl);
            //ֱ�ߣ�x��y������x+x1��y+y1��
        }

        String sRand = "";
        for (int i = 0; i < 4; i++) {//�����ֵĸ���
            String rand = String.valueOf(random.nextInt(10));
            sRand += rand;

            g.setColor(new Color(10 + random.nextInt(80), 20 + random.nextInt(110), 20 + random.nextInt(110)));//�ֵ���ɫ
            g.drawString(rand, 15 * i + 6, 18);//xָ�����ּ�࣬yָ�������ϱ߾�ľ���
        }

        session.setAttribute("code", sRand);//�ں�̨ʹ��

        g.dispose();//���� dispose ֮�󣬾Ͳ�����ʹ�� Graphics ���� 
        ImageIO.write(image, "JPEG", response.getOutputStream());
        out.clear();
        out = pageContext.pushBody();
%>