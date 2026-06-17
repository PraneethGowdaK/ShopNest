package com.shopNest.product;

import java.io.Serializable;

/**
 * Represents a product in the store.
 * Serializable so it can be stored in a session-backed Cart.
 */
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    private int    pid;
    private String pname;
    private int    pprice;
    private String pimg;

    public Product(int pid, String pname, int pprice, String pimg) {
        this.pid    = pid;
        this.pname  = pname;
        this.pprice = pprice;
        this.pimg   = pimg;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getPprice() {
        return pprice;
    }

    public void setPprice(int pprice) {
        this.pprice = pprice;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
    }
}
