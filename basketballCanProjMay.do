clear all

// import delimited "[path]/FIBA Database - pbp.csv", numericcols(15 16 17 28)

sum distanceshot, d
return list


tab ac

count if ac=="P2"
gen totaltwoptatt = r(N)
count if ac=="P2" & made=="TRUE"
gen twoptper = r(N)/totaltwoptatt

count if ac=="P3"
gen totalthreeptatt = r(N)
count if ac=="P3" & made=="TRUE"
gen threeptper = r(N)/totalthreeptatt

count if ac=="P2" & zonerange=="Less Than 8 ft."
gen totalcloseatt = r(N)
count if ac=="P2" & zonerange=="Less Than 8 ft." & made=="TRUE"
gen closeper = r(N)/totalcloseatt

count if ac=="P2" & zonerange=="8-16 ft."
gen totallongatt = r(N)
count if ac=="P2" & zonerange=="8-16 ft." & made=="TRUE"
gen longper = r(N)/totallongatt


keep if act=="shot"

gen long2att = 0
gen short2att = 0
gen p3att = 0
gen ftatt = 0
gen long2m = 0
gen short2m = 0
gen p3m = 0
gen ftm = 0

replace long2att = 1 if ac=="P2" & zonerange=="8-16 ft."
replace short2att = 1 if ac=="P2" & zonerange=="Less Than 8 ft."
replace p3att = 1 if ac=="P3"
replace ftatt = 1 if ac=="FT"
replace long2m = 1 if ac=="P2" & zonerange=="8-16 ft." & made=="TRUE"
replace short2m = 1 if ac=="P2" & zonerange=="Less Than 8 ft." & made=="TRUE"
replace p3m = 1 if ac=="P3" & made=="TRUE"
replace ftm = 1 if ac=="FT" & made=="TRUE"

sort nationality uniformnumber name pid
collapse (sum) long2att short2att p3att ftatt long2m short2m p3m ftm, by(nationality uniformnumber name pid)

gen fgp=(long2m+short2m+p3m)/(long2att+short2att+p3att)
gen long2p = long2m/long2att
gen short2p = short2m/short2att
gen p2p = (long2m+short2m)/(long2att+short2att)
gen p3p = p3m/p3att
gen ftp = ftm/fta


drop if missing(long2p)
*drop if long2p == 0
egen long long2prank = rank(long2p), track
sort long2prank
gen double pctllong2p = 100*(long2prank-1)/(long2prank[_N]-1)


collapse (mean) long2p pctllong2p, by(long2prank)
gen expectedpoints = 2 * long2p
twoway line expectedpoints pctllong2p
save long2p.dta,replace






clear all

// import delimited "[path]/FIBA Database - pbp.csv", numericcols(15 16 17 28)

sum distanceshot, d
return list


tab ac

count if ac=="P2"
gen totaltwoptatt = r(N)
count if ac=="P2" & made=="TRUE"
gen twoptper = r(N)/totaltwoptatt

count if ac=="P3"
gen totalthreeptatt = r(N)
count if ac=="P3" & made=="TRUE"
gen threeptper = r(N)/totalthreeptatt

count if ac=="P2" & zonerange=="Less Than 8 ft."
gen totalcloseatt = r(N)
count if ac=="P2" & zonerange=="Less Than 8 ft." & made=="TRUE"
gen closeper = r(N)/totalcloseatt

count if ac=="P2" & zonerange=="8-16 ft."
gen totallongatt = r(N)
count if ac=="P2" & zonerange=="8-16 ft." & made=="TRUE"
gen longper = r(N)/totallongatt


keep if act=="shot"

gen long2att = 0
gen short2att = 0
gen p3att = 0
gen ftatt = 0
gen long2m = 0
gen short2m = 0
gen p3m = 0
gen ftm = 0

replace long2att = 1 if ac=="P2" & zonerange=="8-16 ft."
replace short2att = 1 if ac=="P2" & zonerange=="Less Than 8 ft."
replace p3att = 1 if ac=="P3"
replace ftatt = 1 if ac=="FT"
replace long2m = 1 if ac=="P2" & zonerange=="8-16 ft." & made=="TRUE"
replace short2m = 1 if ac=="P2" & zonerange=="Less Than 8 ft." & made=="TRUE"
replace p3m = 1 if ac=="P3" & made=="TRUE"
replace ftm = 1 if ac=="FT" & made=="TRUE"

sort nationality uniformnumber name pid
collapse (sum) long2att short2att p3att ftatt long2m short2m p3m ftm, by(nationality uniformnumber name pid)

