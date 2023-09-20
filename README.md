# SeedSwipe
# Fastgen hackathon


## Workflow Breakdown:
**1. User Authentication:**
- User logs in or signs up as an investor.
- Fastgen's authentication is used to verify the user.
- Twilio SMS is used as a second factor for authentication.

**2. User Preferences:**
- After successful authentication, the user is directed to a preferences screen.
- The user fills out preferences like industry, company size, employee size, funding, etc. as well as information like LinkedIn, etc.

**3. Swiping Screen:**
- Startups are pulled from Crunchbase based on the user's preferences though our foundation model.
 - This data is stored in an SQL database.
- Startups are randomly shown to the investor for swiping based on the model.
- The startup logo is fetched from the LinkedIn API.
  
**4. Match & Chat:**
- If there's a match between a startup and an investor, an animation is displayed.
- A chat feature is enabled for the matched pair.
- The investor can send money to the startup via the Stripe API within the chat.
- Once the money is sent, an automated email is sent to the investor for confirmation.
  
**5. Referral Feature:**
- There's a button in the app allowing users to share a Fastgen referral link.

## Fastgen Codeblocks Implementation:

I'll probabbly break down the endpoints and their uses here:
User Authentication:
Use the Variable block to capture user input.
Use the HTTP Request or GraphQL block to communicate with Fastgen's authentication.
Use the Twilio SMS block for sending an authentication code.
User Preferences:
Use the Variable block to capture user preferences.
Store these preferences using the DB Query block (INSERT operation).
Swiping Screen:
Use the HTTP Request block to fetch startups from Crunchbase based on filters.
Use the DB Query block to store this data in the SQL database.
Use the HTTP Request block to fetch the startup logo from LinkedIn.
Match & Chat:
Use the IF condition block to check for a match.
Use the Variable block to enable the chat feature.
Use the HTTP Request block to integrate with the Stripe API for payments.
Use the Sendgrid or Mailgun block to send an automated email confirmation.
Referral Feature:
Use the Variable block to generate and store the referral link.
Use the Email (SMTP) or other relevant blocks to share the referral link.
