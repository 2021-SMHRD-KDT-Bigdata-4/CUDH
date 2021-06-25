package model;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.VO;

public class DAOMybatis {
	private static SqlSessionFactory sqlSessionFactory;
	static {// 프로그램 실행시 단한번만 실행
		try {
			String resource = "mybatis/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public VO loginMember(VO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		vo = sqlSession.selectOne("loginMember", vo);
		sqlSession.close();
		System.out.println(vo.getM_id() + "        바티스 성공");
		return vo;
	}

	public List<VO> boardList() { // 앞으로 커넥션 해줄 친구
		SqlSession sqlSession = sqlSessionFactory.openSession();
		// String SQL="select idx,title,count,contents,writer,
		// DATE_FORMAT(indate,'%Y-%m-%d') AS indate from tbl_board";
		List<VO> list = sqlSession.selectList("boardList");
		sqlSession.close();
		return list; // 여기서는 반납만하지 세션상에 올리거나 하지는 않음
	}

	public VO memberBoardContent(int b_idx) {
		 SqlSession sqlSession =sqlSessionFactory.openSession();
		 System.out.println("값 확인"  +  b_idx);
		 VO vo = sqlSession.selectOne("memberBoardContent", b_idx); // idx를 가지고 boardContent에 전송해서 vo 값을 받아온다
		 System.out.println(vo.getB_contents());
		 sqlSession.close();
		 return vo;
	}
	public int memberBoardinsert(VO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = sqlSession.insert("memberBoardinsert", vo);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}

	public int boardDelete(int b_idx) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = sqlSession.delete("boardDelete", b_idx);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}

	public int boardUpdate(VO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = sqlSession.update("boardUpdate", vo);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}

	public int boardUpdateViews(VO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = sqlSession.update("boardUpdateViews", vo);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}

	public List<VO> consultingCardList(String p_expertise) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<VO> list = sqlSession.selectList("consultingCardList", p_expertise);
		sqlSession.close();
		return list;
	}

	public List<String> consultingCardColumnsList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<String> list = sqlSession.selectList("consultingCardColumnsList");
		sqlSession.close();
		return list;
	}
	
	public int consultInsert(VO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = sqlSession.insert("consultInsert", vo);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}
	
	public List<VO> consultList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<VO> list = sqlSession.selectList("consultList");
		sqlSession.close();
		return list;
	}
	 public int memberBoardLikes(int b_idx) {
		SqlSession sqlSession =sqlSessionFactory.openSession();
		int cnt = sqlSession.selectOne("memberBoardLikes",b_idx);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	 }
	 
	public int memberBoardLikeUP(VO vo) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int cnt = sqlSession.update("memberBoardLikeUP", vo);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}
	public int insertLikeList(VO vo) {
		SqlSession sqlSession =sqlSessionFactory.openSession();
		int cnt = sqlSession.insert("insertLikeList", vo);
		sqlSession.commit();
		sqlSession.close();
		return cnt;
	}
}
