from flask import Flask, render_template, request, redirect, session, flash
import pymysql
import config
from werkzeug.security import generate_password_hash, check_password_hash
import PyPDF2
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import ollama

app = Flask(__name__)
app.secret_key = "smart_interview_secret"

# Database Connection
connection = pymysql.connect(
    autocommit=True,
    host=config.HOST,
    user=config.USER,
    password=config.PASSWORD,
    database=config.DATABASE
)

# ---------------- RESUME MATCHER FUNCTIONS ----------------

def extract_text(file):

    pdf = PyPDF2.PdfReader(file)

    text = ""

    for page in pdf.pages:

        page_text = page.extract_text()

        if page_text:
            text += page_text

    return text

def ask_ai(prompt):

    print("=== Calling Ollama ===")

    try:

        response = ollama.chat(
            model="llama3:latest",
            messages=[
                {
                    "role": "user",
                    "content": prompt
                }
            ],
            options={
                "num_predict": 200,
                "temperature": 0.3
            }
        )

        print("=== Ollama Response Received ===")

        return response["message"]["content"]

    except Exception as e:

        print("OLLAMA ERROR:", e)

        return (
            "Tell me about yourself.\n"
            "Explain your technical skills.\n"
            "Describe your project experience."
        )
        
def evaluate_answer_ai(question, answer):

    prompt = f"""
    Interview Question:
    {question}

    Candidate Answer:
    {answer}

    Give:
    1. Score out of 100
    2. Strengths
    3. Weaknesses
    4. Ideal Answer
    """

    return ask_ai(prompt)

def calculate_match(resume_text, job_description):

    documents = [
        resume_text,
        job_description
    ]

    vectorizer = TfidfVectorizer()

    vectors = vectorizer.fit_transform(documents)

    similarity = cosine_similarity(
        vectors[0:1],
        vectors[1:2]
    )

    score = similarity[0][0] * 100

    return round(score, 2)

# ---------------- ATS CHECK FUNCTION ----------------

def ats_check(resume_text, job_description):

    resume_text = resume_text.lower()
    job_description = job_description.lower()


    # Important keywords only
    stop_words = {
        "the","and","with","for","from",
        "this","that","are","have",
        "using","you","your","job",
        "role","work","will","our"
    }


    job_words = set(
        word.strip(".,:;()[]{}")
        for word in job_description.split()
        if len(word) > 3
    )


    # Remove common words
    job_words = job_words - stop_words


    matched_skills = []
    missing_skills = []


    for skill in job_words:

        if skill in resume_text:
            matched_skills.append(skill)

        else:
            missing_skills.append(skill)



    if len(job_words) == 0:
        ats_score = 0

    else:
        ats_score = (
            len(matched_skills) /
            len(job_words)
        ) * 100



    return (
        round(ats_score,2),
        matched_skills,
        missing_skills
    )
    
# ---------------- SKILL GAP ANALYZER ----------------

def skill_gap_analysis(resume_text, job_description):

    resume_text = resume_text.lower()
    job_description = job_description.lower()

    skills = [
        "python",
        "java",
        "sql",
        "mysql",
        "flask",
        "django",
        "machine learning",
        "deep learning",
        "data science",
        "html",
        "css",
        "javascript",
        "react",
        "aws",
        "docker",
        "git"
    ]

    matched = []
    missing = []

    for skill in skills:

        if skill in job_description:

            if skill in resume_text:
                matched.append(skill)

            else:
                missing.append(skill)

    return matched, missing

