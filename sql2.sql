USE smart_interview_portal;
DESC interview_questions;
INSERT INTO interview_questions
(question, option1, option2, option3, option4, answer, difficulty)
VALUES
('What is the first question usually asked in an interview?',
'Tell me about yourself',
'What is Python?',
'Where do you live?',
'What is SQL?',
'Tell me about yourself',
'Easy'),

('Why should we hire you?',
'Because I am hardworking',
'Because I need a job',
'No reason',
'I do not know',
'Because I am hardworking',
'Easy'),

('Which skill is most important in an interview?',
'Communication',
'Singing',
'Gaming',
'Dancing',
'Communication',
'Easy'),

('What should you wear for an interview?',
'Formal Dress',
'Night Dress',
'Sports Dress',
'Party Wear',
'Formal Dress',
'Easy'),

('What does HR stand for?',
'Human Resources',
'Human Rights',
'High Responsibility',
'Home Rules',
'Human Resources',
'Easy');
INSERT INTO interview_questions
(question, option1, option2, option3, option4, answer, difficulty)
VALUES
('What is the first question usually asked in an interview?', 'Tell me about yourself', 'What is Python?', 'Where do you live?', 'What is SQL?', 'Tell me about yourself', 'Easy'),
('Why should we hire you?', 'Because I am hardworking', 'Because I need a job', 'No reason', 'I dont know', 'Because I am hardworking', 'Easy'),
('Which skill is most important in an interview?', 'Communication', 'Singing', 'Gaming', 'Dancing', 'Communication', 'Easy'),
('What should you wear for an interview?', 'Formal Dress', 'Night Dress', 'Sports Dress', 'Party Wear', 'Formal Dress', 'Easy'),
('What does HR stand for?', 'Human Resources', 'Human Rights', 'High Responsibility', 'Home Rules', 'Human Resources', 'Easy'),
('What should you carry to an interview?', 'Resume', 'Television', 'Pillow', 'Video Game', 'Resume', 'Easy'),
('How should you greet the interviewer?', 'Politely', 'Ignore them', 'Wave from outside', 'Shout loudly', 'Politely', 'Easy'),
('What should you do before attending an interview?', 'Research the company', 'Watch movies', 'Sleep all day', 'Play games', 'Research the company', 'Easy'),
('If you do not know an answer, what should you do?', 'Answer honestly', 'Lie confidently', 'Stay silent forever', 'Leave the room', 'Answer honestly', 'Easy'),
('What is the purpose of a resume?', 'Show your qualifications', 'Play music', 'Watch videos', 'Store photos', 'Show your qualifications', 'Easy'),
('Which quality do employers value?', 'Punctuality', 'Laziness', 'Carelessness', 'Anger', 'Punctuality', 'Easy'),
('What should you maintain during an interview?', 'Eye Contact', 'Closed Eyes', 'Looking at Phone', 'Looking Outside', 'Eye Contact', 'Easy'),
('What should you do after an interview?', 'Thank the interviewer', 'Ignore everyone', 'Argue', 'Leave silently', 'Thank the interviewer', 'Easy'),
('Which language is commonly used for software interviews?', 'English', 'French', 'German', 'Spanish', 'English', 'Easy'),
('Which document contains your education details?', 'Resume', 'Driving License', 'Passport', 'Bank Passbook', 'Resume', 'Easy'),
('Which of these is a positive attitude?', 'Confidence', 'Fear', 'Overconfidence', 'Arrogance', 'Confidence', 'Easy'),
('How early should you reach an interview?', '10-15 minutes early', 'Exactly on time', '30 minutes late', 'Whenever you want', '10-15 minutes early', 'Easy'),
('Which is considered good body language?', 'Smile and sit straight', 'Fold arms', 'Look down', 'Yawn frequently', 'Smile and sit straight', 'Easy'),
('What should you do if asked about your weaknesses?', 'Answer honestly and explain improvement', 'Say you have none', 'Refuse to answer', 'Lie', 'Answer honestly and explain improvement', 'Easy'),
('What is the main goal of an interview?', 'Assess the candidate', 'Entertainment', 'Sell products', 'Teach programming', 'Assess the candidate', 'Easy');
INSERT INTO interview_questions
(question, option1, option2, option3, option4, answer, difficulty)
VALUES
('If you do not know an answer, what should you do?',
'Answer honestly',
'Lie confidently',
'Stay silent forever',
'Leave the room',
'Answer honestly',
'Easy');
DESC interview_questions;
SELECT COUNT(*) FROM interview_questions;