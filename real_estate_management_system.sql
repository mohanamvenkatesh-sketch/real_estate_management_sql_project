create database real_estate
use real_estate
create table owners(owner_id int primary key,owner_name varchar(30),phone varchar(12),email varchar(100),address varchar(200))

create table agent(agent_id int primary key,agent_name varchar(30),phone varchar(12),email varchar(100),commission_rate decimal(5,2))
create table customers (
    customer_id int primary key auto_increment,
    customer_name varchar(50) not null,
    phone varchar(15) not null,
    email varchar(100) unique,
    address varchar(150),
    customer_type varchar(10)check(customer_type IN ('Buyer','Tenant'))
)

create table property_type (type_id int primary key auto_increment,type_name varchar(20))

create table property_location(location_id int primary key auto_increment, city varchar(25),area varchar(25),state varchar(20),pincode int)

create table property_detail(property_id int primary key auto_increment,owner_id int,type_id int,location_id int,agent_id int,price decimal(12,2),
size_sqft int,status enum('Available','sold','rented') default 'Available', description text, foreign key(owner_id) references owners(owner_id),
foreign key(type_id) references property_type(type_id),foreign key(location_id) references property_location(location_id),
foreign key(agent_id) references agent(agent_id))

create table property_table(image_id int primary key auto_increment,property_id int,image_url varchar(255),
foreign key (property_id) references property_detail(property_id))

create table amenities(amenity_id int primary key auto_increment,amenity_name varchar(20))

create table property_amenities(property_amenity_id int primary key auto_increment,property_id int,amenity_id int,
foreign key(property_id) references property_detail(property_id),foreign key(amenity_id) references amenities(amenity_id))

create table rental_agreement(rental_id int primary key auto_increment,property_id int,customer_id int,
start_date date,end_date date,monthly_rent decimal (10,2),deposit_amount decimal (10,2),
foreign key (property_id) references property_detail(property_id),
foreign key (customer_id) references customers(customer_id))

create table sales(sale_id int primary key auto_increment,property_id int,customer_id int, agent_id int,
sale_price decimal (12,2),sale_date date,foreign key (property_id) references property_detail(property_id),
foreign key(customer_id) references customers(customer_id),
foreign key (agent_id) references agent(agent_id))

create table payment (payment_id int primary key auto_increment,customer_id int,property_id int,payment_type enum('rent','sale','deposit'),
amount decimal (12,2),payment_date date,payment_method varchar(20),foreign key (customer_id) references customers(customer_id),
foreign key (property_id) references property_detail(property_id))

create table maintenance_request(request_id int primary key auto_increment,property_id int,customer_id int, request_date date, issue_description text,status enum('pending',
'In-progress','completed') default 'pending',foreign key (property_id) references property_detail(property_id),
foreign key (customer_id) references customers(customer_id))

create table staff(status_id int primary key auto_increment,staff_name varchar(25),staff_role varchar(30),phone varchar(15),
email varchar(45))

create table visits(visit_id int primary key auto_increment,property_id int,customer_id int,agent_id int,visit_date date,remarks text,
foreign key (property_id) references property_detail(property_id),
foreign key (customer_id) references customers(customer_id),
foreign key(agent_id) references agent(agent_id))


insert into owners (owner_id, owner_name, phone, email, address) values
(1, 'Ramesh Kumar', '9876543210', 'ramesh.kumar@example.com', '12 Gandhi Street, Chennai'),
(2, 'Priya Sharma', '9123456780', 'priya.sharma@example.com', '45 MG Road, Bangalore'),
(3, 'Arun Nair', '9988776655', 'arun.nair@example.com', '78 Marine Drive, Kochi'),
(4, 'Meena Iyer', '9345678901', 'meena.iyer@example.com', '23 Anna Nagar, Chennai'),
(5, 'Suresh Gupta', '9234567890', 'suresh.gupta@example.com', '56 Connaught Place, Delhi'),
(6, 'Lakshmi Menon', '9456123789', 'lakshmi.menon@example.com', '89 Brigade Road, Bangalore'),
(7, 'Vikram Singh', '9784512360', 'vikram.singh@example.com', '34 Park Street, Kolkata'),
(8, 'Anjali Desai', '9654321789', 'anjali.desai@example.com', '67 Law Garden, Ahmedabad'),
(9, 'Rajesh Patel', '9123456701', 'rajesh.patel@example.com', '90 SG Highway, Ahmedabad'),
(10, 'Deepa Reddy', '9345678123', 'deepa.reddy@example.com', '12 Jubilee Hills, Hyderabad'),
(11, 'Karthik Srinivasan', '9876123450', 'karthik.srinivasan@example.com', '45 T Nagar, Chennai'),
(12, 'Sunita Joshi', '9765432109', 'sunita.joshi@example.com', '78 Koregaon Park, Pune'),
(13, 'Manoj Verma', '9345678120', 'manoj.verma@example.com', '23 Sector 17, Chandigarh'),
(14, 'Sneha Kapoor', '9456123780', 'sneha.kapoor@example.com', '56 Bandra West, Mumbai'),
(15, 'Ajay Mishra', '9784512361', 'ajay.mishra@example.com', '34 Gomti Nagar, Lucknow'),
(16, 'Neha Agarwal', '9654321780', 'neha.agarwal@example.com', '67 Salt Lake, Kolkata'),
(17, 'Ravi Shankar', '9123456702', 'ravi.shankar@example.com', '90 Indiranagar, Bangalore'),
(18, 'Pooja Malhotra', '9345678124', 'pooja.malhotra@example.com', '12 Hauz Khas, Delhi'),
(19, 'Santosh Kumar', '9876123451', 'santosh.kumar@example.com', '45 Banjara Hills, Hyderabad'),
(20, 'Divya Jain', '9765432108', 'divya.jain@example.com', '78 Civil Lines, Jaipur'),
(21, 'Ashok Pillai', '9345678125', 'ashok.pillai@example.com', '23 Fort Kochi, Kochi'),
(22, 'Ritika Mehta', '9456123781', 'ritika.mehta@example.com', '56 Powai, Mumbai'),
(23, 'Gopal Das', '9784512362', 'gopal.das@example.com', '34 Ballygunge, Kolkata'),
(24, 'Shalini Rao', '9654321781', 'shalini.rao@example.com', '67 Whitefield, Bangalore'),
(25, 'Harish Chandra', '9123456703', 'harish.chandra@example.com', '90 Connaught Place, Delhi'),
(26, 'Kavita Singh', '9345678126', 'kavita.singh@example.com', '12 Jubilee Hills, Hyderabad'),
(27, 'Naveen Kumar', '9876123452', 'naveen.kumar@example.com', '45 Anna Nagar, Chennai'),
(28, 'Preeti Sharma', '9765432107', 'preeti.sharma@example.com', '78 Koregaon Park, Pune'),
(29, 'Anand Reddy', '9345678127', 'anand.reddy@example.com', '23 Banjara Hills, Hyderabad'),
(30, 'Swati Gupta', '9456123782', 'swati.gupta@example.com', '56 Bandra East, Mumbai'),
(31, 'Vinod Nair', '9784512363', 'vinod.nair@example.com', '34 Marine Drive, Kochi'),
(32, 'Megha Kapoor', '9654321782', 'megha.kapoor@example.com', '67 Salt Lake, Kolkata'),
(33, 'Rajiv Patel', '9123456704', 'rajiv.patel@example.com', '90 SG Highway, Ahmedabad'),
(34, 'Anusha Iyer', '9345678128', 'anusha.iyer@example.com', '12 T Nagar, Chennai'),
(35, 'Suraj Verma', '9876123453', 'suraj.verma@example.com', '45 Sector 17, Chandigarh'),
(36, 'Nisha Joshi', '9765432106', 'nisha.joshi@example.com', '78 Civil Lines, Jaipur'),
(37, 'Arvind Mishra', '9345678129', 'arvind.mishra@example.com', '23 Gomti Nagar, Lucknow'),
(38, 'Renu Agarwal', '9456123783', 'renu.agarwal@example.com', '56 Indiranagar, Bangalore'),
(39, 'Mahesh Shankar', '9784512364', 'mahesh.shankar@example.com', '34 Hauz Khas, Delhi'),
(40, 'Sonia Malhotra', '9654321783', 'sonia.malhotra@example.com', '67 Whitefield, Bangalore'),
(41, 'Vijay Kumar', '9123456705', 'vijay.kumar@example.com', '90 Jubilee Hills, Hyderabad'),
(42, 'Anita Jain', '9345678130', 'anita.jain@example.com', '12 Bandra West, Mumbai'),
(43, 'Raghav Pillai', '9876123454', 'raghav.pillai@example.com', '45 Fort Kochi, Kochi'),
(44, 'Smita Mehta', '9765432105', 'smita.mehta@example.com', '78 Koregaon Park, Pune'),
(45, 'Kiran Das', '9345678131', 'kiran.das@example.com', '23 Ballygunge, Kolkata'),
(46, 'Pallavi Rao', '9456123784', 'pallavi.rao@example.com', '56 Salt Lake, Kolkata'),
(47, 'Sanjay Chandra', '9784512365', 'sanjay.chandra@example.com', '34 Connaught Place, Delhi'),
(48, 'Rekha Singh', '9654321784', 'rekha.singh@example.com', '67 Indiranagar, Bangalore'),
(49, 'Balaji Nair', '9123456706', 'balaji.nair@example.com', '90 Marine Drive, Kochi'),
(50, 'Geeta Sharma', '9345678132', 'geeta.sharma@example.com', '12 Anna Nagar, Chennai')

