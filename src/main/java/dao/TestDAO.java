package dao;

import entity.Test;

import java.util.List;

public interface TestDAO {
    List<Test> get();
    Test get(int id);
    boolean save(Test test);
    boolean delete(Test test);
}