gen fgp=(long2m+short2m+p3m)/(long2att+short2att+p3att)
gen long2p = long2m/long2att
gen short2p = short2m/short2att
gen p2p = (long2m+short2m)/(long2att+short2att)
gen p3p = p3m/p3att
gen ftp = ftm/fta


drop if missing(p3p)
*drop if long2p == 0
egen long p3prank = rank(p3p), track
sort p3prank
gen double pctlp3p = 100*(p3prank-1)/(p3prank[_N]-1)


collapse (mean) p3p pctlp3p, by(p3prank)
gen expectedpoints = 3 * p3p
twoway line expectedpoints pctlp3p
save long3p.dta,replace

use long2p.dta, clear
append using long3p.dta
twoway (line expectedpoints p3p) (line expectedpoints long2p)
twoway (line expectedpoints pctlp3p) (line expectedpoints pctllong2p), title("Expected Points of Three Point & Long Two Point Percentages") xtitle("") ytitle("") legend(order(1 "3p percentile" 2 "2p percentile"))




clear all

// import delimited "[path]/FIBA Database - pbp.csv", numericcols(15 16 17 28)

sum distanceshot, d
return list


tab ac

count if ac=="P2"
gen totaltwoptatt = r(N)
count if ac=="P2" & made=="TRUE"
gen twoptper = r(N)/totaltwoptatt

count if ac=="P3"
gen totalthreeptatt = r(N)
count if ac=="P3" & made=="TRUE"
gen threeptper = r(N)/totalthreeptatt

count if ac=="P2" & zonerange=="Less Than 8 ft."
gen totalcloseatt = r(N)
count if ac=="P2" & zonerange=="Less Than 8 ft." & made=="TRUE"
gen closeper = r(N)/totalcloseatt

count if ac=="P2" & zonerange=="8-16 ft."
gen totallongatt = r(N)
count if ac=="P2" & zonerange=="8-16 ft." & made=="TRUE"
gen longper = r(N)/totallongatt


keep if act=="shot"

gen long2att = 0
gen short2att = 0
gen p3att = 0
gen ftatt = 0
gen long2m = 0
gen short2m = 0
gen p3m = 0
gen ftm = 0

replace long2att = 1 if ac=="P2" & zonerange=="8-16 ft."
replace short2att = 1 if ac=="P2" & zonerange=="Less Than 8 ft."
replace p3att = 1 if ac=="P3"
replace ftatt = 1 if ac=="FT"
replace long2m = 1 if ac=="P2" & zonerange=="8-16 ft." & made=="TRUE"
replace short2m = 1 if ac=="P2" & zonerange=="Less Than 8 ft." & made=="TRUE"
replace p3m = 1 if ac=="P3" & made=="TRUE"
replace ftm = 1 if ac=="FT" & made=="TRUE"

sort nationality uniformnumber name pid
collapse (sum) long2att short2att p3att ftatt long2m short2m p3m ftm, by(nationality uniformnumber name pid)

gen fgp=(long2m+short2m+p3m)/(long2att+short2att+p3att)
gen long2p = long2m/long2att
gen short2p = short2m/short2att
gen p2p = (long2m+short2m)/(long2att+short2att)
gen p3p = p3m/p3att
gen ftp = ftm/fta


drop if missing(short2p)
*drop if long2p == 0
egen long short2prank = rank(short2p), track
sort short2prank
gen double pctlshort2p = 100*(short2prank-1)/(short2prank[_N]-1)

collapse (mean) short2p pctlshort2p, by(short2prank)
gen expectedpoints = 2 * short2p
twoway line expectedpoints pctlshort2p
save short2p.dta,replace

use long3p.dta, clear
append using short2p.dta
twoway (line expectedpoints p3p) (line expectedpoints short2p)
twoway (line expectedpoints pctlp3p) (line expectedpoints pctlshort2p), title("Expected Points of Three Point & Short Two Point Percentages") xtitle("") ytitle("") legend(order(1 "3p percentile" 2 "2p percentile"))







clear all

// import delimited "[path]/FIBA Database - player box scores.csv"

gen games = 1

split tp, parse(":") gen(newtime)

gen double minutetime = real(newtime1) + real(newtime2)/60

gen startboolean = starter == "TRUE"

sort teamid nationality uniformnumber name pid

collapse (sum) as bs dr fd fg2a fg2m fg3a fg3m fga fgm fta ftm or pf pts reb st to eff fgia fgim minutetime startboolean games, by(teamid nationality uniformnumber name pid)

gen startp = startboolean/games

gen totalfgp = fgm/fga
gen totalftp = ftm/fta
gen totalfg2p = fg2m/fg2a
gen totalfg3p = fg3m/fg3a

