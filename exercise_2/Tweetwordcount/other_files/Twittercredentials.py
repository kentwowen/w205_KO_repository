import tweepy

consumer_key = "rhWTppMpsRsuOaFaBlGADVZBI";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "QqCS6j1wG34YKOLa7zERMF7ekr5UNIGAmqtmbQFt2YFhkY1M5o";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "759240387550670850-p0qPoD3xqGCcGeaaWomkYaMSg76Cl7g";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "SAdA8rNRn4UygG4sNqL3sioZeM94SCM6SHMvthLFQGcuo";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



