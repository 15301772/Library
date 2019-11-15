package com.pojo;

public class Bill {
    Integer id;
    String name;
    String writer;
    String publishe;
    String press;
    User user;


    @Override
    public String toString() {
        return "Bill{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", writer='" + writer + '\'' +
                ", publishe='" + publishe + '\'' +
                ", press='" + press + '\'' +
                ", user=" + user +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getPublishe() {
        return publishe;
    }

    public void setPublishe(String publishe) {
        this.publishe = publishe;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public User getUser() { return user; }

    public void setUser(User user) { this.user = user; }
}
