---
layout: page
title: "Google Analytics for Octopress"
date: 2014-04-26 21:52
comments: true
categories: tech
---

Using Octopress as a blog framework is a funny experience, and how to display
some blog stats such as pv is another interesting and challenge task for octopress post are only
static html pages which means you cannot easily record the count by githubpages.

Google Analytics Service(GA) is a nature choice for web site analysis and there is
already an Octopress plugin called jekyll-ga, which can sort blog posts by 
certain metrics of GA and another improved plugin called octopress-page-view. After trying these plugins, I jogged down some understandings and steps for how to
using GA for Octopress as following:

<!-- more -->
---

# 1. What is Google Analytics
---
Do you know what people do when they visit your website or web app? Or how much
the site contributes to your bottom line? Google Analytics keeps track and makes
it easy for you to learn precisely what's happening. Google Analytics shows you
how to track different market segments and analyze conversion rates, and reveals
advanced techniques such as marketing-campaign tracking, a valuable feature that
most people overlook. 

Accessing https://www.google.com/intl/zh/analytics/ and Using it is the best way to taste GA.
An expert and hands-on book for GA can endow you a systematic view. The link on Amazon is the
following.
http://www.amazon.cn/mn/detailApp/ref=asc_df_0596158009956339/?asin=0596158009&tag=douban-23&creative=2384&creativeASIN=0596158009&linkCode=df0



---

# 2. How to track your site with Google Analytics
---

The above reference can offer your more details about GA. Here I just list some
sensible cognition for understanding how Google Analytics works and how to set
up GA service for your site.


## Tracking ID


When you login to the GA console web page https://www.google.com/analytics/web/, you will asked to create a new project to tracking your site.
First, a tracking ID and a segment of code will be generated.
The tracking ID is the unique ID for your site, and it has the following funtions:

1. Notify the GA service when your site being accessed
   The generated code need to emebeded into your page template, so that the script will be called to notify GA with the tracking ID when someone is viewing your page. This just like the script is telling the GA,"Hello GA,someone in Japan is using the Chrome to view your client's (TrackingID) page, please note down this." 
 So when GA receive this notice, it will record this viewing behavior in some database, and there comes a data design problem? How to organize the data?

2. TrackingID is the tableID
You can imagine there is a data table used for these tracking record, and so a unique tracking ID is mapped into a unqiue table. Simplely speaking, the record will stored into a table called "TrackingID" and the data in this table will be analyzed and generated into a report including some graph displaying in the GA console. Some times you also need to fectch the GA data for other purposes using Google Analytics API  but not only appretiate the generated report in the GA console.

## Google Analytic API
With the generated trakcing ID, a table is created and tracking records are filled in. Then how to get these data is a coming issue the site analyzer will concern about.
Of course, the greate google offer the Google Analytic API. More details about how to program with the API can be found here. 
https://developers.google.com/analytics/devguides/reporting/

More significantly, the lovely google offer a Google Analytic API service in the Google Developers Console: https://console.developers.google.com/project
You can create a project and active the GA API service. The project is a proxy for the following funtions:

1. Authorize the clients who can send GA API request  
The user should create a new client key in this GA API proxy and grant permissions for newly client. 
The generated client key contains **a GA service account** which should also be granted previleges in the GA console and **a private certificate** required by the client.

2. Forward the request to GA and return the response data to clients
Now the client use the authorized GA service account and the private key to send request. The GA API service will forward the request from the client to the GA server to fectch ths data with tracking ID.

---
# 3. Get PageView Data For Octopress
---

## Step 1. Installation 
see more. https://github.com/developmentseed/jekyll-ga

## Step 2. Set up a service account for the GA API
* Turn on the Analytics API and accept the terms of service
Go to API Access on the left sidebar menu, create a new oauth 2.0 client ID, give your project a name, and click next.

* Select Application type: Service account, and click Create client ID
* Note the private key's password. It will probably be notasecret unless Google changes something. You'll need to enter this value in your configuration settings.
* Download the private key. Save this file because you can only download it once. Copy it to the root of your Jekyll repository. Safety tip: To protect this file, add its file name to your .gitignore file and to the exclude list in your _config.yml file
* Note the Email address for the Service account. You'll need this for your configuration settings and in the next step.
* Log into Google Analytics and add the service account email address as a user of your Google Analytics profile: From a report page, Admin > User Management > Add permission for > 

## Step 3. Configure Page-View Plugin
see more. http://jhshi.me/2013/11/10/page-view-plugin-for-octopress/
<p>
<code>
#octopress-page-view </br>
page-view: </br>
  service_account_email:    #XXXXXX@developer.gserviceaccount.com </br>
  key_file: privatekey.p12  #service account private key file </br>
  key_file: privatekey.p12  #service account private key file </br>
  key_secret: notasecret    #service account private key's password </br>
  profileID:                #ga:XXXXXXXX </br>
  start: 3 years ago        #Beginning of report </br>
  end: now                  #End of report</br>
  metric: ga:pageviews      #Metric code </br>
  segment: 			         #All visits optional </br>
  filters:                  #optional </br>
</code>
</p>

service_account_email, key_file, and key_secret come from the Google API console when you set up your service account.

profileID is the specific report profile from which you want to pull data. Find it by going to the report page in Google Analytics. Look at the URL. It will look something like https://www.google.com/analytics/web/?hl=en&pli=1#report/visitors-overview/###########p######/. The number after the p at the end of the URL is your profileID.

The start and end indicate the time range of data you want to query. They are parsed using Ruby's Chronic gem, so you can include relative or absolute dates, such as now, yesterday, last month, 2 weeks ago. See Chronic's documentation for more options.

The metric value is what you want to measure from your Google Analytics data. Usually this will be ga:pageviews or ga:visits, but it can be any metric available in Google Analytics. Specify only one. See the Google Analytics Query Explorer to experiment with different metrics. (Your dimension should always be ga:pagePath)

The segment and filters keys are optional parameters for your query. See the Google Analytics Query Explorer for a description of how to use them, or just leave them out.

The sort key can be true or false. If true, your posts will be sorted first by your Google Analytics metic, then chronologically as is the default. If false or not specified, your posts will sort as usual.

see more api usage. https://developers.google.com/analytics/devguides/reporting/


## Step 4. Fetch Data and Generate Pages
As we all known, the github page only support the static pages, which means the page view count can only be generated at local and write into the generated html.

So <code> rake generate</code> will invoke this fechtin process in the pageview.rb written in ruby. You can read the code and add some debug code such as <code>p results</code> to print the request and the result in the console and to check whether the api request is right.

Here are some ways to check the rightness:  

1. GA API console(https://console.developers.google.com/project) will show the request and the count of the error
2. Your debug code or some threw out excpetion info
3. watch your arguments and check in https://developers.google.com/analytics/devguides/reporting/




  
 
