-- add data
INSERT INTO customers (customer_id, customer_name, reg_date) VALUES
(1, 'Aarav', '2022-08-28'),
(2, 'Vihaan', '2021-05-17'),
(3, 'Ananya', '2023-10-01'),
(4, 'Ishaan', '2023-10-27'),
(5, 'Meera', '2023-08-24'),
(6, 'Riya', '2020-08-25'),
(7, 'Krish', '2020-08-30'),
(8, 'Aditya', '2023-06-29'),
(9, 'Priya', '2020-12-09'),
(10, 'Kabir', '2021-02-15'),
(11, 'Sanya', '2020-06-14'),
(12, 'Vivaan', '2020-12-15'),
(13, 'Simran', '2022-09-06'),
(14, 'Arjun', '2022-08-06'),
(15, 'Dev', '2021-04-29'),
(18, 'Kavya', '2021-08-25'),
(19, 'Siddharth', '2022-11-14'),
(20, 'Tara', '2021-07-03'),
(21, 'Neha', '2023-10-24'),
(22, 'Aryan', '2023-10-09'),
(23, 'Dhruv', '2023-09-20'),
(24, 'Myra', '2024-12-13'),
(25, 'Naina', '2024-01-07'),
(26, 'Soham', '2024-01-01'),
(27, 'Alia', '2023-07-05'),
(28, 'Meena', '2023-11-30'),
(29, 'Pari' , '2023-12-01');

truncate table customers cascade;
truncate table orders;


select * from customers

INSERT INTO restaurants (restaurant_id, restaurant_name, city, opening_hours) VALUES
(1, 'Tandoori Nights', 'Delhi', '7:00 PM - 11:00 PM'),
(2, 'Spice Symphony', 'Mumbai', '6:30 PM - 10:30 PM'),
(3, 'Curry Junction', 'Bangalore', '7:00 PM - 11:30 PM'),
(4, 'Saffron Spice', 'Kolkata', '6:00 PM - 10:00 PM'),
(5, 'Masala House', 'Chennai', '7:00 PM - 11:00 PM'),
(6, 'Flavors of Punjab', 'Amritsar', '5:00 PM - 10:00 PM'),
(7, 'Royal Rasoi', 'Jaipur', '6:30 PM - 11:00 PM'),
(8, 'Dilli Zaika', 'Lucknow', '7:00 PM - 11:30 PM'),
(9, 'Annapurna Bhavan', 'Hyderabad', '6:00 PM - 10:30 PM'),
(11, 'Rajdhani Rasoi', 'Ahmedabad', '7:00 PM - 11:00 PM'),
(12, 'Biryani Corner', 'Hyderabad', '6:00 PM - 11:30 PM'),
(13, 'Dakshin Delight', 'Chennai', '6:30 PM - 10:30 PM'),
(14, 'The Spice Hub', 'Pune', '7:00 PM - 11:30 PM'),
(15, 'Zayka Mahal', 'Kanpur', '6:00 PM - 10:00 PM'),
(16, 'Heritage Haveli', 'Udaipur', '6:30 PM - 11:00 PM'),
(17, 'Garam Masala', 'Surat', '7:00 PM - 11:00 PM'),
(18, 'Bombay Bistro', 'Mumbai', '6:30 PM - 11:30 PM'),
(19, 'Taste of Bengal', 'Kolkata', '7:00 PM - 11:30 PM'),
(20, 'Punjabi Tadka', 'Ludhiana', '5:00 PM - 10:30 PM'),
(21, 'Nawabi Zaika', 'Lucknow', '7:00 PM - 11:30 PM'),
(22, 'The Curry Palace', 'Delhi', '6:00 PM - 10:30 PM'),
(23, 'Kerala Kitchen', 'Kochi', '7:00 PM - 11:00 PM'),
(24, 'Rajasthani Thali', 'Jodhpur', '6:30 PM - 11:00 PM'),
(25, 'Chaat Bazaar', 'Noida', '5:00 PM - 9:30 PM'),
(26, 'Coastal Aroma', 'Mangalore', '7:00 PM - 11:00 PM'),
(27, 'Vindaloo Village', 'Goa', '6:00 PM - 10:30 PM'),
(28, 'Desi Treats', 'Nagpur', '7:00 PM - 11:00 PM'),
(29, 'Aroma of India', 'Bhopal', '6:30 PM - 11:30 PM'),
(30, 'Royal Curry', 'Agra', '7:00 PM - 10:30 PM');


