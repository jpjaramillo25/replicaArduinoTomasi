
. use "C:\Users\jpjar\Downloads\datos arduino tomasi.dta", clear


*generacion de placebo AT

generate placebo = .
recode placebo . = 1 if year == 1999
recode placebo . = 1 if year == 2000
recode placebo . = 1 if year == 2001
recode placebo . = 1 if year == 2002
recode placebo . = 1 if year == 2003
recode placebo . = 1 if year == 2004
recode placebo . = 1 if year == 2005
recode placebo . = 1 if year == 2006
recode placebo . = 1 if year == 2007

reg tasacausasextranas toneladascocaina if placebo == 1, robust 

outreg2 using.doc, replace

*generacion de tratamiento AT

generate tratamiento = .
recode tratamiento . = 1 if year == 2010
recode tratamiento . = 1 if year == 2011
recode tratamiento . = 1 if year == 2012
recode tratamiento . = 1 if year == 2013
recode tratamiento . = 1 if year == 2014
recode tratamiento . = 1 if year == 2015
recode tratamiento . = 1 if year == 2015
recode tratamiento . = 1 if year == 2016
recode tratamiento . = 1 if year == 2017
recode tratamiento . = 1 if year == 2018


reg tasacausasextranas toneladascocaina if tratamiento == 1, robust

outreg2 using.doc, append 


reg tasacausasextranas toneladascocaina tasahomicidios if placebo == 1, robust 

outreg2 using.doc, append 


reg tasacausasextranas toneladascocaina tasahomicidios if tratamiento == 1, robust


outreg2 using.doc, append 


*hipotesis alternativa

gen tasasuicidios = suicidios*100000/ poblacion

reg tasacausasextranas toneladascocaina tasahomicidios if placebo == 1, robust 

outreg2 using.doc, replace


reg tasacausasextranas toneladascocaina tasahomicidios if tratamiento == 1, robust

outreg2 using.doc, append 


reg tasacausasextranas toneladascocaina tasasuicidios if placebo == 1, robust 

outreg2 using.doc, append 


reg tasacausasextranas toneladascocaina tasasuicidios if tratamiento == 1, robust

outreg2 using.doc, append 


*modelo de 24 observaciones

reg tasacausasextranas toneladascocaina tasasuicidios, robust

outreg2 using.doc, replace 


reg tasacausasextranas toneladascocaina tasahomicidios, robust

outreg2 using.doc, append


*generacion de tratamientoCorrea 1 hasta 2017

generate tratamientoCorrea = 0

recode tratamientoCorrea 0 = 1 if year == 2007
recode tratamientoCorrea 0 = 1 if year == 2008
recode tratamientoCorrea 0 = 1 if year == 2009
recode tratamientoCorrea 0 = 1 if year == 2010
recode tratamientoCorrea 0 = 1 if year == 2011
recode tratamientoCorrea 0 = 1 if year == 2012
recode tratamientoCorrea 0 = 1 if year == 2013
recode tratamientoCorrea 0 = 1 if year == 2014
recode tratamientoCorrea 0 = 1 if year == 2015
recode tratamientoCorrea 0 = 1 if year == 2016
recode tratamientoCorrea 0 = 1 if year == 2017

reg tasacausasextranas toneladascocaina, robust
outreg2 using.doc, replace 

reg tasacausasextranas toneladascocaina tasahomicidios, robust
outreg2 using.doc, append 

reg tasacausasextranas toneladascocaina tasahomicidios tratamientoCorrea, robust
outreg2 using.doc, append 

reg tasacausasextranas tratamientoCorrea, robust
outreg2 using.doc, append



*generación base de Manta

gen salidaBaseManta = 0
recode salidaBaseManta 0 = 1 if year == 2010
recode salidaBaseManta 0 = 1 if year == 2011
recode salidaBaseManta 0 = 1 if year == 2012
recode salidaBaseManta 0 = 1 if year == 2013
recode salidaBaseManta 0 = 1 if year == 2014
recode salidaBaseManta 0 = 1 if year == 2015
recode salidaBaseManta 0 = 1 if year == 2016
recode salidaBaseManta 0 = 1 if year == 2017
recode salidaBaseManta 0 = 1 if year == 2018
recode salidaBaseManta 0 = 1 if year == 2019
recode salidaBaseManta 0 = 1 if year == 2020
recode salidaBaseManta 0 = 1 if year == 2021
recode salidaBaseManta 0 = 1 if year == 2022


reg tasacausasextranas toneladascocaina, robust
outreg2 using.doc, replace 

reg tasacausasextranas toneladascocaina tasahomicidios, robust
outreg2 using.doc, append 

reg tasacausasextranas toneladascocaina tasahomicidios salidaBaseManta, robust
outreg2 using.doc, append 

reg tasacausasextranas salidaBaseManta, robust
outreg2 using.doc, append


