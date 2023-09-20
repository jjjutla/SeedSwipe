# Seedswipe Recommendation System Model (Content Based Filtering)

## Business Problem

<p>Companies like Netflix are all about connecting people to the movies they love. To help investors find those movies, they developed world-class movie recommendation system: CinematchSM. Its job is to predict whether someone will enjoy a movie based on how much they liked or disliked other movies. Netflix uses those predictions to make personal movie recommendations based on each investors’s unique tastes. And while Cinematch is doing pretty well, it can always be made better.</p>

<p>There are a lot of interesting alternative approaches to how Cinematch works that netflix haven’t tried. Some are described in the literature, some aren’t. For the Fastgen Hackathon I tried to test these alternative approches using a Cunchbase Reccomendation System which powers the reccomendation system for Seedswipe, reccomending Investors with potential startups based on their portfolio, similar investors portflios and the timing.</p>


## Sources
* Netflix blog: https://medium.com/netflix-techblog/netflix-recommendations-beyond-the-5-stars-part-1-55838468f429 (very nice blog)
* Surprise library: http://surpriselib.com/ (I use many models from this library)
* Surprise library doc: http://surprise.readthedocs.io/en/stable/getting_started.html (we use many models from this library)
* Installing surprise: https://github.com/NicolasHug/Surprise#installation
* Research paper: http://courses.ischool.berkeley.edu/i290-dm/s11/SECURE/a1-koren.pdf 
* SVD Decomposition : https://www.youtube.com/watch?v=P5mlg91as1c

<p><b>Real world/Business Objectives and Constraints</b></p> 

<p><b>Objectives:</b></p>
1.	Predict the rating that an investor would give to a startup that they have not yet rated. Instead of a binary classifer I use a similar approach to Netflix - 1-5 stars, which we can infer in different ways later for longevity.<br>
2.	Minimize the difference between predicted and actual rating (RMSE and MAPE).

<p><b>Constraints:</b></p>
1.	Some form of interpretability.
2.	There is no low latency requirement as the recommended startups can be precomputed earlier.

<p><b>Data (Crunchbase):</b></p>
* There are 17770 unique startups IDs.
* There are 23189 unique investor IDs.
* There are ratings. Ratings are on a five star (integral) scale from 1 to 5, for now this is somewhat an arbitary number on the success of the company but can be eavaluated to a better metric after the hackathon.

## Mapping the real world problem to a Machine Learning Problem

<p><b>Type of Machine Learning Problem</b></p>
<p>
For a given startup and investor we need to predict the rating would be given by him/her to the startup and if this is something that they would invest/fits their portfolio. The given problem is a Recommendation problem. It can also seen as a Regression problem.
</p>

<p><b>Performance metric</b></p>
1. Mean Absolute Percentage Error
2. Root Mean Square Error


<p><b>Machine Learning Objective and Constraints</b></p>
1. Try to Minimize RMSE
2. Provide some form of interpretability