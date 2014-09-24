rdar-18436480
=============

Apropos http://openradar.appspot.com/radar?id=5842403076341760  rdar://18436480

Voiceover doesn't click on WebView buttons that are scrolled off the screen

Number:	rdar://18436480	Date Originated:	2014/09/23
Status:	Open	Resolved:	
Product:	iOS	Product Version:	iOS 8.0 (12A365)
Classification:	Serious Bug	Reproducible:	Always
 
Summary:
Consider a UIViewController containing a UIWebView whose HTML content is long enough that it scrolls off the screen; at the bottom of the HTML is a button. Voiceover users can right-swipe through the content to have the text read aloud.

But when the Voiceover user swipes to the button and double-taps to activate the button, nothing happens; its onclick event handler never fires.

Steps to Reproduce:
Here's two ways to reproduce the bug: the quick way, and the clear way.

1a) The quick way. Clone this github repo.

Open the included project, build the app, and install it to an iPhone.

1b) The clear way. Using Xcode 6, create a new project with the "Single View Application" template. Replace ViewController.m with the attached file, or just replace the viewDidLoad method in the existing ViewController.m with this implementation:

```
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIWebView* webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURL* base = [NSURL URLWithString:@"http://localhost"];
    [webView loadHTMLString:@"<html><body>1<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><button onclick='alert(1);'>button" baseURL:base];
    [self.view addSubview:webView];
}
```

2) In non-Voiceover mode, you can see that the repro app displays some text (just the number "1") and then has a bunch of white space. Scroll all the way down to the bottom of the UIWebView; there's a button there named "button." When you tap on the button, a JavaScript alert appears, displaying the text, "1".

Now, enable Voiceover on the iPhone (Settings app -> General -> Accessibility -> Voiceover) and open the app. Voiceover will read the text aloud: "Repro. 1." Swipe right. "Button: Button." Double-tap to activate the button.

Expected Results:
A JavaScript alert should appear when you double tap, just as it does when you tap the button in non-Voiceover mode.

Actual Results:
Voiceover makes the "button tap" sound effect and says, "Button," but nothing else happens.

Version:
iOS 8.0 (12A365)

Notes:
The bug goes away when the <br> elements are removed from the HTML, which would make the button visible on the screen. The bug only manifests when the button is scrolled off the screen, so it's not visible. (Note that in Voiceover mode there's no way to scroll the UIWebView to make the button visible on the screen, and even if there were a way to do it, visually impaired users would have no way of knowing that they'd need to do this as a workaround.)

Also note that this bug is a regression from iOS 7.1.

Configuration:
iPhone 6 16GB T-Mobile, using WiFi
