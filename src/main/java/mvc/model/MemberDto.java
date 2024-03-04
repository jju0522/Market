package mvc.model;

public class MemberDto {
	
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String mail;
	private String phone;
	private String regist_day;
	
	public MemberDto() {
		super();
	}
	
	public MemberDto(String id, String password, String name, String nickname, String mail, String phoney, String regist_day) {
		super();
		this.setId(id);
		this.setPassword(password);
		this.setName(name);
		this.setNickname(nickname);
		this.setMail(mail);
		this.setRegist_day(regist_day);
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRegist_day() {
		return regist_day;
	}

	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}
}
