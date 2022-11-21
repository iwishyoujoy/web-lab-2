package ru.iwishyoujoy.web_lab_2.model;

public class Dot {
    private float x;
    private float y;
    private float r;
    private String status; //indicate if dot is in the area
    private String time;
    private long scriptTime;

    public Dot(float x, float y, float r, String time, long scriptTime, String status) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.time = time;
        this.scriptTime = scriptTime;
        this.status = status;
    }

    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public float getR() {
        return r;
    }

    public String getStatus() {
        return status;
    }

    public String getTime() {
        return time;
    }

    public long getScriptTime() {
        return scriptTime;
    }

    public void setX(float x) {
        this.x = x;
    }

    public void setY(float y) {
        this.y = y;
    }

    public void setR(float r) {
        this.r = r;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public void setScriptTime(long scriptTime) {
        this.scriptTime = scriptTime;
    }
}