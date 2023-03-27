package dat.backend.model.persistence;

import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;

import javax.xml.crypto.Data;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

class UserMapper {
    static User login(String email, String password, ConnectionPool connectionPool) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        User user = null;

        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("user_id");
                    String role = rs.getString("role");
                    float wallet = rs.getFloat("wallet");
                    user = new User(id, email, password, role, wallet);
                } else {
                    throw new DatabaseException("Wrong email or password");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Error logging in. Something went wrong with the database");
        }
        return user;
    }

    static User createUser(String email, String password, String role, ConnectionPool connectionPool) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        User user;
        String sql = "insert into user (email, password, role, wallet) values (?,?,?,?)";
        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);
                ps.setString(3, role);
                ps.setFloat(4, 0);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1) {
                    user = new User(email, password, role);
                } else {
                    throw new DatabaseException("The user with email = " + email + " could not be inserted into the database");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, "Could not insert user into database");
        }
        return user;
    }

    static boolean UserExists(String email, ConnectionPool connectionPool) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        String sql = "SELECT user_id FROM user WHERE email=?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, email);

                ResultSet res = preparedStatement.executeQuery();

                return res.next();
            }
        } catch (SQLException throwables) {
            throw new DatabaseException(throwables, throwables.getMessage());
        }
    }

    static List<User> getAll(ConnectionPool connectionPool) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        String sql = "SELECT * FROM user";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

                ResultSet res = preparedStatement.executeQuery();
                List<User> userList = new ArrayList<>();
                while (res.next()) {
                    int userid = res.getInt("user_id");
                    String email = res.getString("email");
                    String password = res.getString("password");
                    String role = res.getString("role");
                    int wallet = res.getInt("wallet");
                    User user = new User(userid, email, password, role, wallet);
                    userList.add(user);
                }

                return userList;
            }
        } catch (SQLException throwables) {
            throw new DatabaseException(throwables, throwables.getMessage());
        }
    }

    static boolean editWallet(float wallet, int id, ConnectionPool connectionPool) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        User user = null;
        String sql = "UPDATE user SET wallet = ? WHERE user_id = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setFloat(1, wallet);
                preparedStatement.setInt(2, id);
                int rs = preparedStatement.executeUpdate();
                if (rs == 1) {
                    return true;
                } else {
                    throw new DatabaseException("Something went wrong");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex, ex.getMessage());
        }
    }

    static User getUser(int id, ConnectionPool connectionPool) throws DatabaseException {
        String sql = "SELECT * FROM user WHERE user_id=?";

        try (Connection connection = connectionPool.getConnection()){
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String email = rs.getString("email");
                String pw = rs.getString("password");
                String role = rs.getString("role");
                int wallet = rs.getInt("wallet");

                return new User(id, email, pw, role, wallet);
            }
        } catch (SQLException throwables) {
            throw new DatabaseException(throwables.getMessage());
        }
        return null;
    }
}