select * from owners

insert into agent (agent_id, agent_name, phone, email, commission_rate) values (1, 'Arun Kumar', '9876543210', 'arun.kumar@example.com', 5.50), (2, 'Priya Sharma', '9123456780', 'priya.sharma@example.com', 6.25), (3, 'Ravi Menon', '9988776655', 'ravi.menon@example.com', 4.75), (4, 'Sneha Iyer', '9012345678', 'sneha.iyer@example.com', 7.00), (5, 'Vikram Rao', '9098765432', 'vikram.rao@example.com', 5.00), (6, 'Meena Das', '9345678901', 'meena.das@example.com', 6.80), (7, 'Karthik Nair', '9456123789', 'karthik.nair@example.com', 4.90), (8, 'Anjali Gupta', '9321456789', 'anjali.gupta@example.com', 5.75), (9, 'Suresh Reddy', '9876123450', 'suresh.reddy@example.com', 6.10), (10, 'Divya Singh', '9765432109', 'divya.singh@example.com', 7.20), (11, 'Manoj Pillai', '9654321098', 'manoj.pillai@example.com', 5.40), (12, 'Lakshmi Rao', '9543210987', 'lakshmi.rao@example.com', 6.00), (13, 'Ajay Verma', '9432109876', 'ajay.verma@example.com', 4.85), (14, 'Neha Kapoor', '9321098765', 'neha.kapoor@example.com', 5.95), (15, 'Rajesh Patil', '9210987654', 'rajesh.patil@example.com', 6.50), (16, 'Pooja Mishra', '9109876543', 'pooja.mishra@example.com', 7.10), (17, 'Santosh Kumar', '9898765432', 'santosh.kumar@example.com', 5.20), (18, 'Ritika Jain', '9787654321', 'ritika.jain@example.com', 6.30), (19, 'Ashok Mehta', '9676543210', 'ashok.mehta@example.com', 4.95), (20, 'Shalini Roy', '9565432109', 'shalini.roy@example.com', 5.85), (21, 'Deepak Yadav', '9454321098', 'deepak.yadav@example.com', 6.40), (22, 'Kavita Joshi', '9343210987', 'kavita.joshi@example.com', 7.25), (23, 'Naveen Thomas', '9232109876', 'naveen.thomas@example.com', 5.60), (24, 'Swati Kulkarni', '9121098765', 'swati.kulkarni@example.com', 6.70), (25, 'Ganesh Babu', '9010987654', 'ganesh.babu@example.com', 4.80), (26, 'Radhika Sen', '9909876543', 'radhika.sen@example.com', 5.90), (27, 'Harish Chandra', '9812345678', 'harish.chandra@example.com', 6.55), (28, 'Sunita Agarwal', '9723456789', 'sunita.agarwal@example.com', 7.05), (29, 'Vivek Malhotra', '9634567890', 'vivek.malhotra@example.com', 5.35), (30, 'Anita Desai', '9545678901', 'anita.desai@example.com', 6.15), (31, 'Rohan Gupta', '9456789012', 'rohan.gupta@example.com', 4.70), (32, 'Seema Rani', '9367890123', 'seema.rani@example.com', 5.65), (33, 'Mahesh Iyer', '9278901234', 'mahesh.iyer@example.com', 6.20), (34, 'Preeti Sharma', '9189012345', 'preeti.sharma@example.com', 7.30), (35, 'Arvind Nair', '9090123456', 'arvind.nair@example.com', 5.10), (36, 'Geeta Menon', '9981234567', 'geeta.menon@example.com', 6.60), (37, 'Sanjay Rao', '9872345678', 'sanjay.rao@example.com', 4.95), (38, 'Bhavna Das', '9763456789', 'bhavna.das@example.com', 5.85), (39, 'Mukesh Reddy', '9654567890', 'mukesh.reddy@example.com', 6.45), (40, 'Nisha Singh', '9545678901', 'nisha.singh@example.com', 7.15), (41, 'Anand Pillai', '9436789012', 'anand.pillai@example.com', 5.25), (42, 'Shreya Kapoor', '9327890123', 'shreya.kapoor@example.com', 6.35), (43, 'Ramesh Patil', '9218901234', 'ramesh.patil@example.com', 4.90), (44, 'Meera Mishra', '9109012345', 'meera.mishra@example.com', 5.80), (45, 'Vijay Kumar', '9990123456', 'vijay.kumar@example.com', 6.50), (46, 'Anju Jain', '9881234567', 'anju.jain@example.com', 7.00), (47, 'Suraj Mehta', '9772345678', 'suraj.mehta@example.com', 5.30), (48, 'Pallavi Roy', '9663456789', 'pallavi.roy@example.com', 6.10), (49, 'Krishna Yadav', '9554567890', 'krishna.yadav@example.com', 4.85), (50, 'Smita Joshi', '9445678901', 'smita.joshi@example.com', 5.95);

select * from agent

