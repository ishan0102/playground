import json
import time

import arxiv
import requests
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from tqdm import tqdm


def get_authorization_token():
    # Set up options for headless browsing
    options = Options()
    options.add_argument("--headless")
    options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3")

    # Set up the Selenium webdriver
    driver = webdriver.Chrome(options=options)

    # Open the website in the browser
    driver.get("https://papers.labml.ai")

    # Wait for the page to load
    time.sleep(1)

    # Retrieve the authorization token from cookies
    cookies = driver.get_cookies()
    authorization_token = next((cookie["value"] for cookie in cookies if cookie["name"] == "Authorization"), None)

    # Close the browser
    driver.quit()

    return authorization_token


def fetch_paper_details(paper):
    title = paper["title"]["text"].replace("\n", " ")
    title = " ".join(title.split())

    search = arxiv.Search(
        query=title,
        max_results=1,
    )

    return next(search.results())


# Get the initial authorization token
authorization_token = get_authorization_token()

url = "https://papers.labml.ai/api/v1/papers?sorted_by=weekly&start=0&end=5"

headers = {
    "Authorization": json.dumps({"token": authorization_token}),
    "Accept": "*/*",
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36",
}

try:
    with requests.Session() as session:
        response = session.get(url, headers=headers)
        while response.status_code != 200:
            print(f"Status code: {response.status_code}")
            print(f"Response: {response.json()}")
            print("Retrying...")
            time.sleep(1)
            response = session.get(url, headers=headers)

        papers = response.json()["data"]["papers"]
        for paper in papers:
            try:
                metadata = fetch_paper_details(paper)
                print(f"{metadata.title}: {metadata}")
            except Exception as e:
                print(f"Error occurred: {e}")

except Exception as e:
    print(f"Error occurred: {e}")
