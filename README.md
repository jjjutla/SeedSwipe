# [SeedSwipe](https://twitter.com/SeedSwipe)
You've heard about Tinder, but what about SeedSwipe? 

SeedSwipe's iOS App seamlessly connects investors to startups. It uses a Machine Learning model inspired by Netflix's content based filtering that pairs the most compatible startups with investors. The App is integrated with the Crunchbase database for startup and investor data and facilitates instant investment transactions via Stripe's trusted payment processing. To ensure utmost security, SeedSwipe incorporates Twillo and Fastgen's authentication. Additionally, with Fastgen at it's core, the app provides email confirmations for every investment and match.

[Check out our Video](https://www.youtube.com/watch?v=8A-XHYUh-Mg)

[![Video Thumbnail](https://img.youtube.com/vi/8A-XHYUh-Mg/maxresdefault.jpg)](https://www.youtube.com/watch?v=8A-XHYUh-Mg)


### Images
<img src="https://github.com/nkoorty/SeedSwipe/assets/80065244/07382df8-4003-4cba-bd3f-29e419beae08" width=16% height=16%>
<img src="https://github.com/nkoorty/SeedSwipe/assets/80065244/6e435f6b-2f60-4edf-840e-8da2d0abb075" width=16% height=16%>
<img src="https://github.com/nkoorty/SeedSwipe/assets/80065244/222ef022-6bae-4f59-9742-bf656188e020" width=16% height=16%>
<img src="https://github.com/nkoorty/SeedSwipe/assets/80065244/9a00aa43-e031-4e4e-bd65-d536012ffd89" width=16% height=16%>
<img src="https://github.com/nkoorty/SeedSwipe/assets/80065244/6ccd7aa9-b1ce-4e25-979c-bb5f278508bf" width=16% height=16%>
<img src="https://github.com/nkoorty/SeedSwipe/assets/80065244/45eba53c-a4d1-4b96-a7b0-43ca0dbbf5d7" width=16% height=16%>

## Workflow Breakdown:
### **1. User Authentication:**

- https://seedswipehack.fastgenapp.com/auth/signup
- https://seedswipehack.fastgenapp.com/auth/signin
- https://seedswipehack.fastgenapp.com/users

We used Fastgen's built in authentication for  user management to create, manage and view users. Adding a database query made it easy to save users to a database so we could build endpoints around those so that only the registered users could have access to these routes. Twillo SMS was also used for two-factor-authentication.

## **2. User Preferences:**

- https://seedswipehack.fastgenapp.com/userinfo

After successful authentication, the user is directed to a preferences screen. The user fills out their preferences like industry, company size, employee size, funding, etc. as well as information like their LinkedIn. The LinkedIn API is used to display media and profile pictures. This preference information is stored in the database as a boolean value and then fed into ML selection model hosted on huggingface.

## **3. Swiping Screen:**
- https://data.crunchbase.com/docs/using-the-api
- [Foundation Model](https://github.com/nkoorty/SeedSwipe/tree/main/ReccomendationModel)

Our content based filtering machine learning model, which is based on a similar model as Netflix's *CinematchSM* reccomendation model is what is used to display and select potential matches. View the [Documentation](https://github.com/nkoorty/SeedSwipe/blob/main/ReccomendationModel/README.md) and [Code](https://github.com/nkoorty/SeedSwipe/blob/main/ReccomendationModel/SeedSwipe_Model.ipynb) for more details and the training results. The dataset is a collection of investors and startups pulled from the Crunchbase API.

## **4. Match & Chat:**
- https://seedswipehack.fastgenapp.com/match

Once there is a match between the startup and investors an animation is displayed. The match API saves the pair's email to a database and an message is sent to the startup using the SMTP protocol block. The startup will then appear in the apps message inbox where you can message them.

## **5. Investment Payments:**
- https://seedswipehack.fastgenapp.com/payment

Once in the chat feature a button for the investor to send payments will appear. The investor can send their funding through our payments endpoint which is connected to Stripe's API. Once they have sent the funding to the startup the investor will receive an email with their unique investor code which is taken from a database. We built an event workflow to easily manage and handle the stripe webhook, databse query and the STMP sending.

## **6. Referral Feature:**
There's a button in the app allowing users to share a Fastgen referral link!

## iOS App Description
The iOS App was built entirely using SwiftUI and internal Apple toolings. One external package for "AlertToasts" was used in order to indicate matches. The App uses MVVM architecture and makes API calls using native Swift commands.

## Team

- [Jeevan Jutla](https://www.linkedin.com/in/jeevan-jutla/): ML Model & Fastgen
- [Artemiy Malyshau](https://www.linkedin.com/in/artemiy-malyshau/): iOS App & Fastgen


