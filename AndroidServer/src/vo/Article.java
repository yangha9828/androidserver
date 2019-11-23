package vo;

import java.sql.Date;

import org.mindrot.jbcrypt.BCrypt;

public class Article {
	public int num;
	public String id;
	public String content;
	public Date regdate;
	
	public int good;
	public int dislike;
}
