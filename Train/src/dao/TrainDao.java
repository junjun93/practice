package dao;

import entity.Train;

import java.util.List;

/**
 * @author junjun
 * @date 2018/7/16 21:52:53
 **/
public interface TrainDao {

    /**
     * 查看所有车次信息
     * */
    List<Train> getAllTrain();

    /**
     * 删除车次信息
     * */
    void delTrain(String trainNo);

    /**
     * 查询指定车次信息
     * */
    Train findTrain(String trainNo);
}
