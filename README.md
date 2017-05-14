# instagramDemo

### Note
This is a InstagramDemo, so the authToken can be expires at anytime. If you meet so we can just do a code review inside. Welcome to discuss more if you need.

### USE Case
run the app, you can see there are a list of feed with details shows

click one of the cell:
get navigate to detail page for selected feed.

### UI design

The entire project is using auto-layout. Due to the fact that its lack of design, so we would just make it looks good so far. The design is adapted for all iPhones screen(5,6,6+). 

Also welcome to discuss the way without auto-layout.


### Code design

Network request is designed to follow the patten: 
Object: the response object parsed from Json
Service: all requests with Router need to be handled in this class.  (InstagramUserService,  InstagramMediaService …)
Router: providing API and Param.  (InstagramUserRouter,  InstagramMediaRouter …)

### MVVM
Model: Feed
View: FeedCell
ViewModel: FeedCellViewModel



#### Navigation
UINavigationController is being used for this project. 



