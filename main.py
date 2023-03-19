import requests
from bs4 import BeautifulSoup
from random import randrange
from time import sleep
import json
import os

headers = {"user-agent":"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 YaBrowser/22.11.3.838 Yowser/2.5 Safari/537.36"}


def get_urls(name,page_number = 1, end = 10):
    parfumes_urls = []
    newpath = f'/home/dima/Документы/projects/max_project_job/{name}'
    if not os.path.exists(newpath):
        os.makedirs(newpath)
    cookies = {
        'auth.strategy': 'local',
        'i18n_redirected': 'ru',
        '_ga': 'GA1.2.1915737279.1673806069',
        '_ym_uid': '1673806069233062637',
        '_ym_d': '1673806069',
        'aromo_GUEST_ID': '45852960',
        'aromo_USER_VIEWS_GUEST_ID': 'e55034f6-9501-11ed-a069-ac1f6bd14fdb',
        '_ym_isad': '1',
        '_gid': 'GA1.2.1241827459.1674235039',
        '_gat': '1',
        'aromo_LAST_VISIT': '20.01.2023%2020%3A17%3A19',
        'PHPSESSID': '8Y5ob9EuuG6zho58VUtLNJoVlUV4fo2j',
    }
    headers = {
        'authority': 'aromo.ru',
        'accept': 'application/scentbook-v1.0.0+json',
        'accept-language': 'ru,en;q=0.9',
        'cookie': 'auth.strategy=local; i18n_redirected=ru; _ga=GA1.2.1915737279.1673806069; _ym_uid=1673806069233062637; _ym_d=1673806069; aromo_GUEST_ID=45852960; aromo_USER_VIEWS_GUEST_ID=e55034f6-9501-11ed-a069-ac1f6bd14fdb; _ym_isad=1; _gid=GA1.2.1241827459.1674235039; _gat=1; aromo_LAST_VISIT=20.01.2023%2020%3A17%3A19; PHPSESSID=8Y5ob9EuuG6zho58VUtLNJoVlUV4fo2j',
        'referer': 'https://aromo.ru/brands/zara/',
        'sec-ch-ua': '"Chromium";v="106", "Yandex";v="22", "Not;A=Brand";v="99"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': '"Linux"',
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'same-origin',
        'user-agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 YaBrowser/22.11.3.838 Yowser/2.5 Safari/537.36',
    }
    
    while page_number!=end+1:
        params = [
        ('brand', name),
        ('per_page', '40'),
        ('page', f'{page_number}'),
        ('sort', 'popularity'),
        ('order', 'desc'),
        ('brand', name),
        ]
        response_perfumes = requests.get('https://aromo.ru/api/perfumes', params=params, cookies=cookies, headers=headers).text

        with open (f"{name}/page{page_number}.json","w") as file:
            file.write(json.dumps(response_perfumes, ensure_ascii=False))

        with open(f"{name}/page{page_number}.json") as file:
            data = eval(json.load(file))
            for key in data["items"]:
                url_parfume = key["htmlUrl"]
                parfumes_urls.append(url_parfume.replace("\\",""))
        if page_number == 1: end = int(data["lastPage"])
        page_number+=1
    return parfumes_urls



def get_pages():
    brands_urls = []
    for i in range(0,111):
        url = f"https://aromo.ru/brands/page/{i}/"
        #q = requests.get(url,headers=headers).text
        #with open (f"data/page{i}.html","w") as file:
            #file.write(q)
        with open (f"data/page{i}.html",encoding="utf8") as file:
            src = file.read()
        soup = BeautifulSoup(src,"lxml")
        brand = soup.find_all(class_="block-shop__link")
        for el in brand:
            url_brand = "https://aromo.ru"+el.get('href')
            brands_urls.append(url_brand)
    return brands_urls