INSERT INTO orders (order_id, customer_id, restaurant_id, order_item, order_date, order_time, order_status, total_amount) VALUES
(1, 1, 1, 'Tandoori Chicken', '2023-12-01', '19:30:00', 'Completed', 850.00),
(2, 2, 2, 'Butter Naan with Paneer Tikka', '2023-12-02', '20:00:00', 'Completed', 550.00),
(3, 3, 3, 'Chicken Curry with Rice', '2023-12-03', '19:45:00', 'Completed', 650.00),
(4, 4, 4, 'Fish Curry with Rice', '2023-12-04', '20:15:00', 'Completed', 700.00),
(5, 5, 5, 'Masala Dosa', '2023-12-05', '18:30:00', 'Completed', 300.00),
(6, 6, 6, 'Amritsari Kulcha', '2023-12-06', '19:15:00', 'Completed', 400.00),
(7, 7, 7, 'Dal Baati Churma', '2023-12-07', '19:00:00', 'Completed', 500.00),
(8, 8, 8, 'Lucknowi Biryani', '2023-12-08', '19:45:00', 'Completed', 750.00),
(9, 9, 9, 'Hyderabadi Dum Biryani', '2023-12-09', '20:30:00', 'Completed', 850.00),
(10, 10, 11, 'Gujarati Thali', '2023-12-10', '19:15:00', 'Completed', 650.00),
(11, 11, 12, 'Chicken 65', '2023-12-11', '19:45:00', 'Completed', 550.00),
(12, 12, 13, 'Chettinad Chicken', '2023-12-12', '20:15:00', 'Completed', 600.00),
(13, 13, 14, 'Pav Bhaji', '2023-12-13', '19:30:00', 'Completed', 300.00),
(14, 14, 15, 'Kanpuri Kachori', '2023-12-14', '20:00:00', 'Completed', 250.00),
(15, 15, 16, 'Rajasthani Thali', '2023-12-15', '19:15:00', 'Completed', 750.00),
(18, 18, 19, 'Shorshe Ilish', '2023-12-18', '20:00:00', 'Completed', 850.00),
(19, 19, 20, 'Makki Ki Roti with Sarson Ka Saag', '2023-12-19', '19:00:00', 'Completed', 550.00),
(20, 20, 21, 'Awadhi Mutton Biryani', '2023-12-20', '20:30:00', 'Completed', 950.00),
(21, 21, 22, 'Chicken Tikka Masala', '2023-12-21', '19:45:00', 'Completed', 800.00),
(22, 23, 23, 'Kerala Parotta with Beef Fry', '2023-12-22', '20:00:00', 'Completed', 700.00),
(23, 24, 24, 'Jodhpuri Gatta Curry', '2023-12-23', '19:15:00', 'Completed', 600.00),
(24, 26, 25, 'Aloo Tikki Chaat', '2023-12-24', '19:30:00', 'Completed', 250.00),
(25, 27, 26, 'Mangalore Fish Curry', '2023-12-25', '20:15:00', 'Completed', 750.00),
(26, 28, 27, 'Goan Prawn Curry', '2023-12-26', '19:30:00', 'Completed', 850.00),
(27, 29, 28, 'Nagpuri Saoji Chicken', '2023-12-27', '19:00:00', 'Completed', 900.00),
(28, 1, 29, 'Bhopali Keema Pulao', '2023-12-28', '20:30:00', 'Completed', 950.00),
(29, 2, 30, 'Mughlai Chicken', '2023-12-29', '19:45:00', 'Completed', 850.00);


INSERT INTO riders (rider_id, rider_name, signup_date) VALUES
(1, 'Arjun Sharma', '2022-01-15'),
(2, 'Priya Singh', '2023-03-10'),
(3, 'Rajesh Gupta', '2021-11-22'),
(4, 'Anjali Mehta', '2022-06-18'),
(5, 'Vikram Verma', '2023-07-05'),
(6, 'Karan Patel', '2021-09-12'),
(7, 'Sonia Jain', '2023-08-20'),
(8, 'Manish Thakur', '2022-02-14'),
(9, 'Ritu Kapoor', '2021-12-01'),
(10, 'Rahul Yadav', '2023-04-25'),
(11, 'Aarti Desai', '2022-08-09'),
(12, 'Aman Mishra', '2023-05-17'),
(13, 'Shivani Joshi', '2022-10-31'),
(14, 'Ajay Bansal', '2023-06-11'),
(15, 'Deepika Sinha', '2021-07-23'),
(16, 'Vivek Tiwari', '2023-02-28'),
(17, 'Pooja Reddy', '2022-11-19'),
(18, 'Suresh Nair', '2021-10-08'),
(19, 'Nikita Shah', '2023-01-06'),
(21, 'Priya Mishra', '2023-11-12'),
(22, 'Ashish Kumar', '2023-09-18'),
(23, 'Meera Verma', '2022-05-21'),
(24, 'Ravi Sharma', '2023-08-30'),
(25, 'Ankit Gupta', '2021-04-10'),
(26, 'Naveen Shah', '2023-02-14'),
(27, 'Priyanka Joshi', '2022-03-25'),
(28, 'Manoj Desai', '2023-07-20'),
(29, 'Reema Reddy', '2021-06-15'),
(30, 'Arvind Patel', '2023-10-05'),
(20, 'Rohan Khanna', '2022-09-15');

