package model;

public class VO {
	//area
		private int a_idx;
		private String a_state;
		private String a_city;
	//board
		private int b_idx;
		private String b_category;
		private String b_state;
		private String b_title;
		private String b_city;
		private String b_contents;
		private String b_writer;
		private int b_views;
		private int b_likes;
		private int b_m_idx;
	  //계약  
		private int con_idx;
		private int con_m_idx;
		private int con_p_idx;
		private String con_date;
		private String con_about;	
		private String con_approval;
		//작물
		private int c_idx;
		private String c_state;
		private String c_city;
	    private String c_name;
	    
	    private String a_tem;
	    private String ah_tem;
	    private String h_tem;
	    private String al_tem;
	    private String l_tem;
	    private String s_h_tem;
	    private String s_a_tem;
	    private String s_ah_tem;
	    private String s_al_tem;
	    private String s_l_tem;
	    
	    private String precipitation;
	    private String a_humidity;
	    private String l_humidity;
	    private String insolation;
	    private String insolation_add;
	    private String a_wind_spd;
	    private String h_wind_spd;
	    private String sow_month;
	    
	    
	    private int m_idx;
	    private String m_id;
	    private String m_pw;
	    private String m_name;
		private String m_farming;
		private String m_area;
		private String m_hoping_crop;
		private int m_board_counting;
		
		private int p_idx;
		private String p_name;
		private String p_expertise;
		private String p_career;
		private String p_consulting_price;
		
		
		private int pa_p_idx;
		private int pa_a_idx;
		
		private int pc_p_idx;
		private int pc_c_idx;
		
