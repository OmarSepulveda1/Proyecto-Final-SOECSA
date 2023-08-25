package cl.Main.Soecsa.Ltda.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "post")
@PrimaryKeyJoinColumn(columnDefinition = "id")
public class Post {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@Column(name = "title")
    private String title;
    @Column(name = "publication_date")
    private LocalDate publicationDate;
    @Column(name = "image_url")
    private String imageUrl;
    @Column(name = "text")
    private String text;
    
    public Post() {
    	super();
    }
    
  
	public Post(Long id, String title, LocalDate publicationDate, String imageUrl, String text) {
		super();
		this.id = id;
		this.title = title;
		this.publicationDate = publicationDate;
		this.imageUrl = imageUrl;
		this.text = text;
	}


	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}


	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}


	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}


	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}


	/**
	 * @return the publicationDate
	 */
	public LocalDate getPublicationDate() {
		return publicationDate;
	}


	/**
	 * @param publicationDate the publicationDate to set
	 */
	public void setPublicationDate(LocalDate publicationDate) {
		this.publicationDate = publicationDate;
	}


	/**
	 * @return the imageUrl
	 */
	public String getImageUrl() {
		return imageUrl;
	}


	/**
	 * @param imageUrl the imageUrl to set
	 */
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}


	/**
	 * @param text the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
    
	
}
