package dat.backend.model.persistence;

import dat.backend.model.entities.*;
import dat.backend.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderMapper {
    static List<Order> getAllOrders(ConnectionPool connectionPool) throws DatabaseException {
        List<Order> orders = new ArrayList<>();

        String sql = "SELECT * FROM orders";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("order_id");
                    int user_id = rs.getInt("user_id");
                    User user = UserMapper.getUser(user_id, connectionPool);

                    orders.add(new Order(id, user));
                }
            }

            return getOrderItems(orders, connectionPool);
        } catch (SQLException ex) {
            throw new DatabaseException(ex.getMessage());
        }
    }

    static List<Order> getUserOrders(int user_id, ConnectionPool connectionPool) throws DatabaseException {
        List<Order> orders = new ArrayList<>();

        String sql = "SELECT * FROM orders WHERE user_id=?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {

                ps.setInt(1, user_id);

                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("order_id");
                    User user = UserMapper.getUser(user_id, connectionPool);

                    orders.add(new Order(id, user));
                }
            }

            return getOrderItems(orders, connectionPool);
        } catch (SQLException throwables) {
            throw new DatabaseException(throwables.getMessage());
        }
    }

    private static List<Order> getOrderItems(List<Order> orders, ConnectionPool connectionPool) throws SQLException, DatabaseException {
        String sql;
        for (Order order : orders) {
            sql = "SELECT * FROM orderlinking WHERE order_id=?";
            try (Connection connection = connectionPool.getConnection()) {
                try (PreparedStatement ps = connection.prepareStatement(sql)) {
                    ps.setInt(1, order.getId());

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
                        int toppingId = rs.getInt("topping_id");
                        int bottomId = rs.getInt("bottom_id");
                        int amount = rs.getInt("amount");

                        Topping topping = getTopping(toppingId, connectionPool);
                        Bottom bottom = getBottom(bottomId, connectionPool);

                        order.addItem(new OrderItem(bottom, topping, amount));
                    }
                }
            }
        }

        return orders;
    }

    static Order createOrder(Order newOrder, ConnectionPool connectionPool) throws DatabaseException {
        if (UserMapper.makeTransaction(newOrder.getCustomer(), newOrder.getPrice(), connectionPool)) {
            String sql = "INSERT INTO orders (user_id) VALUES (?)";
            int orderId = 0;

            try (Connection connection = connectionPool.getConnection()) {
                try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    ps.setInt(1, newOrder.getCustomer().getId());

                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected == 0) {
                        throw new DatabaseException("Error creating new order. 0 rows affected");
                    }

                    try (ResultSet keys = ps.getGeneratedKeys()) {
                        if (keys.next()) {
                            orderId = keys.getInt(1);
                        } else {
                            throw new DatabaseException("Adding order to database failed, no ID obtained");
                        }
                    }
                }

                for (OrderItem item : newOrder.getOrderItems()) {
                    sql = "INSERT INTO orderlinking (order_id, topping_id, bottom_id, amount) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement ps = connection.prepareStatement(sql, Statement.NO_GENERATED_KEYS)) {
                        ps.setInt(1, orderId);
                        ps.setInt(2, item.getTopping().getId());
                        ps.setInt(3, item.getBottom().getId());
                        ps.setInt(4, item.getAmount());

                        int rowsAffected = ps.executeUpdate();
                        if (rowsAffected == 0) {
                            throw new DatabaseException("Failure adding order item to orderlinking table");
                        }
                    }
                }

                return new Order(orderId, newOrder.getCustomer(), newOrder.getOrderItems());
            } catch (SQLException throwables) {
                throwables.printStackTrace();
                throw new DatabaseException(throwables.getMessage());
            }
        } else {
            throw new DatabaseException("Insufficient funds!");
        }
    }

    static List<Bottom> getAllBottoms(ConnectionPool connectionPool) throws DatabaseException {
        List<Bottom> bottoms = new ArrayList<>();
        String sql = "SELECT * FROM bottoms";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet res = ps.executeQuery();

                while (res.next()) {
                    int id = res.getInt("bottom_id");
                    String flavor = res.getString("flavor");
                    float price = res.getFloat("price");

                    bottoms.add(new Bottom(id, flavor, price));
                }

            } catch (SQLException throwables) {
                throw new DatabaseException(throwables.getMessage());
            }
        } catch (SQLException throwables) {
            throw new DatabaseException(throwables.getMessage());
        }

        return bottoms;
    }

    public static List<Topping> getAllToppings(ConnectionPool connectionPool) throws DatabaseException {
        List<Topping> toppings = new ArrayList<>();
        String sql = "SELECT * FROM toppings";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet res = ps.executeQuery();

                while (res.next()) {
                    int id = res.getInt("topping_id");
                    String flavor = res.getString("flavor");
                    float price = res.getFloat("price");

                    toppings.add(new Topping(id, flavor, price));
                }

            } catch (SQLException throwables) {
                throw new DatabaseException(throwables.getMessage());
            }
        } catch (SQLException throwables) {
            throw new DatabaseException(throwables.getMessage());
        }

        return toppings;
    }

    public static Bottom getBottom(int bottomId, ConnectionPool connectionPool) throws DatabaseException {
        String sql = "SELECT * FROM bottoms WHERE bottom_id=?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, bottomId);

                ResultSet res = ps.executeQuery();

                res.next();

                int id = res.getInt("bottom_id");
                String flavor = res.getString("flavor");
                float price = res.getFloat("price");

                return new Bottom(id, flavor, price);

            } catch (SQLException throwables) {
                throw new DatabaseException(throwables.getMessage());
            }
        } catch (SQLException throwables) {
            throw new DatabaseException(throwables.getMessage());
        }
    }

    public static Topping getTopping(int toppingId, ConnectionPool connectionPool) throws DatabaseException {
        String sql = "SELECT * FROM toppings WHERE topping_id=?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, toppingId);

                ResultSet res = ps.executeQuery();

                res.next();

                int id = res.getInt("topping_id");
                String flavor = res.getString("flavor");
                float price = res.getFloat("price");

                return new Topping(id, flavor, price);

            } catch (SQLException throwables) {
                throw new DatabaseException(throwables.getMessage());
            }
        } catch (SQLException throwables) {
            throw new DatabaseException(throwables.getMessage());
        }
    }

    static void deleteOrder(int currentOrder, ConnectionPool connectionPool) throws DatabaseException {
        String sql = "DELETE FROM orderlinking WHERE order_id = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, currentOrder);

                ps.executeUpdate();
            }
            sql = "DELETE FROM orders WHERE order_id = ?";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, currentOrder);

                int rowsAffected = ps.executeUpdate();

                if (rowsAffected == 0) {
                    throw new DatabaseException("Error deleting order. 0 rows affected in orders");
                }
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
            throw new DatabaseException(throwables.getMessage());
        }
    }
}

