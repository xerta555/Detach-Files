<p align="center">
<h2 align=center> Detach </h3>

<p align="center">
 <a href="https://forum.xda-developers.com/android/software-hacking/mod-detach-market-links-theme-ready-apps-t3447494"><img src="https://img.shields.io/badge/XDA-Thread-yellow.svg?longCache=true&style=flat-square"></a><br />
 <a href=https://t.me/Detach_gms_apps><img src="https://img.shields.io/badge/Telegram-Channel-blue.svg?longCache=true&style=flat-square"></a></p><br />

<h3 align=center>Introduction</h3>
<h4 align=center><b>INFO:</b>This Module is a port of the original MOD created by hinxnz - <a href="https://forum.xda-developers.com/member.php?u=1909299">XDA thread/OP</a> to work as a Magisk module for Android, so all credits to him/her.<h4>
<br />
 
<h4>Short explanation:</h4>
<h5>With this MOD, you can "detach" app(s) from your Google Play Store automatic update process, it completely hides the update in the "My games and applications" section. So you won't see your detached apps from your Play Store pending updates!<br /></h5>
<br />

<b>Setup steps:</b>
- If you just want to detach common app(s) like Hangouts, YouTube, Facebook, etc, just download the <a href="https://raw.githubusercontent.com/xerta555/Detach-Files/master/detach.txt">detach.txt</a> file and save it in your `/sdcard/` folder.
- If you want to detach some specific apps, so download the <a href="https://raw.githubusercontent.com/xerta555/Detach-Files/master/detach.custom.txt"> detach.custom.txt</a> file and save it in your `/sdcard/` folder.
- Make sure that the file(s) detach.txt and/or detach.custom.txt are in your `/sdcard/` folder.
- Flash the module ZIP (Magisk Manager and TWRP are supported)
- Done!
<br />

<b>Compatibility:</b>
- Magisk (v15 to lastest)
- All Android devices from Lollipop to Pie
- Magisk Manager & TWRP
- Substratum themes for Play Store
- Scheduling
<br />

------------------------------------------------------------------------------------

<h5><b>Warning</b>: In a very minority of cases, this MOD can purely break the Play Store app, so please backup your phone before setup this MOD on your phone. Thank you for your understanding.</h5>

------------------------------------------------------------------------------------

#### Terminal features:
- Instant detaching: instantly detaching your favorites app(s)
- Add app(s): detach new app(s)
- Remove app(s): attach again app(s) to Play Store updates
- Kill: killing Play Store application
- Clear Play Store datas: clear the Play Store's app datas
- Task scheduler: automaticaly setup a task scheduler to automaticaly detach your app(s) from the Play Store's updates
- Silent mode: enable or disable the silent mode, to have cleaner and less cluttered order results
- Busybox compatibility check
- Help: a help menu with all possible commands explained in more detail

------------------------------------------------------------------------------------

<br />
<h3><u>For common's apps:<u></h3>
- You have to download the following file: <a href="https://raw.githubusercontent.com/xerta555/Detach-Files/master/detach.txt" ">detach.txt</a> 
 
- Saving it on root of your storage:<br />
(So: `/sdcard/detach.txt` or `/storage/emulated/0/detach.txt`)

<img src="https://image.ibb.co/kDxwoA/Screenshot-20181025-211140.png" alt="Screenshot-20181025-211140.png" height="1200" width="600"><br />
<br />
<h4>- As writed in the file:</h4>
 - uncomment the app(s) you want to "hiding" from Play Store updates:<br />

<img src="https://image.ibb.co/kCBd1V/Screenshot-20181025-211255.png" alt="Screenshot-20181025-211255.png" height="1200" width="600"><br />

------------------------------------------------------------------------------------

<br />
<h3><u>For any other apps:<u></h3>
- You have to download this file: <a href="https://raw.githubusercontent.com/xerta555/Detach-Files/master/detach.custom.txt" "> detach.custom.txt</a>
 
- Saving it on root of your internal storage as before:<br />
(So: `/sdcard/detach.custom.txt` or `/storage/emulated/0/detach.custom.txt`)

<img src="https://image.ibb.co/mV1kMV/Screenshot-20181028-201636.png" alt="Screenshot-20181028-201636.png" height="1200" width="600"><br />

- Write your app(s) package(s) name(s) one by line like that:<br />

<img src="https://image.ibb.co/hL1kMV/Screenshot-20181028-201657.png" alt="Screenshot-20181028-201657.png" height="1200" width="600"><br />
<br />
<br />

<u>### Common Question and Answers:<u>

#### Q: A problem ?

A: Ask on Telegram group or/and on XDA OP (scroll up)

#### Q: When changes are applied ?

A: When you flash the module, and when you run the command: su -c detach -id.

#### Q: Where to find a package name for an app?

A: The name of the package here is in the middle of the two texts framed in grey::<br />
`https://play.google.com/store/apps/details?id=`com.package.name`&hl=en`

#### Q: Apps aren't hiden in my Play Store!

A: If you have already run the command (`su -c -detach -id`), report on the Telegram group.<br />

#### Q: How to "attach" again an app who is previously "hided" ?

A: Just comment again the app name in the detach.txt file or delete the corresponding package name in the detach.custom file and wait some times. Or if you are not afraid of anything, remove Play Store app datas but you will loose your Play Store apps updates history.

#### Q: What does this module do ? Does touch the system partition ?

A: It only edit an SQL database file in Play Store folder on your `/data` partition. No more, no less.

#### Q: After several hours, my detached app(s) are back in my Play Store, what's wrong ?

A: With a recent update of the Play Store, an unknow wakeloks refresh the SQL database file of the Play Store.
To fix it: just install a Terminal Emulator app or Termux (or another terminal emulator app) and run the command:
=> `su -c detach -id`

#### Q: My Play Store history search will be deleted ?

A: <b>ONLY</b> if you select the 'c' option in the terminal menu (as indicated in the menu).

#### Q: Is it possible to add or remove app(s) from your the Detach setup ?

A: Yes! See below:
- For adding:
    - `su -c detach -a` (or `su -c detach --add-app`)

- And for removing:
    - `su -c detach -r` (or `su -c detach --rem-app`)

#### Q: And if I'm too lazy to do the detach command every time the Play Store updates its file?

A: You can schedule the `su -c detach -id` command
- To do this, just do:
    - Run `su -c detach -t` (or `su -c detach --task-scheduler`) command in your terminal
    - Choose a way.
