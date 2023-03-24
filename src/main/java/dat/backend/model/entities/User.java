package dat.backend.model.entities;

import java.util.Objects;

public class User
{
    private int id;
    private String username;
    private String password;
    private String role;
    private float wallet;

    public User(String username, String password, String role)
    {
        this.username = username;
        this.password = password;
        this.role = role;
        this.wallet = 0.0f;
    }

    public User(int id, String username, String password, String role, float wallet) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.wallet = wallet;
    }

    public int getId() {
        return id;
    }

    public float getWallet() {
        return wallet;
    }

    public void setWallet(float wallet) {
        this.wallet = wallet;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getRole()
    {
        return role;
    }

    public void setRole(String role)
    {
        this.role = role;
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (!(o instanceof User)) return false;
        User user = (User) o;
        return getUsername().equals(user.getUsername()) && getPassword().equals(user.getPassword()) &&
                getRole().equals(user.getRole());
    }

    @Override
    public int hashCode()
    {
        return Objects.hash(getUsername(), getPassword(), getRole());
    }

    @Override
    public String toString() {
        return "User: " +
                " UserID: " + id +
                ", Email: " + username +
                ", Password: " + password +
                ", Role: " + role +
                ", Wallet: " + wallet;
    }
}