insert into customers (customer_name, phone, email, address, customer_type) values ('Arun Kumar', '9876543210', 'arun.kumar@example.com', '12 MG Road, Bangalore', 'Buyer'), ('Priya Sharma', '9123456780', 'priya.sharma@example.com', '45 Nehru Street, Chennai', 'Tenant'), ('Ravi Menon', '9988776655', 'ravi.menon@example.com', '23 Park Lane, Kochi', 'Buyer'), ('Sneha Iyer', '9012345678', 'sneha.iyer@example.com', '78 Residency Road, Mumbai', 'Tenant'), ('Vikram Rao', '9098765432', 'vikram.rao@example.com', '56 Jubilee Hills, Hyderabad', 'Buyer'), ('Meena Das', '9345678901', 'meena.das@example.com', '34 Salt Lake, Kolkata', 'Tenant'), ('Karthik Nair', '9456123789', 'karthik.nair@example.com', '89 Civil Lines, Delhi', 'Buyer'), ('Anjali Gupta', '9321456789', 'anjali.gupta@example.com', '11 Connaught Place, Delhi', 'Tenant'), ('Suresh Reddy', '9876123450', 'suresh.reddy@example.com', '67 Banjara Hills, Hyderabad', 'Buyer'), ('Divya Singh', '9765432109', 'divya.singh@example.com', '90 Indiranagar, Bangalore', 'Tenant'), ('Manoj Pillai', '9654321098', 'manoj.pillai@example.com', '22 Marine Drive, Kochi', 'Buyer'), ('Lakshmi Rao', '9543210987', 'lakshmi.rao@example.com', '77 Anna Nagar, Chennai', 'Tenant'), ('Ajay Verma', '9432109876', 'ajay.verma@example.com', '33 Sector 17, Chandigarh', 'Buyer'), ('Neha Kapoor', '9321098765', 'neha.kapoor@example.com', '55 Bandra West, Mumbai', 'Tenant'), ('Rajesh Patil', '9210987654', 'rajesh.patil@example.com', '12 Koregaon Park, Pune', 'Buyer'), ('Pooja Mishra', '9109876543', 'pooja.mishra@example.com', '88 Gomti Nagar, Lucknow', 'Tenant'), ('Santosh Kumar', '9898765432', 'santosh.kumar@example.com', '44 Civil Lines, Allahabad', 'Buyer'), ('Ritika Jain', '9787654321', 'ritika.jain@example.com', '23 Malviya Nagar, Jaipur', 'Tenant'), ('Ashok Mehta', '9676543210', 'ashok.mehta@example.com', '19 Sector 62, Noida', 'Buyer'), ('Shalini Roy', '9565432109', 'shalini.roy@example.com', '67 Ballygunge, Kolkata', 'Tenant'), ('Deepak Yadav', '9454321098', 'deepak.yadav@example.com', '34 Ashok Nagar, Kanpur', 'Buyer'), ('Kavita Joshi', '9343210987', 'kavita.joshi@example.com', '78 MG Road, Indore', 'Tenant'), ('Naveen Thomas', '9232109876', 'naveen.thomas@example.com', '56 Fort Kochi, Kochi', 'Buyer'), ('Swati Kulkarni', '9121098765', 'swati.kulkarni@example.com', '89 Shivaji Nagar, Pune', 'Tenant'), ('Ganesh Babu', '9010987654', 'ganesh.babu@example.com', '45 Gandhi Road, Coimbatore', 'Buyer'), ('Radhika Sen', '9909876543', 'radhika.sen@example.com', '12 Park Street, Kolkata', 'Tenant'), ('Harish Chandra', '9812345678', 'harish.chandra@example.com', '67 Sector 15, Gurgaon', 'Buyer'), ('Sunita Agarwal', '9723456789', 'sunita.agarwal@example.com', '34 Malad East, Mumbai', 'Tenant'), ('Vivek Malhotra', '9634567890', 'vivek.malhotra@example.com', '23 Sector 18, Noida', 'Buyer'), ('Anita Desai', '9545678901', 'anita.desai@example.com', '77 Jayanagar, Bangalore', 'Tenant'), ('Rohan Gupta', '9456789012', 'rohan.gupta@example.com', '56 Connaught Place, Delhi', 'Buyer'), ('Seema Rani', '9367890123', 'seema.rani@example.com', '89 Anna Nagar, Chennai', 'Tenant'), ('Mahesh Iyer', '9278901234', 'mahesh.iyer@example.com', '45 Residency Road, Kochi', 'Buyer'), ('Preeti Sharma', '9189012345', 'preeti.sharma@example.com', '12 Bandra East, Mumbai', 'Tenant'), ('Arvind Nair', '9090123456', 'arvind.nair@example.com', '67 Indiranagar, Bangalore', 'Buyer'), ('Geeta Menon', '9981234567', 'geeta.menon@example.com', '34 Salt Lake, Kolkata', 'Tenant'), ('Sanjay Rao', '9872345678', 'sanjay.rao@example.com', '23 Jubilee Hills, Hyderabad', 'Buyer'), ('Bhavna Das', '9763456789', 'bhavna.das@example.com', '78 Civil Lines, Delhi', 'Tenant'), ('Mukesh Reddy', '9654567890', 'mukesh.reddy@example.com', '56 Banjara Hills, Hyderabad', 'Buyer'), ('Nisha Singh', '9545678901', 'nisha.singh@example.com', '89 Indiranagar, Bangalore', 'Tenant'), ('Anand Pillai', '9436789012', 'anand.pillai@example.com', '45 Marine Drive, Kochi', 'Buyer'), ('Shreya Kapoor', '9327890123', 'shreya.kapoor@example.com', '12 Connaught Place, Delhi', 'Tenant'), ('Ramesh Patil', '9218901234', 'ramesh.patil@example.com', '67 Koregaon Park, Pune', 'Buyer'), ('Meera Mishra', '9109012345', 'meera.mishra@example.com', '34 Gomti Nagar, Lucknow', 'Tenant'), ('Vijay Kumar', '9990123456', 'vijay.kumar@example.com', '23 Civil Lines, Allahabad', 'Buyer'), ('Anju Jain', '9881234567', 'anju.jain@example.com', '78 Malviya Nagar, Jaipur', 'Tenant'), ('Suraj Mehta', '9772345678', 'suraj.mehta@example.com', '56 Sector 62, Noida', 'Buyer'), ('Pallavi Roy', '9663456789', 'pallavi.roy@example.com', '89 Ballygunge, Kolkata', 'Tenant'), ('Krishna Yadav', '9554567890', 'krishna.yadav@example.com', '45 Ashok Nagar, Kanpur', 'Buyer'), ('Smita Joshi', '9445678901', 'smita.joshi@example.com', '12 MG Road, Indore', 'Tenant');

select * from customers

insert into property_type (type_name) values ('Apartment'), ('Villa'), ('Penthouse'), ('Studio'), ('Duplex'), ('Triplex'), ('Row House'), ('Bungalow'), ('Farmhouse'), ('Cottage'), ('Condominium'), ('Townhouse'), ('Loft'), ('Serviced Apartment'), ('Independent House'), ('Chalet'), ('Mansion'), ('Dormitory'), ('Guest House'), ('Hostel'), ('Office Space'), ('Retail Shop'), ('Warehouse'), ('Factory'), ('Industrial Shed'), ('Cold Storage'), ('Showroom'), ('Co-working Space'), ('Clinic'), ('Hospital'), ('School'), ('College'), ('Training Center'), ('Banquet Hall'), ('Community Hall'), ('Hotel'), ('Resort'), ('Restaurant'), ('Café'), ('Bar'), ('Clubhouse'), ('Gym'), ('Swimming Pool'), ('Playground'), ('Park'), ('Library'), ('Temple'), ('Church'), ('Mosque'), ('Synagogue'), ('Pagoda');

select distinct * from property_type

insert into property_location (city, area, state, pincode) values ('Chennai', 'Velachery', 'Tamil Nadu', 600042), ('Chennai', 'T Nagar', 'Tamil Nadu', 600017), ('Chennai', 'Anna Nagar', 'Tamil Nadu', 600040), ('Chennai', 'Adyar', 'Tamil Nadu', 600020), ('Chennai', 'Mylapore', 'Tamil Nadu', 600004), ('Bangalore', 'Indiranagar', 'Karnataka', 560038), ('Bangalore', 'Whitefield', 'Karnataka', 560066), ('Bangalore', 'Koramangala', 'Karnataka', 560034), ('Bangalore', 'Jayanagar', 'Karnataka', 560041), ('Bangalore', 'Malleshwaram', 'Karnataka', 560003), ('Hyderabad', 'Banjara Hills', 'Telangana', 500034), ('Hyderabad', 'Jubilee Hills', 'Telangana', 500033), ('Hyderabad', 'Gachibowli', 'Telangana', 500032), ('Hyderabad', 'Secunderabad', 'Telangana', 500003), ('Hyderabad', 'Madhapur', 'Telangana', 500081), ('Mumbai', 'Bandra', 'Maharashtra', 400050), ('Mumbai', 'Andheri', 'Maharashtra', 400053), ('Mumbai', 'Powai', 'Maharashtra', 400076), ('Mumbai', 'Dadar', 'Maharashtra', 400014), ('Mumbai', 'Colaba', 'Maharashtra', 400005), ('Delhi', 'Connaught Place', 'Delhi', 110001), ('Delhi', 'Karol Bagh', 'Delhi', 110005), ('Delhi', 'Dwarka', 'Delhi', 110075), ('Delhi', 'Saket', 'Delhi', 110017), ('Delhi', 'Lajpat Nagar', 'Delhi', 110024), ('Kolkata', 'Salt Lake', 'West Bengal', 700091), ('Kolkata', 'Ballygunge', 'West Bengal', 700019), ('Kolkata', 'Park Street', 'West Bengal', 700016), ('Kolkata', 'Howrah', 'West Bengal', 711101), ('Kolkata', 'Dum Dum', 'West Bengal', 700028), ('Pune', 'Koregaon Park', 'Maharashtra', 411001), ('Pune', 'Shivaji Nagar', 'Maharashtra', 411005), ('Pune', 'Hinjewadi', 'Maharashtra', 411057), ('Pune', 'Baner', 'Maharashtra', 411045), ('Pune', 'Kothrud', 'Maharashtra', 411038), ('Coimbatore', 'RS Puram', 'Tamil Nadu', 641002), ('Coimbatore', 'Gandhipuram', 'Tamil Nadu', 641012), ('Coimbatore', 'Peelamedu', 'Tamil Nadu', 641004), ('Coimbatore', 'Saibaba Colony', 'Tamil Nadu', 641011), ('Coimbatore', 'Singanallur', 'Tamil Nadu', 641005), ('Jaipur', 'Malviya Nagar', 'Rajasthan', 302017), ('Jaipur', 'Vaishali Nagar', 'Rajasthan', 302021), ('Jaipur', 'Mansarovar', 'Rajasthan', 302020), ('Jaipur', 'Bapu Nagar', 'Rajasthan', 302015), ('Jaipur', 'C-Scheme', 'Rajasthan', 302001), ('Lucknow', 'Hazratganj', 'Uttar Pradesh', 226001), ('Lucknow', 'Gomti Nagar', 'Uttar Pradesh', 226010), ('Lucknow', 'Alambagh', 'Uttar Pradesh', 226005), ('Lucknow', 'Indira Nagar', 'Uttar Pradesh', 226016), ('Lucknow', 'Charbagh', 'Uttar Pradesh', 226004)