def get_expected_answer(question):

    answers = {

        "Tell me about yourself.":
        """I am a final-year B.Tech student with strong knowledge of Python, SQL, Flask, HTML, CSS, and JavaScript. I have developed projects like Smart Interview Portal and AI Resume Matcher. I enjoy solving real-world problems and continuously improving my technical skills.""",

        "Explain your final year project.":
        """My final-year project is Smart Interview Portal. It includes resume analysis, ATS scoring, AI-generated interview questions, interview evaluation, voice interview, and performance reports. The project uses Flask, MySQL, Python, HTML, CSS, and Machine Learning.""",

        "Why should we hire you?":
        """I am a quick learner with strong problem-solving skills. I have practical experience in Python, SQL, Flask, and web development. I am eager to contribute to the organization and continuously improve my skills.""",

        "What are your strengths and weaknesses?":
        """My strengths are problem solving, quick learning, teamwork, and adaptability. My weakness is that I sometimes spend extra time perfecting my work, but I am learning to manage my time more effectively.""",

        "Where do you see yourself in five years?":
        """I see myself working as a software engineer, contributing to challenging projects, learning new technologies, and growing into a technical leadership role."""
    }

    return answers.get(
        question,
        "Provide a clear explanation with examples and practical experience."
    )
# ---------------- AI ANSWER EVALUATION ----------------

# ---------------- AI ANSWER EVALUATION ----------------

def evaluate_answer(question, answer):

    question = question.lower()
    answer = answer.lower().strip()

    score = 0
    feedback = []

    word_count = len(answer.split())

    # ---------------- FREE TIME / HOBBIES ----------------

    if "free time" in question or "hobbies" in question:

        if word_count >= 5:
            score = 80
            feedback.append(
                "Good answer. You clearly explained your interests."
            )

        else:
            score = 50
            feedback.append(
                "Try to explain your hobbies in one or two more sentences."
            )

    # ---------------- TEAM PROJECT ----------------

    elif "team project" in question or "team" in question:

        if word_count >= 10:
            score = 85
            feedback.append(
                "Good answer. You explained your project contribution."
            )

        else:
            score = 50
            feedback.append(
                "Try to explain your role and contribution in more detail."
            )

    # ---------------- LEARNING STYLE ----------------

    elif "learner" in question or "learning" in question:

        if word_count >= 5:
            score = 80
            feedback.append(
                "Good answer. You explained your learning preference."
            )

        else:
            score = 50
            feedback.append(
                "Add a short reason or example to explain your learning style."
            )

    # ---------------- TELL ME ABOUT YOURSELF ----------------

    elif "tell me about yourself" in question:

        if word_count >= 15:
            score = 90
            feedback.append(
                "Good introduction. Your answer gives a clear idea about you."
            )

        else:
            score = 50
            feedback.append(
                "Try to introduce yourself with a little more detail."
            )

    # ---------------- STRENGTHS ----------------

    elif "strength" in question:

        if word_count >= 5:
            score = 85
            feedback.append(
                "Good answer. You explained your strengths clearly."
            )

        else:
            score = 50
            feedback.append(
                "Mention your strengths and briefly explain them."
            )

    # ---------------- GENERAL HR QUESTION ----------------

    else:

        if word_count >= 10:
            score = 80
            feedback.append(
                "Good answer. You explained your response clearly."
            )

        elif word_count >= 5:
            score = 65
            feedback.append(
                "Good start. Add one or two more details."
            )

        else:
            score = 40
            feedback.append(
                "Try to give a little more detail in your answer."
            )

    return score, " ".join(feedback)
# ---------------- FINAL INTERVIEW EVALUATION ----------------

# ---------------- FINAL INTERVIEW EVALUATION ----------------

def final_interview_evaluation(questions, answers):

    total_score = 0
    details = []

    for question, answer in zip(questions, answers):

        score, feedback = evaluate_answer(
            question,
            answer
        )

        total_score += score

        details.append(feedback)

    if len(answers) > 0:

        final_score = round(
            total_score / len(answers)
        )

    else:

        final_score = 0

    if final_score >= 80:

        final_feedback = (
            "Excellent interview performance."
        )

    elif final_score >= 50:

        final_feedback = (
            "Good performance. Keep improving your answers."
        )

    else:

        final_feedback = (
            "Your answers need improvement. "
            "Try to add a little more detail."
        )

    return (
        final_score,
        final_feedback,
        details
    )
    
# ---------------- AI INTERVIEW EVALUATION ----------------


