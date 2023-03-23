package CharityDonation.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Entity
@Table(name = "categories",  uniqueConstraints = {@UniqueConstraint(columnNames = {"name"})})
public class Categories {
	@Id
	private int id;
	@Column(name = "name", unique = true)
	@Size(min = 5, max = 200, message = "Tên Danh mục có độ dài từ 5 đến 200 ký tự")
	private String name;
	@NotBlank(message = "Không được để trống trường này")
	@Size(max = 500, message = "Mô tả có độ dài tối đa 500 ký tự")	
	private String description;	
	private String status;
	
	public Categories() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
