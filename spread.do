summarize
regress covid_death_rate covid_case_rate spread, robust
regress covid_death_rate covid_case_rate spread log_density log_uninsured, robust
regress covid_death_rate covid_case_rate spread log_density log_uninsured log_public log_commute_time, robust
regress covid_death_rate covid_case_rate spread log_density log_uninsured log_public log_commute_time log_median_income share_20_40 share_40_60 share_above_60 share_male household_size share_black share_hispanic share_asian, robust

estimates clear
eststo: quietly regress covid_death_rate covid_case_rate spread, robust
eststo: quietly regress covid_death_rate covid_case_rate spread log_density log_uninsured, robust
eststo: quietly regress covid_death_rate covid_case_rate spread log_density log_uninsured log_public log_commute_time, robust
eststo: quietly regress covid_death_rate covid_case_rate spread log_density log_uninsured log_public log_commute_time log_median_income share_20_40 share_40_60 share_above_60 share_male household_size share_black share_hispanic share_asian, robust

xtset borough
eststo: quietly xtreg covid_death_rate covid_case_rate spread log_density log_uninsured log_public log_commute_time log_median_income share_20_40 share_40_60 share_above_60 share_male household_size share_black share_hispanic share_asian share_cat1 share_cat2 share_cat3 share_cat4 share_cat5 share_cat6 share_cat7 share_cat8 share_cat9 share_cat10 share_cat11 share_cat12 share_cat13


esttab using death4.tex, se ar2
estout, cells(b(star fmt(3)) t(par fmt(2)))