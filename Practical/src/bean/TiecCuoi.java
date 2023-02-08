package bean;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TiecCuoi {
    private int id;
    private Date ngayToChuc;
    private String tenCoDau;
    private String tenChuRe;
    private int soLuongBan;
    private int donGia;
    private DichVuDiKem dichVuDiKem;
    private int tienNoDatCoc;
    private int tienNoThanhToan;
    private Date ngayDatCoc;
    private Date ngayThanhToan;
    private String ghiChu;
    private String trangThai;

    public TiecCuoi() {
    }

    public TiecCuoi(int id,
                    Date ngayToChuc,
                    String tenCoDau,
                    String tenChuRe,
                    int soLuongBan,
                    int donGia,
                    int idDichVuDiKem,
                    String tenDichVu,
                    int giaDichVu,
                    int tienNoDatCoc,
                    int tienNoThanhToan,
                    Date ngayDatCoc,
                    Date ngayThanhToan,
                    String ghiChu,
                    String trangThai) {
        this.id = id;
        this.ngayToChuc = ngayToChuc;
        this.tenCoDau = tenCoDau;
        this.tenChuRe = tenChuRe;
        this.soLuongBan = soLuongBan;
        this.donGia = donGia;
        this.dichVuDiKem = new DichVuDiKem(idDichVuDiKem, tenDichVu, giaDichVu);
        this.tienNoDatCoc = tienNoDatCoc;
        this.tienNoThanhToan = tienNoThanhToan;
        this.ngayDatCoc = ngayDatCoc;
        this.ngayThanhToan = ngayThanhToan;
        this.ghiChu = ghiChu;
        this.trangThai = trangThai;
    }

    public DichVuDiKem getDichVuDiKem() {
        return dichVuDiKem;
    }

    public void setDichVuDiKem(DichVuDiKem dichVuDiKem) {
        this.dichVuDiKem = dichVuDiKem;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgayToChuc() {
        return ngayToChuc;
    }

    public void setNgayToChuc(Date ngayToChuc) {
        this.ngayToChuc = ngayToChuc;
    }

    public String getTenCoDau() {
        return tenCoDau;
    }

    public void setTenCoDau(String tenCoDau) {
        this.tenCoDau = tenCoDau;
    }

    public String getTenChuRe() {
        return tenChuRe;
    }

    public void setTenChuRe(String tenChuRe) {
        this.tenChuRe = tenChuRe;
    }

    public int getSoLuongBan() {
        return soLuongBan;
    }

    public void setSoLuongBan(int soLuongBan) {
        this.soLuongBan = soLuongBan;
    }

    public int getDonGia() {
        return donGia;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }

    public int getTienNoDatCoc() {
        return tienNoDatCoc;
    }

    public void setTienNoDatCoc(int tienNoDatCoc) {
        this.tienNoDatCoc = tienNoDatCoc;
    }

    public int getTienNoThanhToan() {
        return tienNoThanhToan;
    }

    public void setTienNoThanhToan(int tienNoThanhToan) {
        this.tienNoThanhToan = tienNoThanhToan;
    }

    public Date getNgayDatCoc() {
        return ngayDatCoc;
    }

    public void setNgayDatCoc(Date ngayDatCoc) {
        this.ngayDatCoc = ngayDatCoc;
    }

    public Date getNgayThanhToan() {
        return ngayThanhToan;
    }

    public void setNgayThanhToan(Date ngayThanhToan) {
        this.ngayThanhToan = ngayThanhToan;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getNgayToChucString() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(ngayToChuc);
    }
}

