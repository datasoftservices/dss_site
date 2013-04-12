package com.dss.common;

public class MessageHelper {

	public String escapeSpecialChar(String message){
		
		int charPosition = 0;
		int counter = 0;
		
		
		while(true){
			int begin = message.indexOf("<pre",charPosition);
			int end =  message.indexOf("</pre>",charPosition);
			System.out.println("begin" + begin);
			System.out.println("end" + end);
			
			if(begin == -1 || end == -1)
				break;
			else{
				begin = message.indexOf(">",begin) + 1;
				end -= 1;
			}
			System.out.println("-----");
			System.out.println(message);
			System.out.println("begin" + begin);
			System.out.println("end" + end);
			
			String format = message.substring(begin, end);
			String result = format.replaceAll("<", "&lt;");
			format = result.replaceAll(">", "&gt;");
			
			
			String before = message.substring(0, begin);
			String after = message.substring(end);
			System.out.println(before + "| + |" + format + "| + |" + after);
			message = before + format + after;
			
			charPosition = end;
			counter++;
			if(counter > 20){
				System.out.println("FAILSAFE ENDED WHILE");
			break;}
		}
		return message;
	}
}