@app.route("/evaluate_answer", methods=["POST"])
def evaluate_answer_route():


    if "user" not in session:
        return redirect("/login")


    question = request.form["question"]

    answer = request.form["answer"]


    score, feedback = evaluate_answer(answer)



    cursor = connection.cursor()


    cursor.execute(

        """
        INSERT INTO interview_results
        (email,question,answer,score,feedback)

        VALUES(%s,%s,%s,%s,%s)

        """,

        (
            session["user"],
            question,
            answer,
            score,
            feedback
        )

    )


    connection.commit()

    cursor.close()



    return render_template(

        "interview_feedback.html",

        question=question,

        answer=answer,

        score=score,

        feedback=feedback

    )
# ---------------- HOME ----------------

@app.route("/")
def home():

    if "user" in session:
        return render_template(
            "index.html",
            logged_in=True,
            fullname=session.get("fullname", "User")
        )

    return render_template(
        "index.html",
        logged_in=False
    )


# ---------------- REGISTER ----------------

@app.route("/register", methods=["GET", "POST"])
def register():

    if request.method == "POST":

        fullname = request.form["fullname"]
        email = request.form["email"]
        password = request.form["password"]
        confirm_password = request.form["confirm_password"]

        if password != confirm_password:
            flash("Passwords do not match", "error")
            return redirect("/register")

        hashed_password = generate_password_hash(password)

        cursor = connection.cursor()

        cursor.execute(
            "SELECT * FROM users WHERE email=%s",
            (email,)
        )

        user = cursor.fetchone()

        if user:
            cursor.close()
            flash("User already exists! Please Login.", "error")
            return redirect("/login")

        cursor.execute(
            "INSERT INTO users(fullname,email,password) VALUES(%s,%s,%s)",
            (fullname, email, hashed_password)
        )

        connection.commit()
        cursor.close()

        flash("Registration Successful. Please Login.", "success")

        return redirect("/login")

    return render_template("register.html")


# ---------------- LOGIN ----------------

@app.route("/login", methods=["GET", "POST"])
def login():

    if request.method == "POST":

        email = request.form["email"]
        password = request.form["password"]

        cursor = connection.cursor()

        cursor.execute(
            "SELECT * FROM users WHERE email=%s",
            (email,)
        )

        user = cursor.fetchone()

        cursor.close()

        if user:

            stored_password = user[3]

            if check_password_hash(stored_password, password):

                session["user"] = email
                session["fullname"] = user[1]

                return redirect("/dashboard")

        flash("Invalid Email or Password", "error")

        return redirect("/login")

    return render_template("login.html")


# ---------------- DASHBOARD ----------------

@app.route("/dashboard")
def dashboard():

    if "user" not in session:
        return redirect("/login")

    return render_template(
        "dashboard.html",
        fullname=session.get("fullname", "User")
    )


# ---------------- LOGOUT ----------------

@app.route("/logout")
def logout():

    session.clear()

    flash("Logged Out Successfully", "success")

    return redirect("/")


# ---------------- PYTHON QUIZ ----------------

@app.route("/python")
def python_quiz():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM python_questions")

    questions = cursor.fetchall()

    cursor.close()

    return render_template(
        "python.html",
        questions=questions
    )

@app.route("/sql")
def sql():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM sql_questions")
    questions = cursor.fetchall()

    cursor.close()

    return render_template(
        "sql.html",
        questions=questions
    )
    
@app.route("/interview")
def interview():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM interview_questions")
    questions = cursor.fetchall()

    cursor.close()

    return render_template(
        "interview.html",
        questions=questions
    )
    
@app.route("/aptitude")
def aptitude():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM aptitude_questions")
    questions = cursor.fetchall()

    cursor.close()

    return render_template(
        "aptitude.html",
        questions=questions
    )

# ---------------- SUBMIT QUIZ ----------------

@app.route("/submit_python", methods=["POST"])
def submit_python():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM python_questions")
    questions = cursor.fetchall()

    score = 0

    for q in questions:
        question_id = str(q[0])
        correct_answer = q[6]
        user_answer = request.form.get(question_id)

        if user_answer == correct_answer:
            score += 1

    cursor.execute(
        """
        INSERT INTO results (email, subject, score, total)
        VALUES (%s, %s, %s, %s)
        """,
        (session["user"], "Python", score, len(questions))
    )

    connection.commit()
    cursor.close()

    return render_template(
        "result.html",
        score=score,
        total=len(questions)
    )