		private int l_b_idx;
		private int l_m_idx;
		
		
		public int getA_idx() {
			return a_idx;
		}
		public void setA_idx(int a_idx) {
			this.a_idx = a_idx;
		}
		public String getA_state() {
			return a_state;
		}
		public void setA_state(String a_state) {
			this.a_state = a_state;
		}
		public String getA_city() {
			return a_city;
		}
		public void setA_city(String a_city) {
			this.a_city = a_city;
		}
		public int getB_idx() {
			return b_idx;
		}
		public void setB_idx(int b_idx) {
			this.b_idx = b_idx;
		}
		public String getB_category() {
			return b_category;
		}
		public void setB_category(String b_category) {
			this.b_category = b_category;
		}
		public String getB_state() {
			return b_state;
		}
		public void setB_state(String b_state) {
			this.b_state = b_state;
		}
		public String getB_title() {
			return b_title;
		}
		public void setB_title(String b_title) {
			this.b_title = b_title;
		}
		public String getB_city() {
			return b_city;
		}
		public void setB_city(String b_city) {
			this.b_city = b_city;
		}
		public String getB_contents() {
			return b_contents;
		}
		public void setB_contents(String b_contents) {
			this.b_contents = b_contents;
		}
		public String getB_writer() {
			return b_writer;
		}
		public void setB_writer(String b_writer) {
			this.b_writer = b_writer;
		}
		public int getB_views() {
			return b_views;
		}
		public void setB_views(int b_views) {
			this.b_views = b_views;
		}
		public int getB_likes() {
			return b_likes;
		}
		public void setB_likes(int b_likes) {
			this.b_likes = b_likes;
		}
		public int getB_m_idx() {
			return b_m_idx;
		}
		public void setB_m_idx(int b_m_idx) {
			this.b_m_idx = b_m_idx;
		}
		public int getCon_idx() {
			return con_idx;
		}
		public void setCon_idx(int con_idx) {
			this.con_idx = con_idx;
		}
		public int getCon_m_idx() {
			return con_m_idx;
		}
		public void setCon_m_idx(int con_m_idx) {
			this.con_m_idx = con_m_idx;
		}
		public int getCon_p_idx() {
			return con_p_idx;
		}
		public void setCon_p_idx(int con_p_idx) {
			this.con_p_idx = con_p_idx;
		}
		public String getCon_date() {
			return con_date;
		}
		public void setCon_date(String con_date) {
			this.con_date = con_date;
		}
		public String getCon_about() {
			return con_about;
		}
		public void setCon_about(String con_about) {
			this.con_about = con_about;
		}
		public String getCon_approval() {
			return con_approval;
		}
		public void setCon_approval(String con_approval) {
			this.con_approval = con_approval;
		}
		public int getC_idx() {
			return c_idx;
		}
		public void setC_idx(int c_idx) {
			this.c_idx = c_idx;
		}
		public String getC_state() {
			return c_state;
		}
		public void setC_state(String c_state) {
			this.c_state = c_state;
		}
		public String getC_city() {
			return c_city;
		}
		public void setC_city(String c_city) {
			this.c_city = c_city;
		}
		public String getC_name() {
			return c_name;
		}
		public void setC_name(String c_name) {
			this.c_name = c_name;
		}
		public String getA_tem() {
			return a_tem;
		}
		public void setA_tem(String a_tem) {
			this.a_tem = a_tem;
		}
		public String getAh_tem() {
			return ah_tem;
		}
		public void setAh_tem(String ah_tem) {
			this.ah_tem = ah_tem;
		}
		public String getH_tem() {
			return h_tem;
		}
		public void setH_tem(String h_tem) {
			this.h_tem = h_tem;
		}
		public String getAl_tem() {
			return al_tem;
		}
		public void setAl_tem(String al_tem) {
			this.al_tem = al_tem;
		}
		public String getL_tem() {
			return l_tem;
		}
		public void setL_tem(String l_tem) {
			this.l_tem = l_tem;
		}
		public String getS_h_tem() {
			return s_h_tem;
		}
		public void setS_h_tem(String s_h_tem) {
			this.s_h_tem = s_h_tem;
		}
		public String getS_a_tem() {
			return s_a_tem;
		}
		public void setS_a_tem(String s_a_tem) {
			this.s_a_tem = s_a_tem;
		}
		public String getS_ah_tem() {
			return s_ah_tem;
		}
		public void setS_ah_tem(String s_ah_tem) {
			this.s_ah_tem = s_ah_tem;
		}
		public String getS_al_tem() {
			return s_al_tem;
		}
		public void setS_al_tem(String s_al_tem) {
			this.s_al_tem = s_al_tem;
		}
		public String getS_l_tem() {
			return s_l_tem;
		}
		public void setS_l_tem(String s_l_tem) {
			this.s_l_tem = s_l_tem;
		}
		public String getPrecipitation() {
			return precipitation;
		}
		public void setPrecipitation(String precipitation) {
			this.precipitation = precipitation;
		}
		public String getA_humidity() {
			return a_humidity;
		}
		public void setA_humidity(String a_humidity) {
			this.a_humidity = a_humidity;
		}
		public String getL_humidity() {
			return l_humidity;
		}
		public void setL_humidity(String l_humidity) {
			this.l_humidity = l_humidity;
		}
		public String getInsolation() {
			return insolation;
		}
		public void setInsolation(String insolation) {
			this.insolation = insolation;
		}
		public String getInsolation_add() {
			return insolation_add;
		}
		public void setInsolation_add(String insolation_add) {
			this.insolation_add = insolation_add;
		}
		public String getA_wind_spd() {
			return a_wind_spd;
		}
		public void setA_wind_spd(String a_wind_spd) {
			this.a_wind_spd = a_wind_spd;
		}
		public String getH_wind_spd() {
			return h_wind_spd;
		}
		public void setH_wind_spd(String h_wind_spd) {
			this.h_wind_spd = h_wind_spd;
		}
		public String getSow_month() {
			return sow_month;
		}
		public void setSow_month(String sow_month) {
			this.sow_month = sow_month;
		}
		public int getM_idx() {
			return m_idx;
		}
		public void setM_idx(int m_idx) {
			this.m_idx = m_idx;
		}
		public String getM_id() {
			return m_id;
		}
		public void setM_id(String m_id) {
			this.m_id = m_id;
		}
		public String getM_pw() {
			return m_pw;
		}
		public void setM_pw(String m_pw) {
			this.m_pw = m_pw;
		}
		public String getM_name() {
			return m_name;
		}
		public void setM_name(String m_name) {
			this.m_name = m_name;
		}
		public String getM_farming() {
			return m_farming;
		}
		public void setM_farming(String m_farming) {
			this.m_farming = m_farming;
		}
		public String getM_area() {
			return m_area;
		}
		public void setM_area(String m_area) {
			this.m_area = m_area;
		}
		public String getM_hoping_crop() {
			return m_hoping_crop;
		}
		public void setM_hoping_crop(String m_hoping_crop) {
			this.m_hoping_crop = m_hoping_crop;
		}
		public int getM_board_counting() {
			return m_board_counting;
		}
		public void setM_board_counting(int m_board_counting) {
			this.m_board_counting = m_board_counting;
		}
		public int getP_idx() {
			return p_idx;
		}
		public void setP_idx(int p_idx) {
			this.p_idx = p_idx;
		}
		public String getP_name() {
			return p_name;
		}
		public void setP_name(String p_name) {
			this.p_name = p_name;
		}
		public String getP_expertise() {
			return p_expertise;
		}
		public void setP_expertise(String p_expertise) {
			this.p_expertise = p_expertise;
		}
		public String getP_career() {
			return p_career;
		}
		public void setP_career(String p_career) {
			this.p_career = p_career;
		}
		public String getP_consulting_price() {
			return p_consulting_price;
		}
		public void setP_consulting_price(String p_consulting_price) {
			this.p_consulting_price = p_consulting_price;
		}
		public int getPa_p_idx() {
			return pa_p_idx;
		}
		public void setPa_p_idx(int pa_p_idx) {
			this.pa_p_idx = pa_p_idx;
		}
		public int getPa_a_idx() {
			return pa_a_idx;
		}
		public void setPa_a_idx(int pa_a_idx) {
			this.pa_a_idx = pa_a_idx;
		}
		public int getPc_p_idx() {
			return pc_p_idx;
		}
		public void setPc_p_idx(int pc_p_idx) {
			this.pc_p_idx = pc_p_idx;
		}
		public int getPc_c_idx() {
			return pc_c_idx;
		}
		public void setPc_c_idx(int pc_c_idx) {
			this.pc_c_idx = pc_c_idx;
		}
		public int getL_b_idx() {
			return l_b_idx;
		}
		public void setL_b_idx(int l_b_idx) {
			this.l_b_idx = l_b_idx;
		}
		public int getL_m_idx() {
			return l_m_idx;
		}
		public void setL_m_idx(int l_m_idx) {
			this.l_m_idx = l_m_idx;
		}
		
		
}
