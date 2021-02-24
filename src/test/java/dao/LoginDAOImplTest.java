package dao;

import entity.Login;
import org.junit.Before;
import org.junit.jupiter.api.BeforeEach;

import static org.junit.jupiter.api.Assertions.*;

class LoginDAOImplTest {
    LoginDAO loginDAO;
    @org.junit.jupiter.api.BeforeEach
    void setUp() throws ClassNotFoundException {
        loginDAO = new LoginDAOImpl();

    }


    @org.junit.jupiter.api.Test
    void authenticate() {
        Login validUser = new Login();
        validUser.setId(22);
        validUser.setUsername("MaradRoman");
        validUser.setName("Roma");
        validUser.setSurname("Marad");
        validUser.setEmail("maradroman@mail.com");
        validUser.setPassword("123456789");
        validUser.setIsBlocked("false");
        validUser.setType("admin");

        assertNotNull(loginDAO.authenticate(validUser));
    }
}