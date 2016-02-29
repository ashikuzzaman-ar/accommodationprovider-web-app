package com.models;

public class AdvertisementModel {

    private String posterID;
    private String adress;
    private String type;
    private String vacancy;
    private String deadline;
    private String rent;
    private String utility;
    private String facility;
    private int postID ;

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public String getPosterID() {
        return posterID;
    }

    public void setPosterID(String posterID) {
        this.posterID = posterID;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getVacancy() {
        return vacancy;
    }

    public void setVacancy(String vacancy) {
        this.vacancy = vacancy;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getRent() {
        return rent;
    }

    public void setRent(String rent) {
        this.rent = rent;
    }

    public String getUtility() {
        return utility;
    }

    public void setUtility(String utility) {
        this.utility = utility;
    }

    public String getFacility() {
        return facility;
    }

    public void setFacility(String facility) {
        this.facility = facility;
    }

    public void setNull() {

        try {
            this.setPosterID(null);
            this.setAdress(null);
            this.setType(null);
            this.setVacancy(null);
            this.setDeadline(null);
            this.setRent(null);
            this.setUtility(null);
            this.setFacility(null);
        } catch (Exception e) {
        }
    }
}
