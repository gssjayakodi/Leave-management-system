package model;

import java.sql.Date;

public class LeaveRequest {
    private int id;
    private String username;
    private Date fromDate;
    private Date toDate;
    private String reason;
    private String status;

    public LeaveRequest(int id, String username, Date fromDate, Date toDate, String reason, String status) {
        this.id = id;
        this.username = username;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.reason = reason;
        this.status = status;
    }

    // Getters and setters

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public String getReason() {
        return reason;
    }

    public String getStatus() {
        return status;
    }
}