select * from property_location

insert into property_detail (owner_id, type_id, location_id, agent_id, price, size_sqft, status, description) values (1, 1, 1, 1, 5500000.00, 1200, 'Available', '2BHK apartment in Velachery, prime location.'), (2, 2, 2, 2, 12500000.00, 2500, 'sold', 'Luxury villa in T Nagar with garden.'), (3, 3, 3, 3, 8000000.00, 1800, 'Available', 'Penthouse in Anna Nagar with city view.'), (4, 4, 4, 4, 4500000.00, 900, 'rented', 'Compact studio in Adyar, near beach.'), (5, 5, 5, 5, 9500000.00, 2000, 'Available', 'Modern duplex in Mylapore.'), (6, 6, 6, 6, 7000000.00, 1500, 'sold', 'Row house in Indiranagar, Bangalore.'), (7, 7, 7, 7, 15000000.00, 3200, 'Available', 'Bungalow in Whitefield with spacious lawn.'), (8, 8, 8, 8, 6000000.00, 1100, 'rented', 'Farmhouse in Koramangala outskirts.'), (9, 9, 9, 9, 8500000.00, 1700, 'Available', 'Cottage in Jayanagar, peaceful area.'), (10, 10, 10, 10, 30000000.00, 5000, 'sold', 'Condominium in Malleshwaram, premium amenities.'), (11, 11, 11, 11, 12000000.00, 2400, 'Available', 'Townhouse in Banjara Hills, Hyderabad.'), (12, 12, 12, 12, 9500000.00, 1900, 'rented', 'Loft in Jubilee Hills, modern design.'), (13, 13, 13, 13, 5000000.00, 1000, 'Available', 'Serviced apartment in Gachibowli.'), (14, 14, 14, 14, 7500000.00, 1600, 'sold', 'Independent house in Secunderabad.'), (15, 15, 15, 15, 20000000.00, 4000, 'Available', 'Chalet in Madhapur, luxury living.'), (16, 16, 16, 16, 35000000.00, 6000, 'rented', 'Mansion in Bandra, sea-facing property.'), (17, 17, 17, 17, 10000000.00, 2100, 'Available', 'Dormitory in Andheri, student housing.'), (18, 18, 18, 18, 18000000.00, 3500, 'sold', 'Guest house in Powai, near lake.'), (19, 19, 19, 19, 4000000.00, 800, 'Available', 'Hostel in Dadar, budget-friendly.'), (20, 20, 20, 20, 22000000.00, 4200, 'rented', 'Office space in Colaba, commercial hub.'), (21, 21, 21, 21, 15000000.00, 3000, 'Available', 'Retail shop in Connaught Place, Delhi.'), (22, 22, 22, 22, 25000000.00, 4800, 'sold', 'Warehouse in Karol Bagh, spacious.'), (23, 23, 23, 23, 12000000.00, 2200, 'Available', 'Factory in Dwarka, industrial zone.'), (24, 24, 24, 24, 8000000.00, 1600, 'rented', 'Industrial shed in Saket.'), (25, 25, 25, 25, 30000000.00, 5500, 'Available', 'Cold storage in Lajpat Nagar.'), (26, 26, 26, 26, 20000000.00, 4000, 'sold', 'Showroom in Salt Lake, Kolkata.'), (27, 27, 27, 27, 10000000.00, 2000, 'Available', 'Co-working space in Ballygunge.'), (28, 28, 28, 28, 15000000.00, 2800, 'rented', 'Clinic in Park Street.'), (29, 29, 29, 29, 50000000.00, 7000, 'Available', 'Hospital in Howrah.'), (30, 30, 30, 30, 35000000.00, 6000, 'sold', 'School in Dum Dum.'), (31, 31, 31, 31, 40000000.00, 6500, 'Available', 'College in Koregaon Park, Pune.'), (32, 32, 32, 32, 12000000.00, 2300, 'rented', 'Training center in Shivaji Nagar.'), (33, 33, 33, 33, 25000000.00, 5000, 'Available', 'Banquet hall in Hinjewadi.'), (34, 34, 34, 34, 18000000.00, 3600, 'sold', 'Community hall in Baner.'), (35, 35, 35, 35, 60000000.00, 8000, 'Available', 'Hotel in Kothrud, Pune.'), (36, 36, 36, 36, 45000000.00, 7000, 'rented', 'Resort in RS Puram, Coimbatore.'), (37, 37, 37, 37, 15000000.00, 3000, 'Available', 'Restaurant in Gandhipuram.'), (38, 38, 38, 38, 8000000.00, 1600, 'sold', 'Café in Peelamedu.'), (39, 39, 39, 39, 10000000.00, 2000, 'Available', 'Bar in Saibaba Colony.'), (40, 40, 40, 40, 20000000.00, 4000, 'rented', 'Clubhouse in Singanallur.'), (41, 41, 41, 41, 12000000.00, 2400, 'Available', 'Gym in Malviya Nagar, Jaipur.'), (42, 42, 42, 42, 15000000.00, 3000, 'sold', 'Swimming pool in Vaishali Nagar.'), (43, 43, 43, 43, 10000000.00, 2100, 'Available', 'Playground in Mansarovar.'), (44, 44, 44, 44, 8000000.00, 1700, 'rented', 'Park in Bapu Nagar.'), (45, 45, 45, 45, 5000000.00, 1000, 'Available', 'Library in C-Scheme, Jaipur.'), (46, 46, 46, 46, 3000000.00, 700, 'sold', 'Temple in Hazratganj, Lucknow.'), (47, 47, 47, 47, 4000000.00, 900, 'Available', 'Church in Gomti Nagar.'), (48, 48, 48, 48, 3500000.00, 800, 'rented', 'Mosque in Alambagh.'),-- continuing from row 49
(49, 49, 49, 49, 2500000.00, 600, 'Available', 'Synagogue in Indira Nagar.'),
(50, 50, 50, 50, 3000000.00, 750, 'sold', 'Pagoda in Charbagh, Lucknow with cultural significance.')

select * from property_detail

insert into property_table (property_id, image_url) values (1, 'https://example.com/images/property1.jpg'), (2, 'https://example.com/images/property2.jpg'), (3, 'https://example.com/images/property3.jpg'), (4, 'https://example.com/images/property4.jpg'), (5, 'https://example.com/images/property5.jpg'), (6, 'https://example.com/images/property6.jpg'), (7, 'https://example.com/images/property7.jpg'), (8, 'https://example.com/images/property8.jpg'), (9, 'https://example.com/images/property9.jpg'), (10, 'https://example.com/images/property10.jpg'), (11, 'https://example.com/images/property11.jpg'), (12, 'https://example.com/images/property12.jpg'), (13, 'https://example.com/images/property13.jpg'), (14, 'https://example.com/images/property14.jpg'), (15, 'https://example.com/images/property15.jpg'), (16, 'https://example.com/images/property16.jpg'), (17, 'https://example.com/images/property17.jpg'), (18, 'https://example.com/images/property18.jpg'), (19, 'https://example.com/images/property19.jpg'), (20, 'https://example.com/images/property20.jpg'), (21, 'https://example.com/images/property21.jpg'), (22, 'https://example.com/images/property22.jpg'), (23, 'https://example.com/images/property23.jpg'), (24, 'https://example.com/images/property24.jpg'), (25, 'https://example.com/images/property25.jpg'), (26, 'https://example.com/images/property26.jpg'), (27, 'https://example.com/images/property27.jpg'), (28, 'https://example.com/images/property28.jpg'), (29, 'https://example.com/images/property29.jpg'), (30, 'https://example.com/images/property30.jpg'), (31, 'https://example.com/images/property31.jpg'), (32, 'https://example.com/images/property32.jpg'), (33, 'https://example.com/images/property33.jpg'), (34, 'https://example.com/images/property34.jpg'), (35, 'https://example.com/images/property35.jpg'), (36, 'https://example.com/images/property36.jpg'), (37, 'https://example.com/images/property37.jpg'), (38, 'https://example.com/images/property38.jpg'), (39, 'https://example.com/images/property39.jpg'), (40, 'https://example.com/images/property40.jpg'), (41, 'https://example.com/images/property41.jpg'), (42, 'https://example.com/images/property42.jpg'), (43, 'https://example.com/images/property43.jpg'), (44, 'https://example.com/images/property44.jpg'), (45, 'https://example.com/images/property45.jpg'), (46, 'https://example.com/images/property46.jpg'), (47, 'https://example.com/images/property47.jpg'), (48, 'https://example.com/images/property48.jpg'), (49, 'https://example.com/images/property49.jpg'), (50, 'https://example.com/images/property50.jpg')

