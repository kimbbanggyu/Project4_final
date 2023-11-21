package com.example.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.code.MenuVO;
import com.example.menu_project4.JDBCUtill;

public class MenuDAO {

	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;


	private final String MENU_INSERT = "insert into MENU (menu, img, price, origin,review) values (?,?,?,?,?)";
	private final String MENU_UPDATE = "update MENU set menu=?, img=? , price=?, origin=?,review=? where id=?";
	private final String MENU_DELETE = "delete from MENU  where id=?";
	private final String MENU_GET = "select * from MENU  where id=?";
	private final String MENU_LIST = "select * from MENU order by id desc";

	public int insertBoard(MenuVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtill.getConnection();
			stmt = conn.prepareStatement(MENU_INSERT);
			stmt.setString(1, vo.getMenu());
			stmt.setString(2, vo.getPhoto());
			stmt.setString(3, vo.getPrice());
			stmt.setString(4, vo.getOrigin());
			stmt.setString(5, vo.getReview());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteBoard(MenuVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtill.getConnection();
			stmt = conn.prepareStatement(MENU_DELETE);
			stmt.setInt(1, vo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateBoard(MenuVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtill.getConnection();
			stmt = conn.prepareStatement(MENU_UPDATE);
			stmt.setString(1, vo.getMenu());
			stmt.setString(2, vo.getPhoto());
			stmt.setString(3, vo.getPrice());
			stmt.setString(4, vo.getOrigin());
			stmt.setString(5, vo.getReview());
			stmt.setInt(6, vo.getId());
			System.out.println(vo.getId());

			System.out.println(vo.getMenu() + "-" + vo.getPhoto()+ "-" + vo.getPrice() + "-" + vo.getOrigin() + "-" + vo.getReview() + "-" + vo.getId());
			stmt.executeUpdate();
			return 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public MenuVO getBoard(int seq) {
		MenuVO one = new MenuVO();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			conn = JDBCUtill.getConnection();
			stmt = conn.prepareStatement(MENU_GET);
			stmt.setInt(1, seq);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setId(rs.getInt("id"));
				one.setMenu(rs.getString("menu"));
				one.setPhoto(rs.getString("img"));
				one.setPrice(rs.getString("price"));
				one.setOrigin(rs.getString("origin"));
				one.setReview(rs.getString("review"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	public String getPhotoFilename(int sid){
		String filename = null;
		try{
			conn = JDBCUtill.getConnection();
			stmt = conn.prepareStatement(MENU_GET);
			stmt.setInt(1,sid);
			System.out.println("id2 = " +sid);
			rs = stmt.executeQuery();
			if(rs.next()){
				filename = rs.getString("img");

			}
			rs.close();
		} catch (SQLException e) {
            throw new RuntimeException(e);
        }
		System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
		return filename;
    }

	public List<MenuVO> getBoardList(){
		List<MenuVO> list = new ArrayList<MenuVO>();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			conn = JDBCUtill.getConnection();
			stmt = conn.prepareStatement(MENU_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MenuVO one = new MenuVO();
				one.setId(rs.getInt("id"));
				one.setMenu(rs.getString("menu"));
				one.setPhoto(rs.getString("img"));
				one.setPrice(rs.getString("price"));
				one.setOrigin(rs.getString("origin"));
				one.setReview(rs.getString("review"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
