-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: smart_interview_portal
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ai_interview_results`
--

DROP TABLE IF EXISTS `ai_interview_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ai_interview_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `job_role` varchar(100) DEFAULT NULL,
  `score` int DEFAULT NULL,
  `feedback` text,
  `interview_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_interview_results`
--

LOCK TABLES `ai_interview_results` WRITE;
/*!40000 ALTER TABLE `ai_interview_results` DISABLE KEYS */;
INSERT INTO `ai_interview_results` VALUES (1,'yeshu4747@gmail.com','AI Generated Interview',1,'Need more preparation and practical knowledge.','2026-07-18 16:48:57'),(2,'yeshu4747@gmail.com','AI Generated Interview',0,'Need more preparation and practical knowledge.','2026-07-18 17:19:39'),(3,'yeshu4747@gmail.com','AI Generated Interview',0,'Your answers need improvement. Add more details and examples.','2026-07-18 19:32:19'),(4,'yeshu4747@gmail.com','AI Generated Interview',0,'Your answers need improvement. Add more details and examples.','2026-07-18 19:32:44'),(5,'yeshu4747@gmail.com','AI Generated Interview',0,'Your answers need improvement. Add more details and examples.','2026-07-18 19:32:49'),(6,'yeshu4747@gmail.com','AI Generated Interview',0,'Your answers need improvement. Add more details and examples.','2026-07-18 19:33:04'),(7,'yeshu4747@gmail.com','AI Generated Interview',0,'Your answers need improvement. Add more details and examples.','2026-07-18 19:44:39'),(8,'yeshu4747@gmail.com','AI Generated Interview',0,'Your answers need improvement. Add more details and examples.','2026-07-18 19:46:18'),(9,'yeshu4747@gmail.com','AI Generated Interview',0,'Your answers need improvement. Add more details and examples.','2026-07-18 19:46:19'),(10,'yeshu4747@gmail.com','AI Generated Interview',7,'Your answers need improvement. Add more details and examples.','2026-07-18 19:57:27'),(11,'yeshu4747@gmail.com','AI Generated Interview',81,'Excellent interview performance.','2026-07-18 20:09:19'),(12,'yeshu4747@gmail.com','AI Generated Interview',81,'Excellent interview performance.','2026-07-18 20:21:08');
/*!40000 ALTER TABLE `ai_interview_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aptitude_questions`
--

DROP TABLE IF EXISTS `aptitude_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aptitude_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aptitude_questions`
--

LOCK TABLES `aptitude_questions` WRITE;
/*!40000 ALTER TABLE `aptitude_questions` DISABLE KEYS */;
INSERT INTO `aptitude_questions` VALUES (1,'What is 25% of 200?','25','50','75','100','50','Easy'),(2,'If the cost price is ₹500 and selling price is ₹600, what is the profit?','₹50','₹75','₹100','₹150','₹100','Easy'),(3,'Find the average of 10, 20, 30, 40, 50.','25','30','35','40','30','Easy'),(4,'A shopkeeper buys an item for ₹800 and sells it for ₹1000. Profit percentage?','20%','25%','30%','40%','25%','Easy'),(5,'What is 15% of 400?','40','50','60','80','60','Easy'),(6,'The ratio of boys to girls is 3:2. If boys are 30, girls are?','15','20','25','30','20','Easy'),(7,'Simple Interest on ₹1000 at 10% for 2 years?','₹100','₹150','₹200','₹250','₹200','Easy'),(8,'What is 40% of 250?','80','90','100','110','100','Easy'),(9,'Which number is divisible by both 2 and 5?','35','40','63','81','40','Easy'),(10,'The sum of first five natural numbers is?','10','15','20','25','15','Easy'),(11,'Find 20% of 150.','20','25','30','35','30','Easy'),(12,'The average of 5, 10 and 15 is?','8','10','12','15','10','Easy'),(13,'A train travels 60 km in 1 hour. Its speed is?','50 km/h','60 km/h','70 km/h','80 km/h','60 km/h','Easy'),(14,'The value of 12 × 8 is?','84','92','96','104','96','Easy'),(15,'If x = 15 and y = 5, x ÷ y = ?','2','3','4','5','3','Easy'),(16,'The next number in the series: 2, 4, 6, 8, ?','9','10','11','12','10','Easy'),(17,'What is 50% of 90?','40','45','50','55','45','Easy'),(18,'How many months are there in 3 years?','24','30','36','48','36','Easy'),(19,'Find 9².','72','81','90','99','81','Easy'),(20,'The LCM of 4 and 6 is?','8','10','12','16','12','Easy'),(21,'What is 25% of 240?','50','60','70','80','60','Medium'),(22,'A train travels 120 km in 2 hours. What is its speed?','50 km/h','60 km/h','70 km/h','80 km/h','60 km/h','Medium'),(23,'If x + 15 = 40, then x = ?','20','25','30','35','25','Medium'),(24,'The average of 10, 20, 30, 40, 50 is?','20','25','30','35','30','Medium'),(25,'A shopkeeper gives 10% discount on ₹500. Selling price is?','₹450','₹460','₹470','₹480','₹450','Medium'),(26,'What is 18 × 12?','206','216','226','236','216','Medium'),(27,'If a pen costs ₹15, how much do 12 pens cost?','₹170','₹180','₹190','₹200','₹180','Medium'),(28,'The ratio 8:12 is equal to?','1:2','2:3','3:4','4:5','2:3','Medium'),(29,'If 20 workers finish a job in 10 days, 10 workers take?','15 days','20 days','25 days','30 days','20 days','Medium'),(30,'Find the next number: 5, 10, 20, 40, ?','60','70','80','90','80','Medium'),(31,'If the perimeter of a square is 36 cm, one side is?','8 cm','9 cm','10 cm','12 cm','9 cm','Medium'),(32,'Simple Interest on ₹1000 at 10% for 2 years is?','₹100','₹150','₹200','₹250','₹200','Medium'),(33,'A number is divisible by both 2 and 3. It must also be divisible by?','4','5','6','9','6','Medium'),(34,'Find the missing number: 3, 6, 12, 24, ?','36','42','48','50','48','Medium'),(35,'A man buys an item for ₹400 and sells it for ₹480. Profit percentage is?','10%','15%','20%','25%','20%','Medium'),(36,'The area of a rectangle is 60 cm² and length is 12 cm. Breadth is?','4 cm','5 cm','6 cm','7 cm','5 cm','Medium'),(37,'If 7x = 56, x = ?','6','7','8','9','8','Medium'),(38,'Find the odd one out: 2, 4, 8, 16, 18','2','4','16','18','18','Medium'),(39,'The average of 15 and 25 is?','18','19','20','21','20','Medium'),(41,'A sum doubles in 5 years at simple interest. In how many years will it become triple?','8','10','12','15','10','Hard'),(42,'The HCF of 48 and 72 is?','12','18','24','36','24','Hard'),(43,'The LCM of 12 and 18 is?','24','30','36','48','36','Hard'),(44,'If the ratio of boys to girls is 3:2 and there are 30 boys, how many girls are there?','18','20','22','24','20','Hard'),(45,'A train 150 m long crosses a pole in 10 seconds. Speed is?','15 m/s','20 m/s','25 m/s','30 m/s','15 m/s','Hard'),(46,'Find the next number: 2, 6, 12, 20, 30, ?','36','40','42','44','42','Hard'),(47,'A person spends 75% of his income. If he saves ₹5000, his income is?','₹15000','₹18000','₹20000','₹22000','₹20000','Hard'),(48,'A cube has side 5 cm. Its volume is?','100','115','125','150','125','Hard'),(49,'A man walks at 5 km/h. How far does he walk in 2 hours 24 minutes?','10 km','11 km','12 km','13 km','12 km','Hard'),(50,'If 3 pencils cost ₹18, then 8 pencils cost?','₹42','₹46','₹48','₹50','₹48','Hard');
/*!40000 ALTER TABLE `aptitude_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_bank`
--

DROP TABLE IF EXISTS `interview_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `skill` varchar(50) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  `question` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_bank`
--

LOCK TABLES `interview_bank` WRITE;
/*!40000 ALTER TABLE `interview_bank` DISABLE KEYS */;
INSERT INTO `interview_bank` VALUES (1,'python','Easy','What is Python and why is it popular?'),(2,'python','Easy','What is the difference between list and tuple in Python?'),(3,'python','Easy','What are mutable and immutable objects in Python?'),(4,'python','Medium','Explain OOP concepts in Python.'),(5,'python','Medium','What are lambda functions in Python?'),(6,'python','Medium','Explain exception handling in Python.'),(7,'python','Hard','Explain Python memory management and garbage collection.'),(8,'python','Hard','Difference between deep copy and shallow copy.'),(9,'flask','Easy','What are the main features of Flask?'),(10,'flask','Easy','What is a Flask route?'),(11,'flask','Medium','Explain Flask application structure.'),(12,'flask','Medium','How do you connect Flask with MySQL database?'),(13,'flask','Medium','What are Flask templates and Jinja2?'),(14,'flask','Hard','How do you secure a Flask application?'),(15,'flask','Hard','Explain Flask sessions and cookies.'),(16,'sql','Easy','What is a database?'),(17,'sql','Easy','Difference between primary key and foreign key.'),(18,'sql','Easy','What is normalization in SQL?'),(19,'sql','Medium','Explain INNER JOIN, LEFT JOIN and RIGHT JOIN.'),(20,'sql','Medium','Difference between WHERE and HAVING clause.'),(21,'sql','Medium','What are indexes in SQL?'),(22,'sql','Hard','How do you optimize slow SQL queries?'),(23,'sql','Hard','Explain transactions and ACID properties.'),(24,'machine learning','Easy','What are the types of Machine Learning?'),(25,'machine learning','Easy','What is a dataset in Machine Learning?'),(26,'machine learning','Medium','Explain the Machine Learning workflow.'),(27,'machine learning','Medium','What is feature engineering?'),(28,'machine learning','Medium','Explain accuracy, precision and recall.'),(29,'machine learning','Hard','Explain gradient descent algorithm.'),(30,'machine learning','Hard','Difference between bagging and boosting.'),(31,'artificial intelligence','Easy','What is Artificial Intelligence?'),(32,'artificial intelligence','Easy','Difference between AI and Machine Learning.'),(33,'artificial intelligence','Medium','What are neural networks?'),(34,'artificial intelligence','Medium','Explain deep learning.'),(35,'artificial intelligence','Hard','Explain CNN architecture.'),(36,'artificial intelligence','Hard','Explain transformers in AI.'),(37,'data science','Easy','What is Data Science?'),(38,'data science','Easy','What is data preprocessing?'),(39,'data science','Medium','Explain data visualization.'),(40,'data science','Medium','What is exploratory data analysis?'),(41,'data science','Hard','How do you handle missing data?'),(42,'html','Easy','What are HTML tags?'),(43,'html','Medium','Difference between HTML and HTML5.'),(44,'css','Easy','What is CSS?'),(45,'css','Medium','Explain CSS box model.'),(46,'javascript','Easy','What is JavaScript?'),(47,'javascript','Medium','Difference between let, var and const.'),(48,'git','Easy','What is Git?'),(49,'git','Easy','What is GitHub?'),(50,'git','Medium','Explain git commit and git push.'),(51,'git','Hard','Explain branching strategy in Git.'),(52,'communication','Easy','Tell me about yourself.'),(53,'communication','Easy','Explain your project.'),(54,'communication','Medium','What challenges did you face in your project?'),(55,'communication','Medium','Why should we hire you?'),(56,'communication','Hard','Where do you see yourself after five years?'),(57,'sql','Easy','What is SQL and why is it used?'),(58,'sql','Easy','What is the difference between DBMS and RDBMS?'),(59,'sql','Easy','What are tables, rows, and columns in SQL?'),(60,'sql','Medium','Explain different types of SQL joins.'),(61,'sql','Medium','What is the difference between WHERE and HAVING clauses?'),(62,'sql','Medium','Explain primary key and foreign key.'),(63,'sql','Hard','How do you optimize a slow SQL query?'),(64,'sql','Hard','Explain normalization and its types.'),(65,'sql','Hard','What are indexes in SQL and why are they used?'),(66,'sql','Hard','Explain stored procedures and triggers in SQL.'),(67,'html','Easy','What is HTML?'),(68,'html','Easy','What are the basic tags in HTML?'),(69,'html','Easy','What is the difference between block and inline elements?'),(70,'html','Medium','Explain the difference between HTML and HTML5.'),(71,'html','Medium','What are semantic HTML tags?'),(72,'html','Medium','Explain forms and input types in HTML.'),(73,'html','Hard','How do you improve HTML page performance?'),(74,'html','Hard','Explain HTML accessibility features.'),(75,'html','Hard','What is the purpose of meta tags in HTML?'),(76,'html','Hard','How does HTML work with CSS and JavaScript?'),(77,'html','Easy','What is HTML?'),(78,'html','Easy','What are the basic tags in HTML?'),(79,'html','Easy','What is the difference between block and inline elements?'),(80,'html','Medium','Explain the difference between HTML and HTML5.'),(81,'html','Medium','What are semantic HTML tags?'),(82,'html','Medium','Explain forms and input types in HTML.'),(83,'html','Hard','How do you improve HTML page performance?'),(84,'html','Hard','Explain HTML accessibility features.'),(85,'html','Hard','What is the purpose of meta tags in HTML?'),(86,'html','Hard','How does HTML work with CSS and JavaScript?'),(87,'html','Easy','What is HTML?'),(88,'html','Easy','What are the basic tags in HTML?'),(89,'html','Easy','What is the difference between block and inline elements?'),(90,'html','Medium','Explain the difference between HTML and HTML5.'),(91,'html','Medium','What are semantic HTML tags?'),(92,'html','Medium','Explain forms and input types in HTML.'),(93,'html','Hard','How do you improve HTML page performance?'),(94,'html','Hard','Explain HTML accessibility features.'),(95,'html','Hard','What is the purpose of meta tags in HTML?'),(96,'html','Hard','How does HTML work with CSS and JavaScript?'),(97,'project management','Easy','What is software project management?'),(98,'project management','Easy','What are the responsibilities of a project manager?'),(99,'project management','Easy','What is project planning?'),(100,'project management','Medium','Explain project scheduling and resource management.'),(101,'project management','Medium','How do you manage project risks?'),(102,'project management','Medium','What are project milestones?'),(103,'project management','Hard','How do you handle project delays?'),(104,'project management','Hard','Explain project cost estimation techniques.'),(105,'project management','Hard','How do you manage team conflicts in a project?'),(106,'project management','Hard','Explain the importance of documentation in projects.'),(107,'ms office','Easy','What are the main applications in MS Office?'),(108,'ms office','Easy','What is MS Excel used for?'),(109,'ms office','Easy','What is the purpose of PowerPoint?'),(110,'ms office','Medium','Explain formulas and functions in Excel.'),(111,'ms office','Medium','What are pivot tables in Excel?'),(112,'ms office','Medium','How do you create professional presentations?'),(113,'ms office','Hard','How can Excel help in data analysis?'),(114,'ms office','Hard','Explain Excel charts and their uses.'),(115,'ms office','Hard','How do you protect data in MS Office files?'),(116,'ms office','Hard','How does MS Office improve productivity?'),(117,'communication','Easy','Why are communication skills important?'),(118,'communication','Easy','What are verbal and non-verbal communication skills?'),(119,'communication','Easy','How do you communicate in a team?'),(120,'communication','Medium','How do you handle misunderstandings in a team?'),(121,'communication','Medium','Explain the importance of active listening.'),(122,'communication','Medium','How do you explain technical concepts to non-technical people?'),(123,'communication','Hard','Describe a situation where you solved a conflict using communication.'),(124,'communication','Hard','How do you communicate project updates to stakeholders?'),(125,'communication','Hard','What makes effective workplace communication?'),(126,'communication','Hard','How do you handle negative feedback?'),(127,'problem solving','Easy','What is problem solving?'),(128,'problem solving','Easy','Explain your approach to solving problems.'),(129,'problem solving','Easy','Why is problem solving important in software development?'),(130,'problem solving','Medium','How do you debug an error in a program?'),(131,'problem solving','Medium','Explain analytical thinking.'),(132,'problem solving','Medium','How do you handle unknown technical problems?'),(133,'problem solving','Hard','Describe a difficult problem you solved in a project.'),(134,'problem solving','Hard','How do you find the root cause of a problem?'),(135,'problem solving','Hard','Explain your decision-making process during challenges.'),(136,'problem solving','Hard','How do you improve your problem-solving skills?');
/*!40000 ALTER TABLE `interview_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_questions`
--

DROP TABLE IF EXISTS `interview_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_questions`
--

LOCK TABLES `interview_questions` WRITE;
/*!40000 ALTER TABLE `interview_questions` DISABLE KEYS */;
INSERT INTO `interview_questions` VALUES (1,'What is the first question usually asked in an interview?','Tell me about yourself','What is Python?','Where do you live?','What is SQL?','Tell me about yourself','Easy'),(2,'Why should we hire you?','Because I am hardworking','Because I need a job','No reason','I do not know','Because I am hardworking','Easy'),(3,'Which skill is most important in an interview?','Communication','Singing','Gaming','Dancing','Communication','Easy'),(4,'What should you wear for an interview?','Formal Dress','Night Dress','Sports Dress','Party Wear','Formal Dress','Easy'),(5,'What does HR stand for?','Human Resources','Human Rights','High Responsibility','Home Rules','Human Resources','Easy'),(16,'What should you carry to an interview?','Resume','Television','Pillow','Video Game','Resume','Easy'),(17,'How should you greet the interviewer?','Politely','Ignore them','Wave from outside','Shout loudly','Politely','Easy'),(18,'What should you do before attending an interview?','Research the company','Watch movies','Sleep all day','Play games','Research the company','Easy'),(19,'If you do not know an answer, what should you do?','Answer honestly','Lie confidently','Stay silent forever','Leave the room','Answer honestly','Easy'),(20,'What is the purpose of a resume?','Show your qualifications','Play music','Watch videos','Store photos','Show your qualifications','Easy'),(21,'Which quality do employers value?','Punctuality','Laziness','Carelessness','Anger','Punctuality','Easy'),(22,'What should you maintain during an interview?','Eye Contact','Closed Eyes','Looking at Phone','Looking Outside','Eye Contact','Easy'),(23,'What should you do after an interview?','Thank the interviewer','Ignore everyone','Argue','Leave silently','Thank the interviewer','Easy'),(24,'Which language is commonly used for software interviews?','English','French','German','Spanish','English','Easy'),(25,'Which document contains your education details?','Resume','Driving License','Passport','Bank Passbook','Resume','Easy'),(26,'Which of these is a positive attitude?','Confidence','Fear','Overconfidence','Arrogance','Confidence','Easy'),(27,'How early should you reach an interview?','10-15 minutes early','Exactly on time','30 minutes late','Whenever you want','10-15 minutes early','Easy'),(28,'Which is considered good body language?','Smile and sit straight','Fold arms','Look down','Yawn frequently','Smile and sit straight','Easy'),(29,'What should you do if asked about your weaknesses?','Answer honestly and explain improvement','Say you have none','Refuse to answer','Lie','Answer honestly and explain improvement','Easy'),(30,'What is the main goal of an interview?','Assess the candidate','Entertainment','Sell products','Teach programming','Assess the candidate','Easy');
/*!40000 ALTER TABLE `interview_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interview_results`
--

DROP TABLE IF EXISTS `interview_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interview_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `question` text,
  `answer` text,
  `score` int DEFAULT NULL,
  `feedback` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interview_results`
--

LOCK TABLES `interview_results` WRITE;
/*!40000 ALTER TABLE `interview_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `interview_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard`
--

DROP TABLE IF EXISTS `leaderboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT NULL,
  `total_score` int DEFAULT NULL,
  `rank_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard`
--

LOCK TABLES `leaderboard` WRITE;
/*!40000 ALTER TABLE `leaderboard` DISABLE KEYS */;
INSERT INTO `leaderboard` VALUES (1,'Abdul',90,'2026-07-18'),(2,'sreenu',85,'2026-07-18'),(3,'yeshu',95,'2026-07-18');
/*!40000 ALTER TABLE `leaderboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `python_questions`
--

DROP TABLE IF EXISTS `python_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `python_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `python_questions`
--

LOCK TABLES `python_questions` WRITE;
/*!40000 ALTER TABLE `python_questions` DISABLE KEYS */;
INSERT INTO `python_questions` VALUES (3,'Which keyword is used to define a function in Python?','function','define','def','fun','def','Easy'),(4,'Which data type is immutable?','List','Dictionary','Set','Tuple','Tuple','Easy'),(5,'Which loop is used to iterate over a sequence?','for','repeat','loop','iterate','for','Easy'),(6,'Which symbol is used for comments in Python?','//','#','/*','--','#','Easy'),(7,'Which function is used to display output?','echo()','display()','print()','show()','print()','Easy'),(8,'Which function is used to take input from the user?','scan()','input()','read()','cin()','input()','Easy'),(9,'Which keyword is used for conditional statements?','switch','case','if','when','if','Easy'),(10,'Which of these is a valid variable name?','2name','my-name','my_name','class','my_name','Easy'),(11,'Which operator is used for exponentiation?','^','**','%','//','**','Easy'),(12,'Which function returns the length of a list?','count()','size()','len()','length()','len()','Easy'),(13,'Which keyword is used to create a class in Python?','class','object','define','struct','class','Easy'),(14,'Which function converts a string to an integer?','str()','float()','int()','integer()','int()','Easy'),(15,'Which data type stores True or False?','String','Integer','Boolean','Float','Boolean','Easy'),(16,'Which bracket is used to create a list?','()','{}','[]','<>','[]','Easy'),(17,'Which bracket is used to create a tuple?','{}','[]','()','<>','()','Easy'),(18,'Which bracket is used to create a dictionary?','[]','()','{}','<>','{}','Easy'),(19,'Which operator checks equality?','=','==','!=','===','==','Easy'),(20,'Which keyword is used to exit a loop?','stop','break','exit','continue','break','Easy'),(21,'Which keyword skips the current iteration in a loop?','skip','continue','next','pass','continue','Easy'),(22,'Which function is used to find the type of a variable?','typeof()','type()','class()','var()','type()','Easy'),(23,'What is the output type of range(5)?','List','Tuple','Range Object','Set','Range Object','Medium'),(24,'Which keyword is used to handle exceptions?','catch','try','except','both try and except','both try and except','Medium'),(25,'Which keyword is used to raise an exception?','throw','raise','error','except','raise','Medium'),(26,'Which function opens a file?','file()','open()','read()','create()','open()','Medium'),(27,'Which mode is used to append data to a file?','r','w','a','x','a','Medium'),(28,'Which keyword creates an anonymous function?','lambda','anonymous','func','def','lambda','Medium'),(29,'Which function returns both index and value while looping?','range()','zip()','enumerate()','map()','enumerate()','Medium'),(30,'Which function applies another function to every item?','filter()','map()','reduce()','zip()','map()','Medium'),(31,'Which function filters elements based on a condition?','map()','filter()','zip()','sorted()','filter()','Medium'),(32,'Which module contains reduce()?','math','functools','itertools','collections','functools','Medium'),(33,'Which keyword is used to define a generator?','yield','return','generate','generator','yield','Medium'),(34,'Which symbol is used to import everything from a module?','#','*','%','@','*','Medium'),(35,'Which module is used for regular expressions?','regex','re','pattern','search','re','Medium'),(36,'Which function sorts a list permanently?','sorted()','sort()','arrange()','order()','sort()','Medium'),(37,'Which function returns a sorted copy?','sort()','sorted()','order()','arrange()','sorted()','Medium'),(38,'Which keyword is used for inheritance?','extends','inherits','No keyword needed','parent','No keyword needed','Medium'),(39,'Which method is called automatically when an object is created?','start()','main()','__init__()','create()','__init__()','Medium'),(40,'Which function returns the length of a string?','count()','size()','len()','length()','len()','Medium'),(41,'Which function converts all characters to lowercase?','lower()','small()','case()','down()','lower()','Medium'),(42,'Which function removes whitespace from both ends of a string?','trim()','strip()','remove()','clean()','strip()','Medium'),(43,'What is the purpose of a decorator in Python?','Store data','Modify function behavior','Create variables','Import modules','Modify function behavior','Hard'),(44,'Which special method is used for object representation?','__repr__()','__show__()','__display__()','__object__()','__repr__()','Hard'),(45,'Which module is commonly used for multithreading?','thread','threading','multiprocessing','parallel','threading','Hard'),(46,'Which keyword is used to create a context manager?','with','using','manage','context','with','Hard'),(47,'Which method is called when an iterator reaches the end?','StopIteration','EndIteration','BreakIteration','FinishIteration','StopIteration','Hard'),(48,'Which function creates an iterator from an object?','next()','iter()','iterator()','loop()','iter()','Hard'),(49,'Which function returns the next item from an iterator?','iter()','next()','get()','move()','next()','Hard'),(50,'What does **kwargs represent?','List of values','Tuple of values','Dictionary of keyword arguments','Set of values','Dictionary of keyword arguments','Hard'),(51,'What does *args represent?','Dictionary','Tuple of positional arguments','List','String','Tuple of positional arguments','Hard'),(52,'Which Python feature allows one function inside another function to remember variables?','Closure','Decorator','Generator','Iterator','Closure','Hard');
/*!40000 ALTER TABLE `python_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `score` int DEFAULT NULL,
  `total` int DEFAULT NULL,
  `exam_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_questions`
--

DROP TABLE IF EXISTS `sql_questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sql_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `difficulty` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_questions`
--

LOCK TABLES `sql_questions` WRITE;
/*!40000 ALTER TABLE `sql_questions` DISABLE KEYS */;
INSERT INTO `sql_questions` VALUES (1,'What does SQL stand for?','Structured Query Language','Simple Query Language','Standard Question Language','Sequential Query Language','Structured Query Language','Easy'),(2,'Which command is used to retrieve data?','GET','SELECT','SHOW','FETCH','SELECT','Easy'),(3,'Which command inserts data?','ADD','INSERT','CREATE','UPDATE','INSERT','Easy'),(4,'Which command modifies existing records?','ALTER','CHANGE','UPDATE','MODIFY','UPDATE','Easy'),(5,'Which command deletes records?','REMOVE','DELETE','DROP','CLEAR','DELETE','Easy'),(6,'Which command creates a table?','BUILD','NEW','CREATE TABLE','MAKE TABLE','CREATE TABLE','Easy'),(7,'Which clause filters rows?','ORDER BY','WHERE','GROUP BY','HAVING','WHERE','Easy'),(8,'Which keyword sorts data?','SORT','ORDER BY','GROUP BY','FILTER','ORDER BY','Easy'),(9,'Which function counts rows?','SUM()','COUNT()','TOTAL()','NUMBER()','COUNT()','Easy'),(10,'Which function finds the maximum value?','TOP()','MAX()','HIGH()','UPPER()','MAX()','Easy'),(11,'Which function finds the minimum value?','LOW()','MIN()','BOTTOM()','LESS()','MIN()','Easy'),(12,'Which function calculates average?','AVG()','AVERAGE()','MEAN()','TOTAL()','AVG()','Easy'),(13,'Which function calculates total?','TOTAL()','SUM()','ADD()','COUNT()','SUM()','Easy'),(14,'Which operator matches any value?','=','LIKE','IS','IN','LIKE','Easy'),(15,'Which wildcard represents multiple characters?','_','*','%','?','%','Easy'),(16,'Which wildcard represents one character?','_','%','*','#','_','Easy'),(17,'Which command removes an entire table?','DELETE','DROP','REMOVE','CLEAR','DROP','Easy'),(18,'Which command changes table structure?','CHANGE','UPDATE','ALTER','MODIFY','ALTER','Easy'),(19,'Which keyword removes duplicate values?','UNIQUE','DISTINCT','ONLY','FILTER','DISTINCT','Easy'),(20,'Which keyword limits the number of rows?','LIMIT','TOP','FIRST','ROWNUM','LIMIT','Easy'),(21,'Which JOIN returns matching records from both tables?','LEFT JOIN','RIGHT JOIN','INNER JOIN','FULL JOIN','INNER JOIN','Medium'),(22,'Which JOIN returns all rows from the left table?','LEFT JOIN','RIGHT JOIN','INNER JOIN','CROSS JOIN','LEFT JOIN','Medium'),(23,'Which JOIN returns all rows from the right table?','LEFT JOIN','RIGHT JOIN','INNER JOIN','FULL JOIN','RIGHT JOIN','Medium'),(24,'Which clause groups rows having the same values?','ORDER BY','GROUP BY','WHERE','HAVING','GROUP BY','Medium'),(25,'Which clause filters grouped records?','WHERE','HAVING','GROUP BY','LIMIT','HAVING','Medium'),(26,'Which keyword combines results of two SELECT statements?','JOIN','MERGE','UNION','LINK','UNION','Medium'),(27,'Which keyword combines duplicate rows also?','UNION ALL','UNION','JOIN','GROUP BY','UNION ALL','Medium'),(28,'Which keyword is used to rename a column?','CHANGE','RENAME','AS','ALTER','AS','Medium'),(29,'Which operator checks for NULL values?','= NULL','IS NULL','NULL','== NULL','IS NULL','Medium'),(30,'Which operator checks NOT NULL values?','NOT NULL','IS NOT NULL','<> NULL','!= NULL','IS NOT NULL','Medium'),(31,'Which command removes duplicate rows permanently?','DELETE','DISTINCT','GROUP BY','UNIQUE','DISTINCT','Medium'),(32,'Which SQL statement changes existing table data?','UPDATE','ALTER','MODIFY','CHANGE','UPDATE','Medium'),(33,'Which SQL command removes all records but keeps the table?','TRUNCATE','DROP','DELETE TABLE','REMOVE','TRUNCATE','Medium'),(34,'Which SQL clause sorts in descending order?','DESC','DOWN','LOW','ORDER','DESC','Medium'),(35,'Which SQL clause sorts in ascending order?','ASC','UP','HIGH','TOP','ASC','Medium'),(36,'Which keyword is used to search a pattern?','LIKE','MATCH','SEARCH','FIND','LIKE','Medium'),(37,'Which aggregate function ignores NULL values?','COUNT(column)','SUM','AVG','All of these','All of these','Medium'),(38,'Which SQL clause is executed first?','SELECT','WHERE','FROM','ORDER BY','FROM','Medium'),(39,'Which command changes the name of a table?','ALTER TABLE RENAME','CHANGE TABLE','UPDATE TABLE','MODIFY TABLE','ALTER TABLE RENAME','Medium'),(40,'Which function returns the current date?','NOW()','CURRENT_DATE()','GETDATE()','TODAY()','CURRENT_DATE()','Medium'),(41,'Which SQL function assigns a unique number to each row?','RANK()','DENSE_RANK()','ROW_NUMBER()','COUNT()','ROW_NUMBER()','Hard'),(42,'Which SQL function gives the same rank for duplicate values?','ROW_NUMBER()','RANK()','COUNT()','SUM()','RANK()','Hard'),(43,'Which SQL function gives consecutive ranks without gaps?','DENSE_RANK()','RANK()','ROW_NUMBER()','ORDER()','DENSE_RANK()','Hard'),(44,'Which statement permanently saves a transaction?','ROLLBACK','SAVE','COMMIT','END','COMMIT','Hard'),(45,'Which statement undoes changes in a transaction?','UNDO','ROLLBACK','CANCEL','RESET','ROLLBACK','Hard'),(46,'What is the primary purpose of an INDEX?','Store backups','Increase query speed','Delete duplicates','Create tables','Increase query speed','Hard'),(47,'Which normal form removes transitive dependency?','1NF','2NF','3NF','BCNF','3NF','Hard'),(48,'Which SQL object stores a SELECT query as a virtual table?','VIEW','INDEX','TRIGGER','FUNCTION','VIEW','Hard'),(49,'Which database property ensures completed transactions remain permanent?','Consistency','Isolation','Durability','Atomicity','Durability','Hard'),(50,'Which database property ensures all operations succeed or none do?','Consistency','Atomicity','Isolation','Durability','Atomicity','Hard');
/*!40000 ALTER TABLE `sql_questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'Yeshu','yeshu4747@gmail.com','scrypt:32768:8:1$qy89sqp3P27RBtxU$a3af261ee7f78aa8165195535b0bed8dc1c36d5d8317888322c20011f5ed740c557832a7c7f1c4c17ef9a0fa4738349f565101882a37c7c1eeff2990f1eb06a9'),(4,'Abdul Jilani','abduljilanipathan30@gmail.com','scrypt:32768:8:1$qYitHPDeBKEfQ3C6$cb6a62c5f97406bcaaedab42a9643eaa1bc20d0bb6f9a1be47bf13c705599df2e8c4047125a36dca6df998671cf51234aea7d8107e9dca3edca950b122e11b63');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-20 13:04:21