select * from property_table

insert into amenities (amenity_name) values ('Swimming Pool'), ('Gym'), ('Clubhouse'), ('Playground'), ('Park'), ('Garden'), ('Lift'), ('Security'), ('Power Backup'), ('Parking'), ('Wi-Fi'), ('CCTV'), ('Intercom'), ('Fire Safety'), ('Community Hall'), ('Banquet Hall'), ('Library'), ('Indoor Games'), ('Outdoor Games'), ('Jogging Track'), ('Cycling Track'), ('Spa'), ('Sauna'), ('Jacuzzi'), ('Yoga Room'), ('Meditation Hall'), ('Shopping Center'), ('ATM'), ('Restaurant'), ('Café'), ('Bar'), ('Laundry'), ('Housekeeping'), ('Concierge'), ('Pet Area'), ('Kids Zone'), ('Daycare'), ('School'), ('Hospital'), ('Clinic'), ('Pharmacy'), ('Supermarket'), ('Convenience Store'), ('Bus Stop'), ('Metro Station'), ('Car Wash'), ('EV Charging'), ('Music Room'), ('Dance Studio'), ('Theatre'), ('Conference Room')
select * from amenities

insert into property_amenities (property_id, amenity_id) values 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), (9, 9), (10, 10), (11, 11), (12, 12), (13, 13), (14, 14), (15, 15), (16, 16), (17, 17), (18, 18), (19, 19), (20, 20), (21, 21), (22, 22), (23, 23), (24, 24), (25, 25), (26, 26), (27, 27), (28, 28), (29, 29), (30, 30), (31, 31), (32, 32), (33, 33), (34, 34), (35, 35), (36, 36), (37, 37), (38, 38), (39, 39), (40, 40), (41, 41), (42, 42), (43, 43), (44, 44), (45, 45), (46, 46), (47, 47), (48, 48), (49, 49), (50, 50)

select * from property_amenities

insert into rental_agreement (property_id, customer_id, start_date, end_date, monthly_rent, deposit_amount) values (1, 1, '2024-01-01', '2025-01-01', 25000.00, 50000.00), (2, 2, '2024-02-01', '2025-02-01', 40000.00, 80000.00), (3, 3, '2024-03-01', '2025-03-01', 30000.00, 60000.00), (4, 4, '2024-04-01', '2025-04-01', 18000.00, 36000.00), (5, 5, '2024-05-01', '2025-05-01', 35000.00, 70000.00), (6, 6, '2024-06-01', '2025-06-01', 28000.00, 56000.00), (7, 7, '2024-07-01', '2025-07-01', 50000.00, 100000.00), (8, 8, '2024-08-01', '2025-08-01', 22000.00, 44000.00), (9, 9, '2024-09-01', '2025-09-01', 32000.00, 64000.00), (10, 10, '2024-10-01', '2025-10-01', 60000.00, 120000.00), (11, 11, '2024-11-01', '2025-11-01', 42000.00, 84000.00), (12, 12, '2024-12-01', '2025-12-01', 25000.00, 50000.00), (13, 13, '2025-01-01', '2026-01-01', 27000.00, 54000.00), (14, 14, '2025-02-01', '2026-02-01', 33000.00, 66000.00), (15, 15, '2025-03-01', '2026-03-01', 45000.00, 90000.00), (16, 16, '2025-04-01', '2026-04-01', 55000.00, 110000.00), (17, 17, '2025-05-01', '2026-05-01', 24000.00, 48000.00), (18, 18, '2025-06-01', '2026-06-01', 38000.00, 76000.00), (19, 19, '2025-07-01', '2026-07-01', 20000.00, 40000.00), (20, 20, '2025-08-01', '2026-08-01', 65000.00, 130000.00), (21, 21, '2025-09-01', '2026-09-01', 48000.00, 96000.00), (22, 22, '2025-10-01', '2026-10-01', 52000.00, 104000.00), (23, 23, '2025-11-01', '2026-11-01', 30000.00, 60000.00), (24, 24, '2025-12-01', '2026-12-01', 35000.00, 70000.00), (25, 25, '2026-01-01', '2027-01-01', 28000.00, 56000.00), (26, 26, '2026-02-01', '2027-02-01', 40000.00, 80000.00), (27, 27, '2026-03-01', '2027-03-01', 22000.00, 44000.00), (28, 28, '2026-04-01', '2027-04-01', 37000.00, 74000.00), (29, 29, '2026-05-01', '2027-05-01', 60000.00, 120000.00), (30, 30, '2026-06-01', '2027-06-01', 45000.00, 90000.00), (31, 31, '2026-07-01', '2027-07-01', 32000.00, 64000.00), (32, 32, '2026-08-01', '2027-08-01', 25000.00, 50000.00), (33, 33, '2026-09-01', '2027-09-01', 55000.00, 110000.00), (34, 34, '2026-10-01', '2027-10-01', 42000.00, 84000.00), (35, 35, '2026-11-01', '2027-11-01', 27000.00, 54000.00), (36, 36, '2026-12-01', '2027-12-01', 38000.00, 76000.00), (37, 37, '2027-01-01', '2028-01-01', 24000.00, 48000.00), (38, 38, '2027-02-01', '2028-02-01', 30000.00, 60000.00), (39, 39, '2027-03-01', '2028-03-01', 20000.00, 40000.00), (40, 40, '2027-04-01', '2028-04-01', 65000.00, 130000.00), (41, 41, '2027-05-01', '2028-05-01', 48000.00, 96000.00), (42, 42, '2027-06-01', '2028-06-01', 52000.00, 104000.00), (43, 43, '2027-07-01', '2028-07-01', 30000.00, 60000.00), (44, 44, '2027-08-01', '2028-08-01', 35000.00, 70000.00), (45, 45, '2027-09-01', '2028-09-01', 28000.00, 56000.00), (46, 46, '2027-10-01', '2028-10-01', 40000.00, 80000.00), (47, 47, '2027-11-01', '2028-11-01', 22000.00, 44000.00), (48, 48, '2027-12-01', '2028-12-01', 37000.00, 74000.00), (49, 49, '2028-01-01', '2029-01-01', 60000.00, 120000.00), (50, 50, '2028-02-01', '2029-02-01', 45000.00, 90000.00)
 select * from rental_agreement
 
