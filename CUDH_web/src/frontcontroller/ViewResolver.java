package frontcontroller;

public class ViewResolver {
	public static String makeUrl(String view) {
		System.out.println(view+".jsp");
		return view+".jsp";
		//return "/WEB-INF/"+view+".jsp";
	}
}
