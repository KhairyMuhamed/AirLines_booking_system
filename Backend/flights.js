const pool = require("./database");




class customersOperations {
    async createcustomers(customers) {
        try {
            const connection = await pool.connect();
            const result = await connection.query(
                "INSERT INTO customers (cust_ID, fname, lname, gender, age, contact_add, cust_email ,cust_pass) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *",
                [
                    customers.cust_ID,
                    customers.fname,
                    customers.lname,
                    customers.gender,
                    customers.age,
                    customers.contact_add,
                    customers.cust_email,
                    customers.cust_pass
                ]
            );
            connection.release();
            return result.rows[0];
        } catch (error) {
            throw error;
        }
    }
}    
exports.customersOperations=customersOperations;




class transactionOperations {
    async createTransactions(transaction) {
        try {
            const connection = await pool.connect();
            const result = await connection.query(
                "INSERT INTO transactions (trans_ID, trans_name, res_ID, schedule_ID, ticket_ID, trans_date, report_ID) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
                [
                    transaction.trans_ID,
                    transaction.trans_name,
                    transaction.res_ID,
                    transaction.schedule_ID,
                    transaction.ticket_ID,
                    transaction.trans_date,
                    transaction.report_ID
                ]
            );
            connection.release();
            return result.rows[0];
        } catch (error) {
            throw error;
        }
    }
        
    
    
    async delete_transaction_ById(trans_ID) {
        try {
            const connection = await pool.connect();
            const result = await connection.query(
              "Delete From transactions where trans_ID = $1",
              [trans_ID]
            );
            connection.release();
            return result;
        } catch (error) {
            throw error;
        }
    }

    
    
    async getAlltransactions() {
        try {
            const connection = await pool.connect();
            const result = await connection.query(
                  "SELECT * FROM transactions Order by trans_date"
            );
            connection.release();
            return result.rows;
        } catch (error) {
            throw error;
        }
    }
    
    
    
    
    async get_transaction_ById(trans_ID) {
        try {
            const connection = await pool.connect();
            const result = await connection.query(
              "SELECT * FROM Trips WHERE trans_ID = $1 ",
              [trans_ID]
            );
            connection.release();
            return result;
        } catch (error) {
            throw error;
        }
    }
        

}
exports.transactionOperations = transactionOperations;





class reportsOperations {
    async createreports(reports) {
        try {
            const connection = await pool.connect();
            const result = await connection.query(
                "INSERT INTO reports (report_ID, trans_id, admin_ID,res_ID, report_date,No_tickets, income) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *",
                [
                    reports.report_ID,
                    reports.trans_id,
                    reports.admin_ID,
                    reports.res_ID,
                    reports.report_date,
                    reports.No_tickets,
                    reports.income
        
                ]
            );
            connection.release();
            return result.rows[0];
        } catch (error) {
            throw error;
        }
    }
        

}
exports.reportsOperations = reportsOperations;





class tickets_3Operations {
    async createtickets_3(tickets_3) {
        try {
            const connection = await pool.connect();
            const result = await connection.query(
                "INSERT INTO tickets_3 (ticket_ID, ticket_num, date_flight, time_flight, time_land, destination, trip_type ,price,date_land,res_ID) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10) RETURNING *",
                [
                    tickets_3.ticket_ID,
                    tickets_3.ticket_num,
                    tickets_3.date_flight,
                    tickets_3.time_flight,
                    tickets_3.time_land,
                    tickets_3.destination,
                    tickets_3.trip_type,
                    tickets_3.price,
                    tickets_3.date_land,
                    tickets_3.res_ID

                ]
            );
            connection.release();
            return result.rows[0];
        } catch (error) {
            throw error;
        }
    }
}    
exports.tickets_3Operations=tickets_3Operations;