insert into sales (property_id, customer_id, agent_id, sale_price, sale_date) values (1, 1, 1, 5500000.00, '2024-01-15'), (2, 2, 2, 12500000.00, '2024-02-20'), (3, 3, 3, 8000000.00, '2024-03-10'), (4, 4, 4, 4500000.00, '2024-04-05'), (5, 5, 5, 9500000.00, '2024-05-12'), (6, 6, 6, 7000000.00, '2024-06-18'), (7, 7, 7, 15000000.00, '2024-07-22'), (8, 8, 8, 6000000.00, '2024-08-30'), (9, 9, 9, 8500000.00, '2024-09-14'), (10, 10, 10, 30000000.00, '2024-10-25'), (11, 11, 11, 12000000.00, '2024-11-05'), (12, 12, 12, 9500000.00, '2024-12-19'), (13, 13, 13, 5000000.00, '2025-01-08'), (14, 14, 14, 7500000.00, '2025-02-11'), (15, 15, 15, 20000000.00, '2025-03-20'), (16, 16, 16, 35000000.00, '2025-04-15'), (17, 17, 17, 10000000.00, '2025-05-09'), (18, 18, 18, 18000000.00, '2025-06-22'), (19, 19, 19, 4000000.00, '2025-07-13'), (20, 20, 20, 22000000.00, '2025-08-27'), (21, 21, 21, 15000000.00, '2025-09-18'), (22, 22, 22, 25000000.00, '2025-10-10'), (23, 23, 23, 12000000.00, '2025-11-05'), (24, 24, 24, 8000000.00, '2025-12-14'), (25, 25, 25, 30000000.00, '2026-01-07'), (26, 26, 26, 20000000.00, '2026-02-11'), (27, 27, 27, 10000000.00, '2026-03-20'), (28, 28, 28, 15000000.00, '2026-04-15'), (29, 29, 29, 50000000.00, '2026-05-09'), (30, 30, 30, 35000000.00, '2026-06-22'), (31, 31, 31, 40000000.00, '2026-07-13'), (32, 32, 32, 12000000.00, '2026-08-27'), (33, 33, 33, 25000000.00, '2026-09-18'), (34, 34, 34, 18000000.00, '2026-10-10'), (35, 35, 35, 60000000.00, '2026-11-05'), (36, 36, 36, 45000000.00, '2026-12-14'), (37, 37, 37, 15000000.00, '2027-01-07'), (38, 38, 38, 8000000.00, '2027-02-11'), (39, 39, 39, 10000000.00, '2027-03-20'), (40, 40, 40, 20000000.00, '2027-04-15'), (41, 41, 41, 12000000.00, '2027-05-09'), (42, 42, 42, 15000000.00, '2027-06-22'), (43, 43, 43, 10000000.00, '2027-07-13'), (44, 44, 44, 8000000.00, '2027-08-27'), (45, 45, 45, 5000000.00, '2027-09-18'), (46, 46, 46, 3000000.00, '2027-10-10'), (47, 47, 47, 4000000.00, '2027-11-05'), (48, 48, 48, 3500000.00, '2027-12-14'), (49, 49, 49, 2500000.00, '2028-01-07'), (50, 50, 50, 3000000.00, '2028-02-11')
 
insert into payment (customer_id, property_id, payment_type, amount, payment_date, payment_method) values (1, 1, 'rent', 25000.00, '2024-01-05', 'UPI'), (2, 2, 'sale', 12500000.00, '2024-02-20', 'Bank Transfer'), (3, 3, 'deposit', 60000.00, '2024-03-01', 'Credit Card'), (4, 4, 'rent', 18000.00, '2024-04-07', 'Cash'), (5, 5, 'sale', 9500000.00, '2024-05-12', 'Cheque'), (6, 6, 'deposit', 56000.00, '2024-06-01', 'Debit Card'), (7, 7, 'rent', 50000.00, '2024-07-10', 'UPI'), (8, 8, 'sale', 6000000.00, '2024-08-30', 'Bank Transfer'), (9, 9, 'deposit', 64000.00, '2024-09-02', 'Credit Card'), (10, 10, 'rent', 60000.00, '2024-10-05', 'Cash'), (11, 11, 'sale', 12000000.00, '2024-11-05', 'Cheque'), (12, 12, 'deposit', 50000.00, '2024-12-01', 'Debit Card'), (13, 13, 'rent', 27000.00, '2025-01-08', 'UPI'), (14, 14, 'sale', 7500000.00, '2025-02-11', 'Bank Transfer'), (15, 15, 'deposit', 90000.00, '2025-03-01', 'Credit Card'), (16, 16, 'rent', 55000.00, '2025-04-15', 'Cash'), (17, 17, 'sale', 10000000.00, '2025-05-09', 'Cheque'), (18, 18, 'deposit', 76000.00, '2025-06-01', 'Debit Card'), (19, 19, 'rent', 20000.00, '2025-07-13', 'UPI'), (20, 20, 'sale', 22000000.00, '2025-08-27', 'Bank Transfer'), (21, 21, 'deposit', 96000.00, '2025-09-01', 'Credit Card'), (22, 22, 'rent', 52000.00, '2025-10-10', 'Cash'), (23, 23, 'sale', 12000000.00, '2025-11-05', 'Cheque'), (24, 24, 'deposit', 70000.00, '2025-12-01', 'Debit Card'), (25, 25, 'rent', 28000.00, '2026-01-07', 'UPI'), (26, 26, 'sale', 20000000.00, '2026-02-11', 'Bank Transfer'), (27, 27, 'deposit', 44000.00, '2026-03-01', 'Credit Card'), (28, 28, 'rent', 37000.00, '2026-04-15', 'Cash'), (29, 29, 'sale', 50000000.00, '2026-05-09', 'Cheque'), (30, 30, 'deposit', 90000.00, '2026-06-01', 'Debit Card'), (31, 31, 'rent', 32000.00, '2026-07-13', 'UPI'), (32, 32, 'sale', 12000000.00, '2026-08-27', 'Bank Transfer'), (33, 33, 'deposit', 110000.00, '2026-09-01', 'Credit Card'), (34, 34, 'rent', 42000.00, '2026-10-10', 'Cash'), (35, 35, 'sale', 60000000.00, '2026-11-05', 'Cheque'), (36, 36, 'deposit', 76000.00, '2026-12-01', 'Debit Card'), (37, 37, 'rent', 24000.00, '2027-01-07', 'UPI'), (38, 38, 'sale', 8000000.00, '2027-02-11', 'Bank Transfer'), (39, 39, 'deposit', 40000.00, '2027-03-01', 'Credit Card'), (40, 40, 'rent', 65000.00, '2027-04-15', 'Cash'), (41, 41, 'sale', 12000000.00, '2027-05-09', 'Cheque'), (42, 42, 'deposit', 104000.00, '2027-06-01', 'Debit Card'), (43, 43, 'rent', 30000.00, '2027-07-13', 'UPI'), (44, 44, 'sale', 8000000.00, '2027-08-27', 'Bank Transfer'), (45, 45, 'deposit', 56000.00, '2027-09-01', 'Credit Card'), (46, 46, 'rent', 40000.00, '2027-10-10', 'Cash'), (47, 47, 'sale', 4000000.00, '2027-11-05', 'Cheque'), (48, 48, 'deposit', 74000.00, '2027-12-01', 'Debit Card'), (49, 49, 'rent', 60000.00, '2028-01-07', 'UPI'), (50, 50, 'sale', 3000000.00, '2028-02-11', 'Bank Transfer')

insert into maintenance_request (property_id, customer_id, request_date, issue_description, status) values (1, 1, '2024-01-10', 'Leaking faucet in kitchen', 'pending'), (2, 2, '2024-02-12', 'Electrical wiring issue in living room', 'In-progress'), (3, 3, '2024-03-05', 'Broken window in bedroom', 'completed'), (4, 4, '2024-04-08', 'Air conditioner not working', 'pending'), (5, 5, '2024-05-15', 'Water seepage in bathroom wall', 'In-progress'), (6, 6, '2024-06-20', 'Paint peeling in hallway', 'completed'), (7, 7, '2024-07-02', 'Elevator malfunction', 'pending'), (8, 8, '2024-08-11', 'Cracked tiles in kitchen', 'In-progress'), (9, 9, '2024-09-09', 'Door lock replacement needed', 'completed'), (10, 10, '2024-10-14', 'Ceiling fan repair required', 'pending'), (11, 11, '2024-11-18', 'Water heater not functioning', 'In-progress'), (12, 12, '2024-12-22', 'Broken balcony railing', 'completed'), (13, 13, '2025-01-07', 'Clogged drainage in bathroom', 'pending'), (14, 14, '2025-02-10', 'Lighting fixtures replacement', 'In-progress'), (15, 15, '2025-03-12', 'Roof leakage during rain', 'completed'), (16, 16, '2025-04-05', 'Termite infestation in wooden doors', 'pending'), (17, 17, '2025-05-09', 'Broken glass partition', 'In-progress'), (18, 18, '2025-06-15', 'Gas pipeline inspection required', 'completed'), (19, 19, '2025-07-20', 'Water tank cleaning needed', 'pending'), (20, 20, '2025-08-25', 'Damaged flooring in living room', 'In-progress'), (21, 21, '2025-09-02', 'Intercom not working', 'completed'), (22, 22, '2025-10-06', 'Wall cracks in bedroom', 'pending'), (23, 23, '2025-11-11', 'Broken staircase railing', 'In-progress'), (24, 24, '2025-12-15', 'Plumbing leakage in kitchen sink', 'completed'), (25, 25, '2026-01-05', 'Garage door not opening', 'pending'), (26, 26, '2026-02-09', 'Damaged roof tiles', 'In-progress'), (27, 27, '2026-03-01', 'Broken bathroom mirror', 'completed'), (28, 28, '2026-03-10', 'Water pressure issue', 'pending'), (29, 29, '2026-03-15', 'Damaged wooden flooring', 'In-progress'), (30, 30, '2026-03-20', 'AC filter replacement needed', 'completed'), (31, 31, '2026-03-25', 'Kitchen exhaust fan repair', 'pending'), (32, 32, '2026-03-28', 'Broken doorbell', 'In-progress'), (33, 33, '2026-03-29', 'Wall painting required', 'completed'), (34, 34, '2026-03-30', 'Water leakage in ceiling', 'pending'), (35, 35, '2026-03-31', 'Damaged window blinds', 'In-progress'), (36, 36, '2026-04-01', 'Broken cupboard hinges', 'completed'), (37, 37, '2026-04-02', 'Garden sprinkler not working', 'pending'), (38, 38, '2026-04-03', 'Garage light replacement', 'In-progress'), (39, 39, '2026-04-04', 'Broken bathroom door handle', 'completed'), (40, 40, '2026-04-05', 'Water leakage in basement', 'pending'), (41, 41, '2026-04-06', 'Damaged balcony tiles', 'In-progress'), (42, 42, '2026-04-07', 'Kitchen sink clogging', 'completed'), (43, 43, '2026-04-08', 'Broken curtain rod', 'pending'), (44, 44, '2026-04-09', 'Ceiling plaster cracks', 'In-progress'), (45, 45, '2026-04-10', 'Water purifier servicing', 'completed'), (46, 46, '2026-04-11', 'Broken bathroom tap', 'pending'), (47, 47, '2026-04-12', 'Damaged staircase tiles', 'In-progress'), (48, 48, '2026-04-13', 'Kitchen chimney cleaning', 'completed'), (49, 49, '2026-04-14', 'Broken balcony door lock', 'pending'), (50, 50, '2026-04-15', 'Water leakage in terrace', 'In-progress')