INSERT INTO deliveries (delivery_id, order_id, delivery_status, delivery_time, rider_id) VALUES
(1, 1, 'Completed', '20:00:00', 1),
(2, 2, 'Completed', '21:00:00', 2),
(3, 3, 'Completed', '20:30:00', 3),
(4, 4, 'Completed', '21:00:00', 4),
(5, 5, 'Completed', '19:00:00', 5),
(6, 6, 'Completed', '20:00:00', 6),
(7, 7, 'Completed', '19:30:00', 7),
(8, 8, 'Completed', '20:30:00', 8),
(9, 9, 'Completed', '21:00:00', 9),
(10, 10, 'Completed', '20:00:00', 10),
(11, 11, 'Completed', '20:30:00', 11),
(12, 12, 'Completed', '21:00:00', 12),
(13, 13, 'Completed', '20:00:00', 13),
(14, 14, 'Completed', '21:00:00', 14),
(15, 15, 'Completed', '20:00:00', 15),
(18, 18, 'Completed', '20:00:00', 18),
(19, 19, 'Completed', '19:30:00', 19),
(20, 20, 'Completed', '21:00:00', 20),
(21, 21, 'Completed', '20:30:00', 21),
(22, 22, 'Completed', '21:00:00', 22),
(23, 23, 'Completed', '20:00:00', 23),
(24, 24, 'Completed', '20:30:00', 24),
(25, 25, 'Completed', '20:00:00', 25),
(26, 26, 'Completed', '21:00:00', 26),
(27, 27, 'Completed', '20:00:00', 27),
(28, 28, 'Completed', '21:00:00', 28),
(29, 29, 'Completed', '20:30:00', 29);



-- 1. Safely clear old transactional data to avoid conflicts
TRUNCATE TABLE deliveries, orders CASCADE;

-- 1. Clear previous data
TRUNCATE TABLE deliveries, orders, customers, restaurants, riders CASCADE;

-- 2. Populate Lookup Masters (Same 20 Customers, 10 Restaurants, 20 Riders)
INSERT INTO customers (customer_id, customer_name, reg_date) VALUES
(1, 'Aarav Sharma', '2022-08-28'), (2, 'Vihaan Singh', '2021-05-17'),
(3, 'Ananya Gupta', '2023-10-01'), (4, 'Ishaan Mehta', '2023-10-27'),
(5, 'Meera Verma', '2023-08-24'), (6, 'Karan Patel', '2022-01-15'),
(7, 'Sonia Jain', '2022-06-18'), (8, 'Manish Thakur', '2021-09-12'),
(9, 'Ritu Kapoor', '2023-03-10'), (10, 'Rahul Yadav', '2022-11-20'),
(11, 'Aarti Desai', '2023-05-17'), (12, 'Aman Mishra', '2022-02-14'),
(13, 'Shivani Joshi', '2023-07-05'), (14, 'Ajay Bansal', '2021-07-23'),
(15, 'Deepika Sinha', '2023-01-06'), (16, 'Vivek Tiwari', '2022-10-31'),
(17, 'Pooja Reddy', '2023-08-20'), (18, 'Suresh Nair', '2021-12-01'),
(19, 'Nikita Shah', '2022-08-09'), (20, 'Rohan Das', '2023-04-25');

INSERT INTO restaurants (restaurant_id, restaurant_name, city, opening_hours) VALUES
(1, 'Spice Kitchen', 'Delhi', '08:00:00 - 23:00:00'),
(2, 'The Pizza Corner', 'Mumbai', '10:00:00 - 23:00:00'),
(3, 'Burger House', 'Bangalore', '09:00:00 - 22:00:00'),
(4, 'Tandoori Nights', 'Delhi', '12:00:00 - 00:00:00'),
(5, 'Royal Biryani', 'Mumbai', '11:00:00 - 23:00:00'),
(6, 'Punjab Grill', 'Delhi', '11:30:00 - 23:30:00'),
(7, 'Cafe Coffee Day', 'Bangalore', '07:00:00 - 23:00:00'),
(8, 'Chinatown', 'Mumbai', '12:00:00 - 22:30:00'),
(9, 'The South Indian', 'Bangalore', '06:30:00 - 21:30:00'),
(10, 'Rolls & Shakes', 'Delhi', '10:00:00 - 01:00:00');