def get_info(url):
    q = requests.get(url,headers=headers).text
    soup = BeautifulSoup(q,"lxml")
    try:
        name = soup.find('span', class_ = "perfume-page__title-name").text
    except Exception:
        name = "Not information"
    try:
        category = soup.find('span',class_="perfume-page__title-type").text
    except Exception:
        category = "Not information"
    try:
        name_brand = soup.find('span',class_="perfume-page__title-brand").text
    except Exception:
        name_brand = "Not information"
    try:
        all_info = soup.find('div',class_="perfume-page__description html-content").find_all('p')
    except Exception:
        all_info = "Not information"

    if all_info != "Not information":
        description = ' '.join(list(map(lambda x:x.strip('<p>'),all_info[0])))
        structure = ' '.join(list(map(lambda x:x.strip('<p>'),all_info[1])))
    else:
        description = "Not information"
        structure = "Not information"
    data = {
        "Name":name,
        "Category":category,
        "Brand":name_brand,
        "Description":description,
        "Structure":structure
    }
    return data



def get_categories():
    categories_dict = []
    urls_category = []
    url = "https://aromo.ru/concentrations/"
    q = requests.get(url,headers=headers).text
    soup = BeautifulSoup(q,"lxml")
    block = soup.find("div",'concentrations-page__catalog-group').find_all('a')
    for el in block:
        urls_category.append("https://aromo.ru"+el.get('href'))
    for link in urls_category:
        response = requests.get(link,headers=headers).text
        soup = BeautifulSoup(response,"lxml")
        name_category = ' '.join(soup.find('div',"page-block concentrations-detail__right-block page-block_desktop").find('h1',"page-block__title").text.split()[1:])
        description_category = soup.find('div',class_= "app-content html-content html-content_sidebar").find("p").text
        description_category = ''.join(list(map(lambda x:x.strip('\r\t\n\xa0'),description_category)))

        data = {
            'Name': name_category,
            "Description":description_category
        }
        categories_dict.append(data)
        sleep(randrange(2,4))
    return categories_dict


def perfumes():
    name_perfumes = []
    brands_urls = get_pages()
    for i in brands_urls:
        name_perfumes.append(i.split('/')[-2])
    return name_perfumes




def pefumes_get_data():
    perfumes_dict = []
    name_brand = perfumes()
    for brand in name_brand:
        list_urls = get_urls(brand)
        for url in list_urls:
            perfumes_dict.append(get_info(url))            
            sleep(randrange(1,2))
    return perfumes_dict


def big_brand():
    brands_dict = []
    brands_urls = get_pages()
    for el in brands_urls:
        q = requests.get(el,headers=headers).text
        
        soup = BeautifulSoup(q,"lxml")
        name_brand = soup.find(class_ = "brand-page__title-name").text
        
        try:
            brand_description = ' '.join(list(map(lambda x:x.strip('\r\t\n\xa0'),soup.find(class_="html-content").text.split())))
        except Exception:
            brand_description = "Not information"

        if brand_description == "Not information":
            src_image = "Not information"
        else:
            try:
                src_image = soup.find('div', class_="brand-page-content").find('img').get('data-src') 
            except Exception:
                src_image = soup.find('div', class_="brand-page-content").find('img').get('src')

        data = {
            "Name":name_brand,
            "Brand_description":brand_description,
            "Image":src_image
            
        }
        brands_dict.append(data)
        sleep(randrange(1,2))
    return brands_dict

def main():
    with open('Brends.json', 'w',encoding = "UTF-8") as json_file:
            json.dump(big_brand(), json_file, indent=4,ensure_ascii=False)
    with open('Category.json', 'w',encoding = "UTF-8") as json_file:
            json.dump(get_categories(), json_file, indent=4,ensure_ascii=False)
    with open('Perfumes.json', 'w',encoding = "UTF-8") as json_file:
            json.dump(pefumes_get_data(), json_file, indent=4,ensure_ascii=False)
    
    
    
    

if __name__ == "__main__":
    main()