insert into staff (staff_name, staff_role, phone, email) values ('Arun Kumar', 'Maintenance Supervisor', '9876543210', 'arun.kumar@example.com'), ('Priya Sharma', 'Electrician', '9123456780', 'priya.sharma@example.com'), ('Ravi Menon', 'Plumber', '9988776655', 'ravi.menon@example.com'), ('Sneha Iyer', 'Housekeeping Staff', '9012345678', 'sneha.iyer@example.com'), ('Vikram Rao', 'Security Guard', '9098765432', 'vikram.rao@example.com'), ('Meena Das', 'Receptionist', '9345678901', 'meena.das@example.com'), ('Karthik Nair', 'HVAC Technician', '9456123789', 'karthik.nair@example.com'), ('Anjali Gupta', 'Carpenter', '9321456789', 'anjali.gupta@example.com'), ('Suresh Reddy', 'Painter', '9876123450', 'suresh.reddy@example.com'), ('Divya Singh', 'Gardener', '9765432109', 'divya.singh@example.com'), ('Manoj Pillai', 'Lift Operator', '9654321098', 'manoj.pillai@example.com'), ('Lakshmi Rao', 'Janitor', '9543210987', 'lakshmi.rao@example.com'), ('Ajay Verma', 'Security Supervisor', '9432109876', 'ajay.verma@example.com'), ('Neha Kapoor', 'Front Desk Executive', '9321098765', 'neha.kapoor@example.com'), ('Rajesh Patil', 'Maintenance Worker', '9210987654', 'rajesh.patil@example.com'), ('Pooja Mishra', 'Housekeeping Supervisor', '9109876543', 'pooja.mishra@example.com'), ('Santosh Kumar', 'Electrician', '9898765432', 'santosh.kumar@example.com'), ('Ritika Jain', 'Plumber', '9787654321', 'ritika.jain@example.com'), ('Ashok Mehta', 'Carpenter', '9676543210', 'ashok.mehta@example.com'), ('Shalini Roy', 'Painter', '9565432109', 'shalini.roy@example.com'), ('Deepak Yadav', 'Gardener', '9454321098', 'deepak.yadav@example.com'), ('Kavita Joshi', 'Receptionist', '9343210987', 'kavita.joshi@example.com'), ('Naveen Thomas', 'Security Guard', '9232109876', 'naveen.thomas@example.com'), ('Swati Kulkarni', 'Janitor', '9121098765', 'swati.kulkarni@example.com'), ('Ganesh Babu', 'Lift Operator', '9010987654', 'ganesh.babu@example.com'), ('Radhika Sen', 'Housekeeping Staff', '9909876543', 'radhika.sen@example.com'), ('Harish Chandra', 'Maintenance Supervisor', '9812345678', 'harish.chandra@example.com'), ('Sunita Agarwal', 'Front Desk Executive', '9723456789', 'sunita.agarwal@example.com'), ('Vivek Malhotra', 'Security Supervisor', '9634567890', 'vivek.malhotra@example.com'), ('Anita Desai', 'Receptionist', '9545678901', 'anita.desai@example.com'), ('Rohan Gupta', 'Electrician', '9456789012', 'rohan.gupta@example.com'), ('Seema Rani', 'Plumber', '9367890123', 'seema.rani@example.com'), ('Mahesh Iyer', 'Carpenter', '9278901234', 'mahesh.iyer@example.com'), ('Preeti Sharma', 'Painter', '9189012345', 'preeti.sharma@example.com'), ('Arvind Nair', 'Gardener', '9090123456', 'arvind.nair@example.com'), ('Geeta Menon', 'Housekeeping Supervisor', '9981234567', 'geeta.menon@example.com'), ('Sanjay Rao', 'Security Guard', '9872345678', 'sanjay.rao@example.com'), ('Bhavna Das', 'Janitor', '9763456789', 'bhavna.das@example.com'), ('Mukesh Reddy', 'Lift Operator', '9654567890', 'mukesh.reddy@example.com'), ('Nisha Singh', 'Receptionist', '9545678901', 'nisha.singh@example.com'), ('Anand Pillai', 'Security Supervisor', '9436789012', 'anand.pillai@example.com'), ('Shreya Kapoor', 'Front Desk Executive', '9327890123', 'shreya.kapoor@example.com'), ('Ramesh Patil', 'Maintenance Worker', '9218901234', 'ramesh.patil@example.com'), ('Meera Mishra', 'Housekeeping Staff', '9109012345', 'meera.mishra@example.com'), ('Vijay Kumar', 'Electrician', '9990123456', 'vijay.kumar@example.com'), ('Anju Jain', 'Plumber', '9881234567', 'anju.jain@example.com'), ('Suraj Mehta', 'Carpenter', '9772345678', 'suraj.mehta@example.com'), ('Pallavi Roy', 'Painter', '9663456789', 'pallavi.roy@example.com'), ('Krishna Yadav', 'Gardener', '9554567890', 'krishna.yadav@example.com'), ('Smita Joshi', 'Receptionist', '9445678901', 'smita.joshi@example.com')