@app.route("/submit_sql", methods=["POST"])
def submit_sql():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM sql_questions")
    questions = cursor.fetchall()

    score = 0

    for q in questions:
        qid = str(q[0])
        correct_answer = q[6]
        user_answer = request.form.get(qid)

        if user_answer == correct_answer:
            score += 1

    cursor.execute(
        """
        INSERT INTO results (email, subject, score, total)
        VALUES (%s, %s, %s, %s)
        """,
        (session["user"], "SQL", score, len(questions))
    )

    connection.commit()
    cursor.close()

    return render_template(
        "result.html",
        score=score,
        total=len(questions)
    )

@app.route("/submit_interview", methods=["POST"])
def submit_interview():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM interview_questions")
    questions = cursor.fetchall()

    score = 0

    for q in questions:
        qid = str(q[0])
        correct_answer = q[6]
        user_answer = request.form.get(qid)

        if user_answer == correct_answer:
            score += 1

    cursor.execute(
        """
        INSERT INTO results (email, subject, score, total)
        VALUES (%s, %s, %s, %s)
        """,
        (session["user"], "Interview", score, len(questions))
    )

    connection.commit()
    cursor.close()

    return render_template(
        "result.html",
        score=score,
        total=len(questions)
    )
    
@app.route("/submit_aptitude", methods=["POST"])
def submit_aptitude():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute("SELECT * FROM aptitude_questions")
    questions = cursor.fetchall()

    score = 0

    for q in questions:
        qid = str(q[0])
        correct_answer = q[6]
        user_answer = request.form.get(qid)

        if user_answer == correct_answer:
            score += 1

    cursor.execute(
        """
        INSERT INTO results (email, subject, score, total)
        VALUES (%s, %s, %s, %s)
        """,
        (session["user"], "Aptitude", score, len(questions))
    )

    connection.commit()
    cursor.close()

    return render_template(
        "result.html",
        score=score,
        total=len(questions)
    )

@app.route("/results")
def results():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute(
        """
        SELECT subject, score, total, exam_date
        FROM results
        WHERE email=%s
        ORDER BY exam_date DESC
        """,
        (session["user"],)
    )

    data = cursor.fetchall()
    cursor.close()

    return render_template("results.html", results=data)

@app.route('/leaderboard')
def leaderboard():

    if "user" not in session:
        return redirect("/login")

    cursor = connection.cursor()

    cursor.execute(
        """
        SELECT fullname,total_score,rank_date
        FROM leaderboard
        ORDER BY total_score DESC
        LIMIT 10
        """
    )

    users = cursor.fetchall()

    cursor.close()

    return render_template(
        "leaderboard.html",
        users=users
    )
    
# ---------------- AI RESUME MATCHER ----------------

@app.route("/resume_matcher", methods=["GET", "POST"])
def resume_matcher():

    if "user" not in session:
        return redirect("/login")

    if request.method == "POST":

        resume = request.files["resume"]
        job_description = request.form["job_description"]

        # Extract resume text
        resume_text = extract_text(resume)

        # AI Resume Similarity Score
        score = calculate_match(
            resume_text,
            job_description
        )

        # ATS Score
        ats_score, matched_skills, missing_skills = ats_check(
            resume_text,
            job_description
        )

        # Skill Gap Analysis
        skill_match, skill_missing = skill_gap_analysis(
            resume_text,
            job_description
        )

        # Save data in session for AI Interview
        session["resume_text"] = resume_text
        session["job_description"] = job_description
        session["skill_match"] = skill_match
        session["skill_missing"] = skill_missing

        # Clear old interview data
        session.pop("interview_questions", None)
        session.pop("current_question", None)

        # Show Resume Report
        return render_template(
            "resume_result.html",
            score=score,
            ats_score=ats_score,
            skills=matched_skills,
            missing_skills=missing_skills,
            skill_match=skill_match,
            skill_missing=skill_missing
        )

    return render_template("resume_matcher.html")

