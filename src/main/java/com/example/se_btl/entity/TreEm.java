package com.example.se_btl.entity;

import com.example.se_btl.UI.MainUI;

import java.util.HashMap;
import java.util.Map;

public class TreEm {
    int id;
    String cccd;
    String maphanthuong;
    String hoten;
    String ngaysinh;
    String mpt_tre_em;
    String mpt_thanh_tich;
    int sl_pt_tre_em;
    int sl_pt_thanh_tich;
    String thanh_tich;
    String thong_ke_pt_te;
    String thong_ke_pt_tt;
    int tongTien = 0;
    Map giaphanthuong = new HashMap<String, Integer>();

    int tong_pt_tre_em = 0;
    int tong_pt_thanh_tich = 0;

    public int getTong_pt_thanh_tich() {
        return tong_pt_thanh_tich;
    }

    public int getTong_pt_tre_em() {
        return tong_pt_tre_em;
    }

    public Map getGiaphanthuong() {
        return giaphanthuong;
    }

    public String getThong_ke_pt_te() {
        return thong_ke_pt_te;
    }

    public String getThong_ke_pt_tt() {
        return thong_ke_pt_tt;
    }

    public String getThanh_tich() {
        return thanh_tich;
    }

    public int getSl_pt_thanh_tich() {
        return sl_pt_thanh_tich;
    }

    public int getSl_pt_tre_em() {
        return sl_pt_tre_em;
    }

    public TreEm(String cccd, String hoten, String ngaysinh, String mpt_tre_em, String mpt_thanh_tich, int sl_pt_tre_em, int sl_pt_thanh_tich, String thanh_tich){
        this.cccd = cccd;
        this.hoten = hoten;
        this.ngaysinh = ngaysinh;
        this.mpt_tre_em = mpt_tre_em;
        this.mpt_thanh_tich = mpt_thanh_tich;
        this.sl_pt_tre_em = sl_pt_tre_em;
        this.sl_pt_thanh_tich = sl_pt_thanh_tich;
        this.thanh_tich = thanh_tich;
        thong_ke_pt_te = String.format("%s (x%d)", MainUI.phanthuong.get(mpt_tre_em), sl_pt_tre_em);
        thong_ke_pt_tt = String.format("%s (x%d)", MainUI.phanthuong.get(mpt_thanh_tich), sl_pt_thanh_tich);
//        this.tong_pt_tre_em = sl_pt_tre_em*(int) giaphanthuong.get(mpt_tre_em);
//        this.tong_pt_thanh_tich = sl_pt_thanh_tich * (int)giaphanthuong.get(mpt_thanh_tich);

        this.tongTien =  sl_pt_thanh_tich * (int) MainUI.giaphanthuong.get(mpt_thanh_tich) + (int) MainUI.giaphanthuong.get(mpt_tre_em) * sl_pt_tre_em;
    }

    public float getTongTien() {
        return tongTien;
    }

    public String getMpt_thanh_tich() {
        return mpt_thanh_tich;
    }

    public String getMpt_tre_em() {
        return mpt_tre_em;
    }

    public int getId() {
        return id;
    }

    public String getCccd() {
        return cccd;
    }

    public String getHoten() {
        return hoten;
    }

    public String getNgaysinh() {
        return ngaysinh;
    }

    public String getMaphanthuong() {
        return maphanthuong;
    }
}