drop if missing(totalfg2p)
egen long p2prank = rank(totalfg2p), track
sort p2prank
gen double pctlp2p = 100*(p2prank-1)/(p2prank[_N]-1) if !missing(p2prank)


collapse (mean) totalfg2p pctlp2p, by(p2prank)
gen expectedpoints = 2 * totalfg2p
twoway line expectedpoints pctlp2p
save total2p.dta,replace



clear all

// import delimited "[path]/FIBA Database - player box scores.csv"

gen games = 1

split tp, parse(":") gen(newtime)

gen double minutetime = real(newtime1) + real(newtime2)/60

gen startboolean = starter == "TRUE"

sort teamid nationality uniformnumber name pid

collapse (sum) as bs dr fd fg2a fg2m fg3a fg3m fga fgm fta ftm or pf pts reb st to eff fgia fgim minutetime startboolean games, by(teamid nationality uniformnumber name pid)

gen startp = startboolean/games

gen totalfgp = fgm/fga
gen totalftp = ftm/fta
gen totalfg2p = fg2m/fg2a
gen totalfg3p = fg3m/fg3a
drop if missing(totalfg3p)
egen long p3prank = rank(totalfg3p), track
sort p3prank
gen double pctlp3p = 100*(p3prank-1)/(p3prank[_N]-1) if !missing(p3prank)


collapse (mean) totalfg3p pctlp3p, by(p3prank)
gen expectedpoints = 3 * totalfg3p
twoway line expectedpoints pctlp3p
save total3p.dta, replace

use total2p.dta, clear
append using total3p.dta
twoway (line expectedpoints totalfg3p) (line expectedpoints totalfg2p)
twoway (line expectedpoints pctlp3p) (line expectedpoints pctlp2p), title("Expected Points of Three Point & Two Point Percentages") xtitle("") ytitle("") legend(order(1 "3p percentile" 2 "2p percentile"))

clear all

// import delimited "[path]/FIBA Database - player box scores.csv"

gen games = 1

split tp, parse(":") gen(newtime)

gen double minutetime = real(newtime1) + real(newtime2)/60

gen startboolean = starter == "TRUE"

sort teamid nationality uniformnumber name pid

collapse (sum) as bs dr fd fg2a fg2m fg3a fg3m fga fgm fta ftm or pf pts reb st to eff fgia fgim minutetime startboolean games, by(teamid nationality uniformnumber name pid)

gen startp = startboolean/games

gen totalfgp = fgm/fga
gen totalftp = ftm/fta
gen totalfg2p = fg2m/fg2a
gen totalfg3p = fg3m/fg3a

drop if missing(totalfg2p)
egen long p2prank = rank(totalfg2p), track
sort p2prank
gen double pctlp2p = 100*(p2prank-1)/(p2prank[_N]-1) if !missing(p2prank)

gen expectedpoints = 2 * totalfg2p

gen fg2ap36 = (fg2a/minutetime)*36
gen ptsp36 = fg2ap36*expectedpoints
gen pipm2ap36 = -0.307*fg2ap36
gen pipmptsp36 = 0.357*ptsp36
gen pipm2 = pipmptsp36+pipm2ap36

drop if pipm2<-10

twoway scatter pipm2 pctlp2p, xtitle("Percentiles") ytitle("") title("") ylabel(-10(5)15)


clear all

// import delimited "[path]/FIBA Database - player box scores.csv"

gen games = 1

split tp, parse(":") gen(newtime)

gen double minutetime = real(newtime1) + real(newtime2)/60

gen startboolean = starter == "TRUE"

sort teamid nationality uniformnumber name pid

collapse (sum) as bs dr fd fg2a fg2m fg3a fg3m fga fgm fta ftm or pf pts reb st to eff fgia fgim minutetime startboolean games, by(teamid nationality uniformnumber name pid)

gen startp = startboolean/games

gen totalfgp = fgm/fga
gen totalftp = ftm/fta
gen totalfg2p = fg2m/fg2a
gen totalfg3p = fg3m/fg3a

drop if missing(totalfg3p)
egen long p3prank = rank(totalfg3p), track
sort p3prank
gen double pctlp3p = 100*(p3prank-1)/(p3prank[_N]-1) if !missing(p3prank)

gen expectedpoints = 3 * totalfg3p

gen fg3ap36 = (fg3a/minutetime)*36
gen ptsp36 = fg3ap36*expectedpoints
gen pipm3ap36 = -0.155*fg3ap36
gen pipmptsp36 = 0.357*ptsp36
gen pipm3 = pipmptsp36+pipm3ap36

drop if pipm3<-10

twoway scatter pipm3 pctlp3p, xtitle("Percentiles") ytitle("") title("") ylabel(-10(5)15)