INSERT INTO riders (rider_id, rider_name, signup_date) VALUES
(1, 'Arjun Sharma', '2022-01-15'), (2, 'Priya Singh', '2023-03-10'),
(3, 'Rajesh Gupta', '2021-11-22'), (4, 'Anjali Mehta', '2022-06-18'),
(5, 'Vikram Verma', '2023-07-05'), (6, 'Karan Patel', '2021-09-12'),
(7, 'Sonia Jain', '2023-08-20'), (8, 'Manish Thakur', '2022-02-14'),
(9, 'Ritu Kapoor', '2021-12-01'), (10, 'Rahul Yadav', '2023-04-25'),
(11, 'Aarti Desai', '2022-08-09'), (12, 'Aman Mishra', '2023-05-17'),
(13, 'Shivani Joshi', '2022-10-31'), (14, 'Ajay Bansal', '2023-06-11'),
(15, 'Deepika Sinha', '2021-07-23'), (16, 'Vivek Tiwari', '2023-02-28'),
(17, 'Pooja Reddy', '2022-11-19'), (18, 'Suresh Nair', '2021-10-08'),
(19, 'Nikita Shah', '2023-01-06'), (20, 'Amit Malhotra', '2023-09-15');

-- 3. Generate Randomized Transactional Data with NULL variations
DO $$
DECLARE 
    i INT := 1;
    v_cust_id INT;
    v_rest_id INT;
    v_rider_id INT;
    v_item_rand INT;
    v_item VARCHAR(55);
    v_amount FLOAT;
    v_date DATE;
    v_time TIME;
    v_status VARCHAR(25);
    v_del_status VARCHAR(35);
    v_del_time TIME;
    v_prob FLOAT;
BEGIN
    WHILE i <= 1050 LOOP
        v_cust_id := floor(random() * 20) + 1;       
        v_rest_id := floor(random() * 10) + 1;       
        v_rider_id := floor(random() * 20) + 1;     

        v_item_rand := floor(random() * 5);
        IF v_item_rand = 0 THEN 
            v_item := 'Butter Chicken'; v_amount := 450.00;
        ELSIF v_item_rand = 1 THEN 
            v_item := 'Margherita Pizza'; v_amount := 350.00;
        ELSIF v_item_rand = 2 THEN 
            v_item := 'Cheese Burger'; v_amount := 180.00;
        ELSIF v_item_rand = 3 THEN 
            v_item := 'Mutton Biryani'; v_amount := 550.00;
        ELSE 
            v_item := 'Masala Dosa'; v_amount := 120.00;
        END IF;

        v_date := DATE '2022-01-01' + floor(random() * 1100) * INTERVAL '1 day';
        v_time := TIME '11:00:00' + floor(random() * 720) * INTERVAL '1 minute';

        -- Generate a probability selector to distribute edge cases
        v_prob := random();

        IF v_prob < 0.10 THEN
            -- Scenario A: Cancelled Orders (10% of data)
            v_status := 'Cancelled';
            v_del_status := 'Not Delivered';
            v_del_time := NULL;
        ELSIF v_prob >= 0.10 AND v_prob < 0.15 THEN
            -- Scenario B: Damaged/Lost - delivery_status is explicitly NULL (5% of data)
            v_status := 'Completed';
            v_del_status := NULL;
            v_del_time := NULL;
        ELSIF v_prob >= 0.15 AND v_prob < 0.20 THEN
            -- Scenario C: Ongoing Active orders (5% of data)
            v_status := 'Completed';
            v_del_status := 'Pending';
            v_del_time := NULL;
        ELSE
            -- Regular Completed Deliveries (80% of data)
            v_status := 'Completed';
            v_del_status := 'Delivered';
            v_del_time := v_time + (20 + floor(random() * 35)) * INTERVAL '1 minute'; 
        END IF;

        INSERT INTO orders (order_id, customer_id, restaurant_id, order_item, order_date, order_time, order_status, total_amount)
        VALUES (i, v_cust_id, v_rest_id, v_item, v_date, v_time, v_status, v_amount);

        INSERT INTO deliveries (delivery_id, order_id, delivery_status, delivery_time, rider_id)
        VALUES (i, i, v_del_status, v_del_time, v_rider_id);

        i := i + 1;
    END LOOP;
END $$;

SELECT 'customers' AS table_name, COUNT(*) FROM customers UNION ALL
SELECT 'restaurants', COUNT(*) FROM restaurants UNION ALL
SELECT 'riders', COUNT(*) FROM riders UNION ALL
SELECT 'orders', COUNT(*) FROM orders UNION ALL
SELECT 'deliveries', COUNT(*) FROM deliveries;
