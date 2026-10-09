I recommend Python as your first choice for small automation programs involving web requests, file handling, data processing, and repetitive tasks.

Since you're also learning Java backend development and studying different programming languages, I'd choose based on two goals: getting automation tasks done quickly and building skills useful for your career.

## 1. My recommendation

![Download the Python logo in PNG y SVG | LogosDown](https://images.openai.com/static-rsc-4/4O4w2AQWGAsmr1aTaF29dtT0ouX4IofywzcxWPAaHmB-sJFcjFHpKN3UVkOgR8QmZJcRGOoqVMn_K9yHZe-3llTbgEPKS04-tDtpAIMDhev0ruPj-hhopw50hVHPX7sFESCz_jt_z0gSHIuwbjgMEJI10NNAmcjl3kn7U9_txQY?purpose=inline)

1. Python — Best overall choice

Recommended

Excellent for HTTP requests, downloading files, renaming files, parsing JSON, scraping web pages, and automating repetitive tasks.

Key libraries: `requests`, `pathlib`, `json`, `csv`, `BeautifulSoup`

![File 128.svg - Wikimedia Commons](https://images.openai.com/static-rsc-4/zyBihqF1W4i9DmUIPWYf4eqne_wypvO-TJP0rV5Zc4AFoLs8miAtZmY9iw3aS6h-RwUMaapf7BW4vhxb8Nj0KLeSvNE4-NVJmK52706mCjbCCehPospKiCPxX3MtRHzL4UyjBjoOVwZJJ2IgHBIQpNCpXbKMRauEErzAnrJEa-g?purpose=inline)

2. Bash / PowerShell — Best for OS automation

Great for file operations, running commands, backups, batch processing, and connecting existing command-line tools.

Choose Bash for Linux/Ubuntu; PowerShell for Windows-oriented workflows.

![GitHub - wilsonzlin/minify-html: Extremely fast and smart HTML + JS + CSS minifier, available for Rust, Deno, Java, Node.js, Python, Ruby, and WASM](https://images.openai.com/static-rsc-4/geNfgoAxk30UqxSXdWtDIHmYfLLqvGU16nKVXMNNx3HDVvROQxaB4zjbAvtbjqBg7YdmDLjM1Cr7xfyxhQZzKcVnaPFWdSIT0dKIvf4cJDdri6mVEA3HEUFf8s3A1kNoPelFoIpXfrmwUSxUoVTM1YBj2JVWW0D022nHTWcbY0o?purpose=inline)

3. JavaScript with Node.js — Best if you already use JavaScript

Good for HTTP APIs, asynchronous requests, JSON, file handling, and automation that shares code with your web projects.

Key APIs: `fetch`, `fs/promises`, `path`

![Caffeine vs. Ehcache: Advanced Java Caching Techniques - Java Code Geeks](https://images.openai.com/static-rsc-4/xv5SKHwLeiFSeGtQMfC17IGWrE0gnQxJsUQE3wEN5fVOUNc51h1JtD4kTZjkNXTv2q6YOIwBClx8E4RzGk0HZEuz0RNFL-WnzqtS1vDw8SzE5585WO_R5D5u8lz5g9BaburtT7BiTJtB_slukU175R-XmXA713l8NBrGYaIZygQ?purpose=inline)

4. Java — Best for reinforcing your backend skills

Java supports HTTP requests and file handling well, but small scripts generally require more setup and boilerplate than Python.

Key APIs: `HttpClient`, `Files`, `Path`, `java.net.http`

## 2. See how much code a task takes

Suppose you want to download a web page and save its response to a file.

### Python

Python

Run

```
from urllib.request import urlopen
from pathlib import Path

url = "https://example.com"

with urlopen(url, timeout=10) as response:
    content = response.read()

Path("page.html").write_bytes(content)

print("Downloaded successfully")
```

This uses Python's standard library, so you don't need to install a third-party HTTP library for this example.

### Java

Java

```
import java.net.URI;
import java.net.http.*;
import java.nio.file.*;

public class Downloader {
    public static void main(String[] args) throws Exception {
        var client = HttpClient.newHttpClient();

        var request = HttpRequest.newBuilder()
                .uri(URI.create("https://example.com"))
                .build();

        var response = client.send(
                request,
                HttpResponse.BodyHandlers.ofByteArray()
        );

        Files.write(Path.of("page.html"), response.body());

        System.out.println("Downloaded successfully");
    }
}
```

Both work. Python is usually quicker to write for this kind of one-off task, while Java lets you practice APIs you'll also use in backend development.

These examples are minimal: for real automation, also handle HTTP error statuses, retries, and network failures.

## 3. Choose by the type of automation

| Your task                               | My choice              |
| --------------------------------------- | ---------------------- |
| Send HTTP requests to APIs              | Python                 |
| Download files from websites            | Python                 |
| Read/write JSON, CSV, XML               | Python                 |
| Rename hundreds of files                | Python or Bash         |
| Schedule backups and run shell commands | Bash                   |
| Web scraping and data collection        | Python                 |
| Browser automation and testing          | Python with Playwright |
| Automate Java backend workflows         | Java                   |
| Automate a JavaScript project           | Node.js                |

## 4. A practical learning path

I suggest learning just enough Python to automate useful tasks rather than studying the entire language first.

Step 1 — Basic scripting

Variables, strings, lists, dictionaries, conditions, loops, functions, exceptions.

Step 2 — File handling

`pathlib`, reading/writing text, copying files, directory traversal, JSON and CSV.

Step 3 — Web requests

HTTP methods, headers, query parameters, status codes, timeouts, JSON APIs, authentication.

Step 4 — Combine everything

Build a script that fetches API data, transforms it, saves it to a file, logs failures, and runs periodically.

One especially useful first project is an API-to-JSON/CSV downloader: request data from a public API, check the response, extract selected fields, and save them to a local file.

One question: What operating system will you mainly run these automation programs on?

Ubuntu / Linux

Windows

Both Linux and Windows

What will your programs mainly do?

Web requests and API automation

File and directory automation

Both web requests and files

Browser automation and web scraping

Recommend my setup

---

I recommend Python + Playwright for your automation work, while continuing to learn Java for backend development.

This combination fits your situation well: Python is convenient for small cross-platform scripts, and Playwright can automate real browsers for scraping, testing, clicking buttons, filling forms, and navigating pages.

## 1. Recommended technology stack

![Python logo Icons, Logos, Symbols – Free Download PNG, SVG](https://images.openai.com/static-rsc-4/DmsB8FS-GP7uphH6D36okAKArZlBuv18j7laB7MGQztxtnElBP3iuvRtFFsgJN3_CMjTR795lNP5nkz0C0O5HRM_6vUhOfMDScUzQErc9yfIrgdVyj38VLAdNtbsn3vWhJAUhRcvYx9LUssqXM5zJvcGr4rSiP0dNojMqKdTlnc?purpose=inline)

Python — the automation language

Use it to organize scripts, process data, handle files, parse JSON, and manage errors. It runs on both Linux and Windows.

![Playwright Logo PNG Vector (SVG) Free Download](https://images.openai.com/static-rsc-4/LPhp5WGFs8AsPwkA7RmoAkYT6701vGdG47geLkGSQevIZhbryTBOdW8tXQjnI41K4_cWYD-C96onm7VCnjjtX5TT3xzeansU0mqC5KqXSxLIIOjWPs51DxGr3-6SBCNPQOmaVmw59V2ITdFfB8o2lqY65ner3viTnkZkZMPBWp0?purpose=inline)

Playwright — the browser automation tool

Use it to open Chromium, Firefox, or WebKit, interact with pages, and extract rendered content. It supports Python.

![Beautiful Soup in Python. It is a Python library for pulling data… | by Shivangi Sareen | Medium](https://images.openai.com/static-rsc-4/-vn4bZs71v2cJzzz-GXKq1kTsmkH4gmXkpf5gpb84IR9lBNxaWbiQHyuqXLwro53ERISHvvXmqmjvAiDBwY7RA8p_w6yYMrJOwWEgUMhvwwXqARXkj74BXXbKROmM-Oqq-9J2bNxK6BUDkmPXYVWioxJB_6MVVLG4erjAXsxtPM?purpose=inline)

Beautiful Soup — the HTML parser

Add it when you need to parse HTML and extract titles, links, tables, or other elements. It does not operate the browser itself.

A useful rule of thumb:

* API or direct HTTP request: start with Python's `requests` library.

* Static HTML page: try `requests` plus Beautiful Soup.

* Page that needs JavaScript, clicks, scrolling, or login: use Playwright.

* Complex backend service: use Java and Spring Boot where appropriate.

You don't need to learn all three tools at once. Start with Python and Playwright, then add Beautiful Soup when a project needs it.

## 2. Your first project: Browser Scraper

Build a small program that opens a website, extracts information, and saves it to a CSV file.

![What is Screen Scraping and How To Do It With Examples](https://images.openai.com/static-rsc-4/o5tF0BopCxxIkk8hkwXQYwhfhuyDZ1D6fWgLr7Tv4G8gdcCzkkJhv1xV3iaXUe4B7m_DSE-upqDykaAYULzaKxLI9KFhKBXgWlIQg_-WfHXoUcckpFlADrEp8Yjt6d7dkfUbCFUt6rE1_EwClXnFBsUnHhurBumgjD7ByYdJEfk?purpose=inline)

## Project: Quote Collector

Difficulty: Beginner · Python + Playwright · Linux and Windows

The program will:

* Open a practice website designed for web scraping.

* Extract quotes, authors, and tags from each page.

* Follow the pagination link to collect multiple pages.

* Save the results to `quotes.csv`.

* Handle browser cleanup and file output.

We'll use the JavaScript-rendered practice site

quotes.toscrape.com

, so you can practice actual browser automation instead of only downloading static HTML.

## 3. Set up your project

First, make sure Python 3 is installed.

Create a project directory and virtual environment:

Bash

```
mkdir quote-scraper
cd quote-scraper

python -m venv .venv
```

Activate the environment.

On Ubuntu/Linux:

Bash

```
source .venv/bin/activate
```

On Windows PowerShell:

PowerShell

```
.venv\Scripts\Activate.ps1
```

Install Playwright and its Chromium browser:

Bash

```
python -m pip install playwright
python -m playwright install chromium
```

Create this project structure:

```
quote-scraper/
├── .venv/
├── scraper.py
├── quotes.csv       # generated by the program
└── requirements.txt
```

Record your dependency:

Bash

```
python -m pip freeze > requirements.txt
```

## 4. Write the scraper

Create `scraper.py` in your IDE.

Python

Run

```
import csv
from pathlib import Path
from playwright.sync_api import sync_playwright

URL = "https://quotes.toscrape.com/js/"
OUTPUT = Path(__file__).parent / "quotes.csv"


def scrape_quotes():
    quotes = []

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()

        try:
            page.goto(URL, wait_until="domcontentloaded", timeout=30000)

            while True:
                page.locator(".quote").first.wait_for()

                for item in page.locator(".quote").all():
                    quotes.append({
                        "quote": item.locator(".text").inner_text(),
                        "author": item.locator(".author").inner_text(),
                        "tags": ", ".join(
                            item.locator(".tag").all_inner_texts()
                        ),
                    })

                next_link = page.locator("li.next a")

                if next_link.count() == 0:
                    break

                next_link.click()
                page.locator(".quote").first.wait_for()

        finally:
            browser.close()

    return quotes


def save_quotes(quotes):
    with OUTPUT.open("w", encoding="utf-8-sig", newline="") as file:
        writer = csv.DictWriter(
            file,
            fieldnames=["quote", "author", "tags"],
        )
        writer.writeheader()
        writer.writerows(quotes)


def main():
    quotes = scrape_quotes()
    save_quotes(quotes)

    print(f"Collected {len(quotes)} quotes.")
    print(f"Saved to: {OUTPUT}")


if __name__ == "__main__":
    main()
```

Run it:

Bash

```
python scraper.py
```

The script should create `quotes.csv` next to `scraper.py`. You can open that file in a spreadsheet application or process it with another Python script.

Note: the scraper assumes each page contains at least one quote and that the practice site's selectors remain unchanged. For a production scraper, add retries, more robust empty-page handling, and logging.

## 5. Understand how the program works

1. Start Python script

2. Playwright launches Chromium

A real browser engine

3. Load page and extract data

Quotes → authors → tags

4. Follow next-page links

Repeat until no next page exists

5. Write quotes.csv

The important concepts are:

* `page.goto()` — navigate to a web page.

* `page.locator()` — find elements using CSS selectors.

* `.inner_text()` — extract visible text.

* `.click()` — interact with the page.

* `csv.DictWriter` — save structured data into a CSV file.

* `Path` — handle filesystem paths in a cross-platform way.

## 6. How this connects to your Java backend learning

The project also teaches you concepts that transfer to Java:

| Automation project                    | Java-related concept                         |
| ------------------------------------- | -------------------------------------------- |
| Python functions                      | Java methods                                 |
| Dictionaries                          | `Map`                                        |
| Lists                                 | `List`                                       |
| `Path` and file operations            | `Path`, `Files`                              |
| CSV records                           | Java data classes or records                 |
| Exceptions                            | `try` / `catch`                              |
| HTTP and browser requests             | `HttpClient`                                 |
| Dependencies and virtual environments | Maven dependencies and project configuration |

One important distinction: Playwright automates a browser; it isn't a replacement for an HTTP client. When you only need to call a REST API, direct HTTP requests are often simpler and faster.

## 7. Your next three projects

1. Quote Collector — complete the project above and save results to CSV.

2. File Organizer — scan a directory, classify files by extension, and move them into folders. Use `pathlib` and `shutil`.

3. API Monitor — request a public API periodically, save JSON responses, log failures, and compare results between runs.

After these projects, you'll have a useful automation toolkit that works on both Linux and Windows while continuing to build your backend programming skills.

My advice: start with Python for these scripts, and keep Java as your main path for backend development. You don't need to choose just one language for everything.


