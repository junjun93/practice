package dao.impl;

import dao.TrainDao;
import entity.Train;
import util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author junjun
 * @date 2018/7/16 22:01:28
 **/
public class TrainDaoImpl implements TrainDao {

    /**
     * 查看所有车次信息
     * */
    @Override
    public List<Train> getAllTrain() {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet result = null;

        List<Train> list = new ArrayList<>();
        conn = JdbcUtil.getConnection();
        String sql = "select * from train";

        try{
            preparedStatement = conn.prepareStatement(sql);
            result = preparedStatement.executeQuery();
            //填充数据
            while(result.next()){
                Train train = new Train();
                train.setTrainNo(result.getString("train_no"));
                train.setStartStation(result.getString("start_station"));
                train.setArrivalStation(result.getString("arrival_station"));
                train.setStartTime(result.getString("start_time"));
                train.setArrivalTime(result.getString("arrival_time"));
                train.setType(result.getString("type"));
                train.setRuntime(result.getString("runtime"));
                list.add(train);
            }
            //后期再看代码
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, preparedStatement, null);
        }
        return list;
    }


    /**
     * 删除车次信息
     * */
    @Override
    public void delTrain(String trainNo) {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet result = null;

        conn = JdbcUtil.getConnection();
        String sql = "delete from train where train_no = ?";
        try {
            preparedStatement = conn.prepareStatement(sql);
            preparedStatement.setString(1, trainNo);
            int count = preparedStatement.executeUpdate();
            if(count > 0){
                System.out.println("删除成功！");
            } else {
                System.out.println("删除失败！");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, preparedStatement, null);
        }
    }

    /**
     * 查询指定车次信息
     * */
    @Override
    public Train findTrain(String trainNo) {
        Connection conn = null;
        PreparedStatement preparedStatement = null;
        ResultSet result = null;
        Train train = new Train();

        conn = JdbcUtil.getConnection();
        String sql = "select * from train where train_no = ?";
        try {
            preparedStatement = conn.prepareStatement(sql);
            result = preparedStatement.executeQuery();
            while(result.next()){
                train.setTrainNo(result.getString("train_no"));
                train.setStartStation(result.getString("start_station"));
                train.setArrivalStation(result.getString("arrival_station"));
                train.setStartTime(result.getString("start_time"));
                train.setArrivalTime(result.getString("arrival_time"));
                train.setType(result.getString("type"));
                train.setRuntime(result.getString("runtime"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn, preparedStatement, null);
        }
        return train;
    }
}
