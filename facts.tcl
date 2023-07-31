

############# Random FunFacts #################
#A simple script to post random funfacts in a #
#channel.                                     #
#                                             #
#                                             #
#                                             #
#                                             #
#                                             #
#                                -Error       #
###############################################



 package require http

#Bot channel to run the script#
set channel "#bottest"

#Random facts time
set time 1

if {[string compare [string index $time 0] "!"] == 0} { set timer [string range $time 1 end] } { set timer [expr $time * 60] } 
if {[lsearch -glob [utimers] "* fact *"] == -1} { utimer $timer fact }


proc fact {} { 
global channel time fact timer 
set url "http://www.randomfunfacts.com/"
set page [http::data [http::geturl $url]]
regexp {<i>(.*?)<\/i>} $page a fact 
#foreach line $fact { putserv "PRIVMSG $channel :Facts: $fact" } 
putserv "PRIVMSG $channel :Facts: $fact" 
if {[lsearch -glob [utimers] "* fact *"] == -1} { utimer $timer fact } 
}
