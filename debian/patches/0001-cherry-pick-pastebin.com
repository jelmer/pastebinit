Description: Cherry pick new pastebin.com from upstream
Author: Stéphane Graber <stgraber@ubuntu.com>
Bug-Ubuntu: https://bugs.launchpad.net/bugs/996242
Origin: upstream
Forwarded: not-needed

--- pastebinit-1.3.orig/pastebin.d/pastebin.com.conf
+++ pastebinit-1.3/pastebin.d/pastebin.com.conf
@@ -3,16 +3,18 @@ basename = pastebin.com
 regexp = "http://((([a-zA-Z0-9\-_\.]*)(pastebin\.com)))"
 
 [format]
-content = paste_code
-user = paste_name
-subdomain = paste_subdomain
-private = paste_private
-expiry = paste_expire_date
-format = paste_format
-email = paste_email
+content = api_paste_code
+user = api_paste_name
+subdomain = api_paste_subdomain
+private = api_paste_private
+expiry = api_paste_expire_date
+format = api_paste_format
+email = api_paste_email
 page = page
 submit = submit
 regexp = regexp
+api_dev_key = api_dev_key
+api_option = api_option
 
 [defaults]
 submit = submit
@@ -21,5 +23,7 @@ private = 0
 expiry = 1M
 subdomain = ""
 email = ""
-page = "/api_public.php"
+api_dev_key = 253ce2f0a45140ee0a44ca99aa492260
+api_option = paste
+page = "/api/api_post.php"
 regexp = "(.*)"
