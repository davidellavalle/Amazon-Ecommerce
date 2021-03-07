# Web-Scraping

For the current project we were contacted by an international company willing to open a new E-commerce business in EU and with no background with this type of business.  
The customer focus was on Electronic products, mainly Laptops, Headphones, Processors, Mouses, Cameras, Monitors...  
No sales nor product data were provided by the customer.  
Our team had to first focus on knowing the domain in details, understand the business model and then look for appropriate data sources to come up with conlusions and strategies to determine strenghts and weaknesses of this form of business.

<p align="center">
  <img src="https://user-images.githubusercontent.com/73824871/110248756-ff3b2e80-7f72-11eb-8db9-3626722be5d8.png">
</p>

## Business Understanding

### E-commerce

<p align="center">
  <img src="https://user-images.githubusercontent.com/73824871/110248484-c058a900-7f71-11eb-9765-3fc1deeef039.png">
</p>

E-commerce is the purchasing, selling and exchanging goods and services over computer networks (internet) through which transaction or terms of sale are performed Electronically

**Step by step**  
1 - A consumer uses a web browser to connect to the home page of a merchant‘s Website on the internet.  
2 - The consumer browses the catalog of products featured on the site and selects the items to purchase.  
3 - When the consumer is ready to complete the purchase, provides a bill-to and ship-to address for purchase and delivery.  
4 - Finally the consunmer provides the payment information, cc, and submit the order. Taxes, shipping and handling charges are included in the price.  

All considered it seems to be a really easy way of doing business. Let's have now a look at the benefits:  

- The industry is rapidly growing and it is expected to hit the $5 trillion revenue by this year.  
- Covid19 has somehow reshaped our world and more consumer have begun shopping online in greater numbers and frequency.  
- The startup cost are way lower compared to a physical retail store (rent, signs, design, inventory, equipment...)  
- Ecommerce businesses are open 24H and are easy to access.    
- The audience they refer to is no longer local but international.  
- It is easier to collect customer data for analysis.    
- Opportunity to target the consumers through website personalization and email marketing campaigns.
- Ecommerce business are able to process a high number of orders and are easily scalable.

When thinking about Business models are 4 the traditional types:

**B2B (Business-to-Business)** - The largest form of Ecommerce. Buyer and seller 2 different entities, similar to manufacturer issuing goods to retailer.  
**B2C (Business-to-Consumer)** - In this case the business and the consumer have a direct trade and interaction. The sale of good or services is directly with the final customer.  
**C2B (Consumer-to-Business)** - Exact inverse of the traditional model in which companies offer goods and services to consumers. Eg. The author of a piece of content offers a link to an online business, thus facilitating the purchase of a product (e.g. a book on Amazon.com), for which the author could receive part of the earnings.  
**C2C (Consumer-to-Consumer)** - The opportunity offered by several websites like Ebay to sell unused or redundant stuff online thanks to payment systems like Paypal.

What are the three top Ecommerce businesses in Europe?  

1 - Amazon $28 Billion   
2 - Otto $12 Billion  
3 - John Lewis $7,5 Billion  

## Data Understanding

### Web Scraping

One of best way to know your competitor is to look at what they show publicly on their websites. There are so much informations like product details, prices, customer reviews, product seller information etc. which can help understand the competitor's business in a great extent.  
To gather data from websites, we used a technique called Web scraping which is basically a technique of extracting relevant information from websites.  

<p align="center">
  <img src="https://user-images.githubusercontent.com/73824871/110249141-e9c70400-7f74-11eb-8e48-4b057a87ce37.png">
</p>

This process can be manual (tedious and redundant) or fully automated thanks to entire ecosystems of multiple tools and libraries built for this extraction process.  
The steps for a succesfull Web scraping are the following:
 - Figure out what is needed to be extracted and locate the information on the webpage.
 - Send a request to the HTTP or website you are targeting.
 - The server processes the request and if legitimate we can then read and extract the HTML or CSS of the page  
A deep knowledge of HTML is not needed, the foundation will be enough, know what the unique attributes are, ids, classes etc..., navigate the dom(documnet object model - model or tree of layout for a website, how is the data structured?)
- The Information is then saved in the set variables - beautifulsoup is the library that can be used for parsing information





