# Seedswipe Recommendation System Model (Content Based Filtering)

Companies like Netflix are all about connecting people to the movies they love. To help investors find those movies, they developed world-class movie recommendation system: CinematchSM. Its job is to predict whether someone will enjoy a movie based on how much they liked or disliked other movies. Netflix uses those predictions to make personal movie recommendations based on each investors’s unique tastes. And while Cinematch is doing pretty well, it can always be made better.


There are a lot of interesting alternative approaches to how Cinematch works that netflix haven’t tried. Some are described in the literature, some aren’t. For the Fastgen Hackathon I tried to test these alternative approches using a Cunchbase Reccomendation System which powers the reccomendation system for Seedswipe, reccomending Investors with potential startups based on their portfolio, similar investors portflios and the timing.

### Objectives:
- Predict the rating that an investor would give to a startup that they have not yet rated. Instead of a binary classifer I use a similar approach to Netflix - 1-5 stars, which we can infer in different ways later for longevity.<br>
- Minimize the difference between predicted and actual rating (RMSE and MAPE).


### Constraints:
- Some form of interpretability.
- There is no low latency requirement as the recommended startups can be precomputed earlier.



### Data (Crunchbase):
- There are 17770 unique startups IDs.
- There are 23189 unique investor IDs.
- There are ratings. Ratings are on a five star (integral) scale from 1 to 5, for now this is somewhat an arbitary number on the success of the company but can be eavaluated to a better metric after the hackathon.




### Type of Machine Learning Problem
For a given startup and investor we need to predict the rating would be given by him/her to the startup and if this is something that they would invest/fits their portfolio. The given problem is a Recommendation problem. It can also seen as a Regression problem.



### Performance metric
- Mean Absolute Percentage Error
- Root Mean Square Error



### Machine Learning Objective and Constraints
- Try to Minimize RMSE
- Provide some form of interpretability
