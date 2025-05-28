This is an old experiment I'm finally uploading, where I was messing around with both designing and Swift app and utilizing APIs. Being a big fan of travel, I created a travel-themed app, which would help people both find places to travel to and plan out trips to the places that interested them. To achieve these purposes, I created an Instagram-esque infinite scrolling feed which pulled random pictures of countries from Pixabay using their API, and allowed the user to "like" countries that looked interesting. These countries would then be stored in a list in a separate tab, where they could view their liked countries, then plan and save trip info. I made sure to use error handling appropriately so that the planner portion of the app could be used seamlessly offline even if the feed component couldn't, making it useful for remembering trip information even in the often low-connectivity environment of an airport or flight. I also experimented with the UX design side of app development as well, creating a splash screen, animations for actions such as liking, swipe physics, and more to create a responsive and aesthetically pleasing user experience. Overall, it was a very fun and very informative project that taught me a lot about APIs, networking, and app design. However, since this was created a while ago, it may experience some compatibility issues with the latest version of Swift/Xcode, so be aware it may require some configuration or tweaking to run on the current release.


If you plan on running this project, also make sure to add a file called "Pixabay.plist" with the following text in it:<br><br>
\<?xml version="1.0" encoding="UTF-8"?><br>
\<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http&#8203;://www&#8203;.apple.com/DTDs/PropertyList-1.0.dtd"><br>
\<plist version="1.0"><br>
\<dict><br>
	&emsp;\<key>PixabayUrl\</key><br>
	&emsp;\<string>https&#8203;://pixabay.com/api/?key=\</string><br>
	&emsp;\<key>PixabayApiKey\</key><br>
	&emsp;\<string>**Your API key here**\</string><br>
	&emsp;\<key>PixabayImageType\</key><br>
	&emsp;\<string>image_type=photo\</string><br>
	&emsp;\<key>PixabayResultsPerPage\</key><br>
	&emsp;\<string>10\</string><br>
\</dict><br>
\</plist><br>

Don't forget to add your API key in the string tag underneath the "PixabayApiKey" key!
