

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@WebServlet("/Location")
public class Location extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Location() {
        super();
    } 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int indexSi = 1;
		int indexGu = 1;
		String[] location = {"서울특별시", "부산광역시", "인천광역시", "대구광역시", "광주광역시",
							"대전광역시", "울산광역시", "경기도", "강원도", "충청북도", "충청남도",
							"경상북도", "경상남도", "전라북도", "전라남도", "제주특별자치도"};
		
		String obj = request.getParameter("obj");
		
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(obj);
		
		List<SiDto> sidtos = new ArrayList<SiDto>();
		List<GuDto> gudtos = new ArrayList<GuDto>();
		
		for(int i = 0; i < element.getAsJsonObject().get("data").getAsJsonArray().size(); i++) {
			SiDto si = new SiDto(indexSi, location[i]);
			for(int j = 0; j < element.getAsJsonObject().get("data").getAsJsonArray().get(i).getAsJsonObject().get(location[i]).getAsJsonArray().size() ; j++) {
				String subgu = element.getAsJsonObject().get("data").getAsJsonArray().get(i).getAsJsonObject().get(location[i]).getAsJsonArray().get(j).toString();
				String finalgu = subgu.substring(1,subgu.length()-1);
				GuDto gu = new GuDto(indexGu, indexSi, finalgu);
				gudtos.add(gu);
				indexGu++;
			}
			sidtos.add(si);
			indexSi++;
		}
		
		for(int i = 0; i < sidtos.size(); i++) {
			System.out.println(sidtos.get(i).toString());
		}
		for(int i = 0; i < gudtos.size(); i++) {
			System.out.println(gudtos.get(i).toString());
		}
		
		LocationDao dao = new LocationDao();
		dao.si_insert(sidtos);
		dao.gu_insert(gudtos);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
