# Nginx Log Analyser

This project is a **simple Bash-based Nginx log analyzer** that extracts useful insights from access logs using standard Linux tools like `awk`, `sort`, and `uniq`.

📌 **Project URL (Roadmap.sh):**
[https://roadmap.sh/projects/nginx-log-analyser](https://roadmap.sh/projects/nginx-log-analyser)

---

## 📊 Features

Given an Nginx access log file, the script prints:

1. **Top 5 IP addresses** with the most requests
2. **Top 5 most requested paths**
3. **Top 5 response status codes**
4. **Top 5 user agents** (normalized to the first token)

All results are sorted in descending order by request count.

---

## 🛠️ Prerequisites

* Linux / Unix environment
* Bash shell
* Standard GNU utilities:

  * `awk`
  * `sort`
  * `uniq`
  * `head`

No external dependencies are required.

---

## 🚀 Usage

### 1️⃣ Make the script executable

```bash
chmod +x nginx_log_analyser.sh
```

### 2️⃣ Run the script

```bash
./nginx_log_analyser.sh /path/to/access.log
```

Where `/path/to/access.log` is your Nginx access log file.

---

## 📥 Input Format

The script expects logs in **Nginx combined log format**, for example:

```
192.168.1.10 - - [10/Jan/2026:10:15:42 +0530] "GET / HTTP/1.1" 200 512 "https://google.com" "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
```

---

## 📤 Sample Output

```
Top 5 IP addresses with the most requests:
192.168.1.10 - 1200 requests
10.0.0.5 - 845 requests

Top 5 most requested paths
/ - 270 requests
/v1-health - 206 requests

Top 5 most response status codes
200 - 5740 requests
404 - 937 requests

Top 5 user agents
DigitalOcean - 4347 requests
Mozilla/5.0 - 513 requests
```

---

## 🧠 How It Works (High Level)

* **IP addresses** → extracted from column `$1`
* **Request paths** → parsed from the quoted request field
* **Status codes** → extracted from column `$9`
* **User agents** → parsed from the last quoted field and normalized

The script relies on associative arrays in `awk` for counting and Unix sorting for ranking.

---

## ⚠️ Notes & Limitations

* Assumes **well-formed combined logs**
* Malformed lines may be ignored or grouped separately
* User-Agent output is intentionally simplified to the **first token** for readability

---

## 📚 Learning Outcome

This project is ideal for practicing:

* Bash scripting
* Log parsing with `awk`
* Text processing pipelines
* Real-world DevOps / SRE log analysis

---

## 📄 License

This project is provided for learning purposes and follows the Roadmap.sh project guidelines.

---

✅ **Inspired by Roadmap.sh DevOps Projects**
