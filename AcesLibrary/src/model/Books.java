/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author user
 */
public class Books {

    private String book_title;
    private String Author;
    private String publisher;
    private String Description;

    private String genre;
    private String date_added;
    private String status;
    private int total_copies;

    public String getBook_title() {
        return book_title;
    }

    public String getAuthor() {
        return Author;
    }

    public String getPublisher() {
        return publisher;
    }

    public String getDescription() {
        return Description;
    }

    public String getGenre() {
        return genre;
    }

    public String getDate_added() {
        return date_added;
    }

    public String getStatus() {
        return status;
    }

    public int getTotal_copies() {
        return total_copies;
    }

    public void setBook_title(String book_title) {
        this.book_title = book_title;
    }

    public void setAuthor(String Author) {
        this.Author = Author;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setDate_added(String date_added) {
        this.date_added = date_added;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTotal_copies(int total_copies) {
        this.total_copies = total_copies;
    }

}
