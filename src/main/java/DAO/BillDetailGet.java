package DAO;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;
import model.BillDetail;


public class BillDetailGet {

    public void insertBillDetail(BillDetail bd) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "INSERT INTO bill_detail VALUES(?,?,?,?,?)";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setLong(1, bd.getBillDetailID());
        ps.setLong(2, bd.getBillID());
        ps.setLong(3, bd.getProductID());
        ps.setDouble(4, bd.getPrice());
        ps.setInt(5, bd.getQuantity());
        ps.executeUpdate();
    }
    
    public static ArrayList<BillDetail> getProductNameByBillID(long bill_id) {
        try {
            Connection connection = DBConnect.getConnecttion();
            String sql = "SELECT * FROM bill_detail WHERE bill_id = '" + bill_id + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<BillDetail> list = new ArrayList<>();
            while (rs.next()) {
                BillDetail billdetail = new BillDetail();
                billdetail.setProductID(rs.getLong("product_id"));   
                billdetail.setQuantity(rs.getInt("quantity"));
                billdetail.setPrice(rs.getDouble("price"));
                list.add(billdetail);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(BillDetailGet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static void main(String[] args) throws SQLException {
        new BillDetailGet().insertBillDetail(new BillDetail(0, 0, 0, 0, 0));
    }
    public static int amount(long bill_id, long product_id) throws SQLException{
        Connection connection = DBConnect.getConnecttion();
        String sql = " SELECT quantity FROM bill_detail where product_id = '"+ product_id + "' and bill_id = '"+bill_id +"'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt("quantity");
        }
        return count;  
    } 

}
