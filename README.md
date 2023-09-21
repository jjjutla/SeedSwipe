# [SeedSwipe](https://twitter.com/SeedSwipe)
You've heard about Tinder, but what about SeedSwipe? 

With SeedSwipe's iOS app its easier to connect investors to startups. It uses a machine learning model inspired by Netflix's content based filtering that pairs the most compatible startups with investors. The app is integrated with the Crunchbase database for startup and investor data and facilitates instant investment transactions via Stripe's trusted payment processing. To ensure utmost security, SeedSwipe incorporates Twillo and Fastgen's authentication. Additionally, with Fastgen at its core the app provides email conformations for every investment and match.

## Workflow Breakdown:
### **1. User Authentication:**

- https://seedswipehack.fastgenapp.com/auth/signup
- https://seedswipehack.fastgenapp.com/auth/signin
- https://seedswipehack.fastgenapp.com/users

We used Fastgens built in authentication for  user management to create, manage and view users. Adding a database query made it easy to save users to a database so we could build endpoints around those so that only the registered users could have access to the routes. Twillo SMS was also used as a second factor authentication.

## **2. User Preferences:**

- https://seedswipehack.fastgenapp.com/userinfo

After successful authentication, the user is directed to a preferences screen. The user fills out preferences like industry, company size, employee size, funding, etc. as well as information like LinkedIn. The LinkedIn API is used to get the investors profile picture. This preference information is stored in the database as a boolean value and then fed into ML selection model hosted on huggingface.

## **3. Swiping Screen:**
- https://data.crunchbase.com/docs/using-the-api
- [Foundation Model](https://github.com/nkoorty/SeedSwipe/tree/main/ReccomendationModel)

Our content based filtering machine learning model, which is based on a similar model as Netflix's *CinematchSM* reccomendation model is what is used to display potential matches. View the [Documentation](https://github.com/nkoorty/SeedSwipe/blob/main/ReccomendationModel/README.md) and [Code](https://github.com/nkoorty/SeedSwipe/blob/main/ReccomendationModel/SeedSwipe_Model.ipynb) for more details and the training results. The dataset is a collection of investors and startups pulled from the Crunchbase API.

## **4. Match & Chat:**
- https://seedswipehack.fastgenapp.com/match

Once there is a match between the startup and investors an animation is displayed. The match API saves the pairs email to a database and an message is sent to the startup using the SMTP protocol block. The startup will then appear in the apps message inbox where you can message them.

## **5. Investment Payments:**
- https://seedswipehack.fastgenapp.com/payment

Once in the chat feature a button for the investor to send payments will appear. The investor can send their funding through our payments endpoint which is connected to Stripe's API. Once they have sent the funding to the startup the investor will receive an email with their unique investor code which is taken from a database. We built an event workflow to easily manage and handle the stripe webhook, databse query and the STMP sending.

## **6. Referral Feature:**
There's a button in the app allowing users to share a Fastgen referral link!


## Images


## Team

- [Jeevan Jutla](https://www.linkedin.com/in/jeevan-jutla/): ML Model & Fastgen
- [Artemiy Malyshau](https://www.linkedin.com/in/artemiy-malyshau/): iOS App & Fastgen