insert into visits (property_id, customer_id, agent_id, visit_date, remarks) values (1, 1, 1, '2024-01-10', 'Customer interested in 2BHK apartment.'), (2, 2, 1, '2024-02-12', 'Villa visit, customer asked about garden size.'), (3, 3, 3, '2024-03-05', 'Penthouse visit, customer liked city view.'), (4, 4, 4, '2024-04-08', 'Studio visit, customer concerned about space.'), (5, 5, 5, '2024-05-15', 'Duplex visit, customer requested price negotiation.'), (6, 6, 6, '2024-06-20', 'Row house visit, customer asked about parking.'), (7, 7, 7, '2024-07-02', 'Bungalow visit, customer impressed with lawn.'), (8, 8, 8, '2024-08-11', 'Farmhouse visit, customer asked about water supply.'), (9, 9, 9, '2024-09-09', 'Cottage visit, customer liked peaceful area.'), (10, 10, 10, '2024-10-14', 'Condominium visit, customer asked about amenities.'), (11, 11, 11, '2024-11-18', 'Townhouse visit, customer requested loan options.'), (12, 12, 12, '2024-12-22', 'Loft visit, customer liked modern design.'), (13, 13, 13, '2025-01-07', 'Serviced apartment visit, customer asked about maintenance.'), (14, 14, 14, '2025-02-10', 'Independent house visit, customer requested second visit.'), (15, 15, 15, '2025-03-12', 'Chalet visit, customer impressed with interiors.'), (16, 16, 16, '2025-04-05', 'Mansion visit, customer asked about security.'), (17, 17, 17, '2025-05-09', 'Dormitory visit, customer asked about student facilities.'), (18, 18, 18, '2025-06-15', 'Guest house visit, customer requested rental details.'), (19, 19, 19, '2025-07-20', 'Hostel visit, customer asked about shared rooms.'), (20, 20, 20, '2025-08-25', 'Office space visit, customer asked about lease terms.'), (21, 21, 21, '2025-09-02', 'Retail shop visit, customer asked about footfall.'), (22, 22, 22, '2025-10-06', 'Warehouse visit, customer asked about loading dock.'), (23, 23, 23, '2025-11-11', 'Factory visit, customer asked about power supply.'), (24, 24, 24, '2025-12-15', 'Industrial shed visit, customer requested price cut.'), (25, 25, 25, '2026-01-05', 'Cold storage visit, customer asked about refrigeration.'), (26, 26, 26, '2026-02-09', 'Showroom visit, customer impressed with location.'), (27, 27, 27, '2026-03-01', 'Co-working space visit, customer asked about internet speed.'), (28, 28, 28, '2026-03-10', 'Clinic visit, customer asked about parking.'), (29, 29, 29, '2026-03-15', 'Hospital visit, customer asked about nearby facilities.'), (30, 30, 30, '2026-03-20', 'School visit, customer asked about playground.'), (31, 31, 31, '2026-03-25', 'College visit, customer asked about hostel facilities.'), (32, 32, 32, '2026-03-28', 'Training center visit, customer asked about equipment.'), (33, 33, 33, '2026-03-29', 'Banquet hall visit, customer asked about capacity.'), (34, 34, 34, '2026-03-30', 'Community hall visit, customer asked about rental charges.'), (35, 35, 35, '2026-03-31', 'Hotel visit, customer asked about star rating.'), (36, 36, 36, '2026-04-01', 'Resort visit, customer impressed with pool.'), (37, 37, 37, '2026-04-02', 'Restaurant visit, customer asked about seating capacity.'), (38, 38, 38, '2026-04-03', 'Café visit, customer liked ambiance.'), (39, 39, 39, '2026-04-04', 'Bar visit, customer asked about license.'), (40, 40, 40, '2026-04-05', 'Clubhouse visit, customer asked about membership.'), (41, 41, 41, '2026-04-06', 'Gym visit, customer asked about trainers.'), (42, 42, 42, '2026-04-07', 'Swimming pool visit, customer asked about maintenance.'), (43, 43, 43, '2026-04-08', 'Playground visit, customer asked about safety.'), (44, 44, 44, '2026-04-09', 'Park visit, customer asked about timings.'), (45, 45, 45, '2026-04-10', 'Library visit, customer asked about membership.'), (46, 46, 46, '2026-04-11', 'Temple visit, customer asked about donations.'), (47, 47, 47, '2026-04-12', 'Church visit, customer asked about services.'), (48, 48, 48, '2026-04-13', 'Mosque visit, customer asked about prayer timings.'), (49, 49, 49, '2026-04-14', 'Synagogue visit, customer asked about community events.'), (50, 50, 50, '2026-04-15', 'Pagoda visit, customer asked about cultural programs.')

select * from visits
--1. List all Available properties with owner name and city.

select o.owner_name,pl.city,pd.status from owners as o
join property_location as pl on o.owner_id=pl.location_id
join property_detail as pd on pl.location_id=pd.property_id where
status ='Available'

--2.Show properties that are Sold with sale price and sale date.

select pd.status,s.sale_price,s.sale_date from
property_detail as pd join sales as s on pd.property_id=s.property_id
where status='Sold'

--3.Find all properties located in Chennai.

select location_id,city from property_location where city="Chennai"


--4.Display properties with price greater than 1 Crore.

select* from sales where sale_price >100000000

--5.list property along with their property_type and name

select pt.type_id,pt.type_name,pl.city,pl.area,pd.price,pd.size_sqft
from property_type as pt join property_location as pl on pt.type_id=pl.location_id
join property_detail as pd on pl.location_id=pd.location_id

--6. find properties handled by specific agent

--7.find the most expensive property
select property_id,size_sqft,price from property_detail
order by price desc limit 1

select property_id,size_sqft,price from property_detail
order by price desc

--8. Find the smallest property based on size

select * from property_detail order by size_sqft
asc limit 1

--9.List all customers who are Buyers.

select * from customers where customer_type="Buyer"

--10.List all customers who are Tenants.

select * from customers where customer_type="Tenant"

--11.Find customers who purchased property above 50 Lakhs.

select c.customer_id,c.customer_type,s.sale_price from
customers as c join sales as s on c.customer_id=s.customer_id
where s.sale_price >5000000 and customer_type='Buyer'

--12.Find customers who rented property in 2025.

select c.customer_id,c.customer_name,p.payment_type,p.amount,p.payment_date
from customers as c join  payment as p on c.customer_id=p.customer_id
where p.payment_type='rent' and p.payment_date > 2025-01-01

--13.Show customers along with property details they purchased

select customer_id,customer_name,type_name, status from
customers as c join property_type as pt on c.customer_id=pt.type_id
join property_detail as pd on pt.type_id=pd.type_id
where status ='Sold'

--14.Find customers who made payments using UPI.

select c.customer_id,c.customer_name,p.payment_method
from customers as  c join payment as p on c.customer_id=p.customer_id
where payment_method='UPI'

--15.List customers who paid deposit.

select c.customer_id,c.customer_name,ra.deposit_amount
from customers as c join rental_agreement as ra on
c.customer_id=ra.customer_id where ra.deposit_amount > 0

--16) Find customers who visited more than one property.
select c.customer_id,c.customer_name from
customers as c join visits as v on c.customer_id=v.customer_id
group by c.customer_id,c.customer_name having count(v.property_id) >1

--17.Show total sales handled by each agent.
select a.agent_id,a.agent_name,sum(s.sale_price) from agent as a
join sales as s on a.agent_id=s.agent_id group by a.agent_id,a.agent_name

--18.Calculate total commission earned by each agent.
select agent_id,agent_name,sum(commission_rate) as total_commission
from agent group by agent_id

--19.Count total visits managed by each agent
select a.agent_id,a.agent_name,count(v.visit_id) as total_visit from
agent as a join visits as v on a.agent_id=v.agent_id
group by a.agent_id,a.agent_name

--20) Rank agents based on revenue

select a.agent_id,a.agent_name,sum(s.sale_price) as total_revenue,
rank() over(order by sum(s.sale_price) desc) as revenue_rank
from agent as a join sales as s on a.agent_id=s.agent_id
group by a.agent_id,a.agent_name

--21) Calculate total revenue from sales
select sale_id,sum(sale_price) as total_revenue from
sales group by sale_id

--22) Calculate average sale price
select sale_id,avg(sale_price) as avg_sale_price from
sales group by sale_id

--23)Show properties with deposit amount greater than ₹1,00,000

select pl.location_id,pl.city,pl.area,ra.deposit_amount
from property_location as pl join rental_agreement as ra on pl.location_id=ra.property_id
where deposit_amount >100000

--24) Find top 5 highest sale transactions.
select * from sales order by sale_price desc limit 5

--25)List all payments made in 2025

select * from payment where payment_date between"2025-01-01" and "2025-12-31"

--26.Show total payments by each customer

select c.customer_id,c.customer_name,sum(p.amount) as total_payment
from customers as c join payment as p on c.customer_id=p.customer_id
group by c.customer_id,c.customer_name

--27)Find pending maintenance requests.
select * from maintenance_request where status='pending'

--28) Count completed maintenance requests
select count(*) as total_complete from maintenance_request
where status='Completed'

--29)Count properties in each city
select pl.city,pl.state,count(pd.property_id) from
property_location as pl join property_detail as pd
on pl.location_id=pd.location_id group by pl.city,pl.state

--30)Count properties by status (Available, Sold, Rented)

select status, count(location_id) from property_detail group by status

--31)Rank properties based on price

select property_id,price,rank()
over (order by price desc) as price_rank
from property_detail

--32)Rank agents based on total sales revenue

select agent_id,sale_price,rank()
over (order by sale_price desc) as total_sale_revenue
from sales

--33) Show previous sale amount using LAG()

select property_id, customer_id, agent_id, sale_price, sale_date,
lag(sale_price) over(order by sale_date) as previous_sale_amount
from sales

34)Show next sale amount using LEAD()

select property_id, customer_id, agent_id, sale_price, sale_date,
lead(sale_price) over(order by sale_date) as next_sale_amount
from sales

#35) Dense rank properties by price within each city
select pl.city,pd.property_id,pd.price,dense_rank() over (partition by pl.city order by pd.price desc) as price_rank
from property_detail as pd
join property_location as pl 
on pd.location_id = pl.location_id 