@app.route("/start_interview", methods=["GET", "POST"])
def start_interview():

    if request.method == "GET":
        return render_template("job_description.html")

    job_description = request.form["job_description"]

    print("=== Job Description Received ===")

    session["job_description"] = job_description

    prompt = f"""
    You are a professional AI interviewer.

    Generate exactly 10 interview questions based on the Job Description.

    IMPORTANT RULES:

    NON-TECHNICAL QUESTIONS:
    - Questions 1 to 5 must be simple HR questions.
    - Ask questions about the candidate, teamwork, strengths, learning, goals, and problem-solving.
    - Keep them easy and suitable for a fresher.
    - Do not ask technical questions in questions 1 to 5.

    TECHNICAL QUESTIONS:
    - Questions 6 to 10 must be technical questions.
    - Ask technical questions based on the skills and technologies mentioned in the Job Description.
    - Questions should be suitable for a fresher or beginner.
    - Do not ask extremely difficult questions.

    GENERAL RULES:
    - Return ONLY 10 questions.
    - Do NOT write any introduction.
    - Number questions from 1 to 10.
    - Each question must be on a separate line.
    - Every question must end with a question mark.

    Job Description:
    {job_description}
    """

    print("=== Calling AI ===")

    questions = ask_ai(prompt)

    print("=== Questions Generated ===")
    print(questions)

    question_list = []

    for line in questions.split("\n"):

        line = line.strip()

        if not line:
            continue

        # Remove common AI introduction text
        if line.lower().startswith("here are"):
            continue

        if line.lower().startswith("here are 5"):
            continue

        # Remove numbering
        line = line.lstrip("1234567890.-) ")

        # Keep only proper questions
        if "?" in line:
            question_list.append(line)

    # Make sure only 5 questions are used
    question_list = question_list[:10]

    session["interview_questions"] = question_list
    session["current_question"] = 0
    session["answers"] = []

    return redirect("/ask_question")
   
@app.route("/ask_question")
def ask_question():

    if "interview_questions" not in session:
        flash("Please upload resume and job description first")
        return redirect("/resume_matcher")


    questions = session["interview_questions"]

    index = session.get(
        "current_question",
        0
    )


    if index >= len(questions):
        return redirect("/interview_complete")


    question = questions[index]


    return render_template(
        "ask_question.html",
        question=question,
        number=index+1,
        total=len(questions)
    )
@app.route("/submit_answer", methods=["POST"])
def submit_answer():

    answer = request.form["answer"]

    if "answers" not in session:
        session["answers"] = []

    session["answers"].append(answer)

    session["current_question"] += 1


    questions = session["interview_questions"]


    if session["current_question"] >= len(questions):

        return redirect("/interview_complete")


    return redirect("/ask_question")

@app.route("/interview_complete")
def interview_complete():

    answers = session.get("answers", [])
    questions = session.get("interview_questions", [])


    score, final_feedback, details = final_interview_evaluation(
        questions,
        answers
    )


    analysis = []

    for i in range(len(answers)):

        analysis.append({

            "number": i + 1,
            "question": questions[i],
            "answer": answers[i],
            "feedback": details[i]

        })


    cursor = connection.cursor()


    cursor.execute(
        """
        INSERT INTO ai_interview_results
        (email,job_role,score,feedback)
        VALUES(%s,%s,%s,%s)
        """,

        (
            session["user"],
            "AI Generated Interview",
            score,
            final_feedback
        )
    )


    connection.commit()

    cursor.close()


    return render_template(
        "interview_result.html",
        score=score,
        feedback=final_feedback,
        analysis=analysis
    )

@app.route("/interview_history")
def interview_history():

    if "user" not in session:
        return redirect("/login")


    cursor = connection.cursor()


    cursor.execute(
        """
        SELECT job_role,score,feedback,interview_date

        FROM ai_interview_results

        WHERE email=%s

        ORDER BY interview_date DESC
        """,

        (session["user"],)
    )


    data = cursor.fetchall()


    cursor.close()


    return render_template(
        "interview_history.html",
        interviews=data
    )
    
# ---------------- RUN ----------------

if __name__ == "__main__":
    app.run(debug=True)