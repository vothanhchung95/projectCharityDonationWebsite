package CharityDonation.Entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "account",  uniqueConstraints = {@UniqueConstraint(columnNames = {"email"})})
public class Account {
	@Id
	private int id;
	
	@Size(min = 5, max = 100, message = "Họ và tên có độ dài từ 5 đến 100 ký tự")
	private String username;
	
	@NotBlank(message = "Không được để trống trường này")
	@Size(max = 100, message = "Email có độ dài tối đa 100 ký tự")
	@Email(message = "Email không hợp lệ")
	private String email;
	@Size(min = 8, message = "Mật khẩu có độ dài tối thiểu 8 ký tự")
	private String password;

	private String phone;
	private String address;
	private int role;
	private String status;
	
	public Account() {
		super();
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
