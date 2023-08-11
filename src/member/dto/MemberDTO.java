package member.dto;

import java.util.Date;

public class MemberDTO {

	private String memberId;
	private String memberNm;
	private String passwd;
	private String imgNm;
	private String sex;
	private String birthDt;
	private String hp;
	private String smsRecvAgreeYn;
	private String email;
	private String emailRecvAgreeYn;
	private String zipcode;
	private String roadAddress;
	private String jibunAddress;
	private String namujiAddress;
	private Date joinDt;
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberNm() {
		return memberNm;
	}
	public void setMemberNm(String memberNm) {
		this.memberNm = memberNm;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getImgNm() {
		return imgNm;
	}
	public void setImgNm(String imgNm) {
		this.imgNm = imgNm;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getSmsRecvAgreeYn() {
		return smsRecvAgreeYn;
	}
	public void setSmsRecvAgreeYn(String smsRecvAgreeYn) {
		this.smsRecvAgreeYn = smsRecvAgreeYn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailRecvAgreeYn() {
		return emailRecvAgreeYn;
	}
	public void setEmailRecvAgreeYn(String emailRecvAgreeYn) {
		this.emailRecvAgreeYn = emailRecvAgreeYn;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getNamujiAddress() {
		return namujiAddress;
	}
	public void setNamujiAddress(String namujiAddress) {
		this.namujiAddress = namujiAddress;
	}
	public Date getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(Date joinDt) {
		this.joinDt = joinDt;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [memberId=" + memberId + ", memberNm=" + memberNm + ", passwd=" + passwd + ", imgNm=" + imgNm
				+ ", sex=" + sex + ", birthDt=" + birthDt + ", hp=" + hp + ", smsRecvAgreeYn=" + smsRecvAgreeYn
				+ ", email=" + email + ", emailRecvAgreeYn=" + emailRecvAgreeYn + ", zipcode=" + zipcode
				+ ", roadAddress=" + roadAddress + ", jibunAddress=" + jibunAddress + ", namujiAddress=" + namujiAddress
				+ ", joinDt=" + joinDt + "]";
	}
}
