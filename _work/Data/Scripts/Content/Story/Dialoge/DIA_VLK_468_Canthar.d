
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Canthar_PICKPOCKET (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 900;
	condition	= DIA_Canthar_PICKPOCKET_Condition;
	information	= DIA_Canthar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Canthar_PICKPOCKET_Condition()
{
	C_Beklauen (20, 25);
};
 
FUNC VOID DIA_Canthar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Canthar_PICKPOCKET);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_BACK 		,DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Canthar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};
	
func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Canthar_EXIT(C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 999;
	condition	= DIA_Canthar_EXIT_Condition;
	information	= DIA_Canthar_EXIT_Info;
	permanent	= TRUE;
	description = "Musím jít!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //Musím jít!
	AI_Output (self, other,"DIA_Canthar_EXIT_09_01"); //Jak je libo.
	AI_StopProcessInfos	(self);
};
// ************************************************************
// 			  			Personal CRIMES
// ************************************************************

INSTANCE DIA_Canthar_PersonalCRIMES (C_INFO)
{
	npc			= VLK_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_PersonalCRIMES_Condition;
	information	= DIA_Canthar_PersonalCRIMES_Info;
	permanent	= TRUE;
	important 	= TRUE;
};                       

func INT DIA_Canthar_PersonalCRIMES_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Canthar_PersonalCRIMES_Info()
{	
	// ------ Spieler hat mich besiegt ------
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //To od tebe bylo opravdu hloupé, že jsi mě napadl.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(posměšně) To sis myslel, že mě přemůžeš tak snadno?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //Buď mi to nějak vynahradíš, nebo se budu dívat na to, jak hořce lituješ svých činů!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //A co přesně myslíš?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Neměl jsem toho tolik!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Tady je zlato - zapomeneme na tu věc!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Tady je zlato - zapomeneme na tu věc!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //To je od tebe hodně rozumné!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //Neměl jsem toho tolik!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //Tak proč plýtváš mým časem?
	
	AI_StopProcessInfos(self);
};


// ************************************************************
// 			  				 Hallo 
// ************************************************************

INSTANCE DIA_Canthar_Hallo (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_Hallo_Condition;
	information	= DIA_Canthar_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Canthar_Hallo_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_Hallo_Info()
{	
	var C_Item itm; itm = Npc_GetEquippedArmor(other);
	
	// ------ OHNE Rüstung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //Tak kohopak to tu máme?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Jsi na cestě do města, nemám pravdu?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Možná.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Hm! (odfrkne) Vypadáš jako uprchlík! Všichni uprchlíci mají namířeno do města.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Dokonce bys mohl být bývalým vězněm z hornické kolonie.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(kvapně) Je mi jedno, odkud jdeš. Ale věřím, že bych pro tebe měl zajímavou nabídku.
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//Jak jde práce, rolníku?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "Vypadám snad jako farmář?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "Nemohu si stěžovat."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen Rüstungen (höchst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //Co pro tebe mohu udělat?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nemůžu si stěžovat.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//Můžu pro tebe něco udělat?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //Vypadám snad jako rolník?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //Přesně jako rolník. Ale nemluvíš tak!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //(hloubavě) Jestli nejsem úplně mimo, tak bych pro tebe měl zajímavou nabídku.
	
	Canthar_GotMe = TRUE;
	
	Info_ClearChoices	(DIA_Canthar_Hallo);
};


// ************************************************************
// 		  				 	WhatOffer				//E3
// ************************************************************

INSTANCE DIA_Canthar_WhatOffer (C_INFO)
{
	npc			= Vlk_468_Canthar;
	nr			= 1;
	condition	= DIA_Canthar_WhatOffer_Condition;
	information	= DIA_Canthar_WhatOffer_Info;
	permanent	= FALSE;
	description	= "Co mi můžeš nabídnout?";
};                       

FUNC INT DIA_Canthar_WhatOffer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Canthar_WhatOffer_Info()
{	
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //Co je to za nabídku?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Tak, jak si to ty představuješ, tě stráže do města nikdy nepustí.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(ironicky) Jestli budeš v očích stráží tak "přesvědčivý" jako v těch mých, nikdy tě do města nepustí.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //Můžu ti pomoct dostat se do města.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //Mám tady kousek papíru. S královskou pečetí a podpisem místodržícího. Propustku.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //S tímhle kouskem papíru v kapse můžeš vypadat tak otrhaně, jak se ti zachce, a stráže tě nechají na pokoji.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //Máš zájem?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Ne! Nech si ten papír!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Co za tu propustku chceš?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Jak se dostaneš do města TY?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "V tom musí být nějaký háček..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Jsem obchodní cestující. Prodávám od každého trochu.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar obchoduje se všemožnými zbraněmi."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //V tom musí být nějaký háček.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //(přehrává) Ne. Žádný háček. Jenom mi budeš dlužit laskavost.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //Jak se dostaneš do města TY?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Stráže už mě znají. Prostě jim řeknu, že jsem svoji propustku ztratil.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //Co za tu propustku chceš?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(spokojeně) VĚDĚL JSEM, že ty jsi ten pravý!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Poslouchej. Teď ode mě dostaneš tu propustku.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //Jen tak?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Jen tak. ALE: Až tě ve městě potkám, mám u tebe laskavost.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //Dohodnuto?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Jasně. Dej mi ten papír.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Jasně. Dej mi ten papír.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Tady. Buď na to opatrný, je to velmi cenné.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Ještě jedna věc: Ani nepomysli na to, že bys porušil slovo!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Jako obchodník se ve městě těším velké vážnosti - nedopadlo by to pro tebe dobře, věř mi!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Od obchodníka Canthara jsem dostal propustku, díky níž se dostanu města. Dlužím mu za to protislužbu.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //Ne! Nech si ten papír!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Hm. Vypadá to, že jsem se v tobě spletl, co?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //Dobrá. Chceš ještě něco? Můžu ti ukázat své zboží?
	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
};


// ************************************************************
// 		  				 	TRADE				
// ************************************************************

instance DIA_Canthar_TRADE		(C_INFO)
{
	npc		 	= Vlk_468_Canthar;
	nr 			= 888;
	condition	= DIA_Canthar_TRADE_Condition;
	information	= DIA_Canthar_TRADE_Info;
	permanent	= TRUE;
	description	= "Ukaž mi své zboží!";
	trade		= TRUE;
};

func int DIA_Canthar_TRADE_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info ()
{
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //Ukaž mi své zboží!
	
	B_GiveTradeInv (self);
	
	AI_Output (self, other, "DIA_Canthar_TRADE_09_01"); //Vyber si.
	
	
};



// ###########################################
// ###########################################

// 				In der Stadt 

// ###########################################
// ###########################################
/*
		-->
		Aber ein Händler namnes Canthar hat das erzählt. 
	*/

///////////////////////////////////////////////////////////////////////
//	Info PayPriceInCity
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_PAYPRICEINCITY		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_PAYPRICEINCITY_Condition;
	information	 = 	DIA_Canthar_PAYPRICEINCITY_Info;
	important	 = 	TRUE;
	permanent 	 =  FALSE;
};

func int DIA_Canthar_PAYPRICEINCITY_Condition ()
{
	if (Canthar_InStadt == TRUE)
	&& (Npc_IsDead(Sarah) == FALSE) 
	&& (Canthar_GotMe == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_PAYPRICEINCITY_Info ()
{
	if (Canthar_Gefallen == TRUE)
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //Ještě stále mi dlužíš laskavost. Přišel čas splatit dluh.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Hej, ty. Mám pro tebe úkol.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //Co chceš?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Chci zpátky svůj stánek na tržišti. Sarah mi ho ukradla.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //A už to místo zabírá dost dlouho. Chci, aby mi ho vrátila.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //A co já s tím?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //Dám ti dopis, co jí strčíš do kapsy.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Pak půjdeš za lordem Andrem a řekneš mu, že Sarah prodává zbraně Onarovi.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Skončí ve vězení, ty shrábneš peníze a já dostanu zpátky svůj stánek.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //Máš na to dva dny.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //Co z toho budu mít?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Jakmile budu mít zpátky stánek, dostaneš ode mě zbraň - zatraceně dobrou zbraň.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Ne, nechci s tím nic mít.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "No tak dobře, udělám to.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Co se stane, když odmítnu?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //Co se stane, když odmítnu?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //To by od tebe bylo opravdu hloupé. Vím, že jsi bývalý trestanec.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Pokud se to roznese, může to ošklivě ublížit tvé pověsti ve městě.
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //Ne, nechci s tím nic mít.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //To bylo špatné rozhodnutí, chlapče. Ještě si spolu promluvíme.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //Dobrá, vypadá to, že nemám na vybranou.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Chytrej kluk. Tady máš ten dopis.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //Jak jí ten dopis mám podstrčit?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Nech ji, ať ti ukáže své zboží -  a mezitím k ní ten dopis schovej.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //A nezapomeň, že mám ve městě značný vliv, takže žádné hlouposti.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar po mně nyní chce tu laskavost, kterou mu stále dlužím.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar mi za onu laskavost slíbil pěknou zbraň.");
	};
	B_LogEntry (TOPIC_Canthar,"Mám obchodnici Sarah nenápadně podstrčit dopis, který budí zdání, že prodává zbraně Onarovi. Pak mám zajít za lordem Andreem a udat ji.");
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};
///////////////////////////////////////////////////////////////////////
//	Info SarahErledigt
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_SARAHERLEDIGT		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_SARAHERLEDIGT_Condition;
	information	 = 	DIA_Canthar_SARAHERLEDIGT_Info;
	permanent	 =	TRUE;
	description	 = 	"Pokud jde o Sarah...";
};
func int DIA_Canthar_SARAHERLEDIGT_Condition ()
{
	if 	(MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Canthar_SARAHERLEDIGT_Info ()
{
	if ((Npc_IsDead(Sarah)) == FALSE)
	{
		if (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay()+ 2))
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //Nemáš co na práci?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Nejdřív ten dopis podstrč Sarah, pak zajdi za Andrem a obviň ji.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Udělej to a nepokoušej se mě podvést. Litoval bys toho.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Utíká ti čas. Začni s tím už!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sarah je mrtvá.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //Opravdu? Výborně. Tak to jsi splnil polovinu našeho malého plánu.
			
			MIS_Canthars_KomproBrief = LOG_SUCCESS;
			B_GivePlayerXP (XP_Ambient);
			Npc_ExchangeRoutine	(self,"MARKTSTAND"); 
	};
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Success		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Success_Condition;
	information	 = 	DIA_Canthar_Success_Info;
	permanent	 =  FALSE;
	description	 = "Pokud jde o Sarah...";
};
func int DIA_Canthar_Success_Condition ()
{
	if (MIS_Canthars_KomproBrief == LOG_SUCCESS)
	&& ((Npc_IsDead(Sarah)) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Success_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Dobrá práce. Sarah je tam, kde si zaslouží.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //Převezmu její zboží, takže jestli potřebuješ zbraň, stav se u mě.
	
	if (Kapitel == 1)
	{
		CreateInvItems (self,ItMw_ShortSword3 , 1); 
		CreateInvItems (self,ItMw_ShortSword4 , 1);
		CreateInvItems (self,ItMw_ShortSword5 , 1);
		CreateInvItems (self,ItMw_Kriegshammer1, 1); 
		
		CreateInvItems (self, ItMw_1h_Vlk_Sword, 1); 
		CreateInvItems (self, ItMw_1h_Nov_Mace, 1); 
	};
	if (Kapitel == 2)
	{
		CreateInvItems (self,ItMw_Stabkeule , 1);
		CreateInvItems (self,ItMw_Steinbrecher, 1); 
		CreateInvItems (self,ItMw_Schwert2 , 1); 
		CreateInvItems (self,ItMw_Bartaxt , 1); 
	};
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //Slíbils mi zbraň.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //Správně. Tady, tahle zbraň je mistrovským kouskem kovářského umění.
				
		B_GiveInvItems (self, other, ItMW_Schiffsaxt,1);
	};
	B_GivePlayerXP (XP_Canthars_KomproBrief);
};

//---------------------------------------------------------------------

				//Canthat hat seinen Marktstand OHNE Spieler Hilfe 

//---------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info Canthar hat den Stand 
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Again		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  5;
	condition	 = 	DIA_Canthar_Again_Condition;
	information	 = 	DIA_Canthar_Again_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};
func int DIA_Canthar_Again_Condition ()
{
	if (Canthar_Sperre == TRUE)
	&&  Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Again_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Again_09_00"); //Hm, ty jsi tu znovu.
	
	if (MIS_Canthars_KomproBrief  == LOG_FAILED)
	{
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //Jak to, že nejsi ve vězení?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Byl jsem propuštěn. Jak už jsem ti říkal - mám ve městě velký vliv.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //A mezitím jsem se se Sarah dohodl sám. Můžeš na tu věc s dopisem zapomenout.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //Copak jsem tě nevaroval? Bylo by líp, kdybys udělal, co jsem ti řekl.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //Teď se mezi obchodníky povídá, že jsi trestanec.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Politováníhodná věc - teď tady na tržišti nedostaneš ani kousek chleba.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Samozřejmě bych tu věc mohl zase urovnat, řekněme...
	B_Say_Gold 	(self, other, Canthar_Gold);
	
	AI_StopProcessInfos (self);
	
};

///////////////////////////////////////////////////////////////////////
//	Info Canthar bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Pay		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_Pay_Condition;
	information	 = 	DIA_Canthar_Pay_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};

func int DIA_Canthar_Pay_Condition ()
{
	if Npc_KnowsInfo (other,DIA_Canthar_Again)
	&& (Canthar_Sperre == TRUE)
	&& Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_Pay_Info ()
{
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //Zaplatíš?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"No tak dobře, zaplatím...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"Nemám u sebe dost peněz...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"Kolik že to bylo?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //Dobrá, zaplatím. Nedáváš mi jinou možnost.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(směje se) Výborně. Tak to bych se měl postarat o to, aby tvá reputace mezi obchodníky zase stoupla.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //Nemám u sebe dost peněz.
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Tak si je sežeň.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //Kolik že to bylo?
	B_Say_Gold 	(self, other, Canthar_Gold);
	
};
///////////////////////////////////////////////////////////////////////
//	Info Canthar im Knast
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_CANTHARANGEPISST		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 =  2;
	condition	 = 	DIA_Canthar_CANTHARANGEPISST_Condition;
	information	 = 	DIA_Canthar_CANTHARANGEPISST_Info;
	important	 = 	TRUE;
	permanent	 =  TRUE;
};
func int DIA_Canthar_CANTHARANGEPISST_Condition ()
{
	if (Canthar_Ausgeliefert == TRUE)  //SC hat Canthar bei Andre verpfiffen!
	&& (Npc_GetDistToWP (self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	&& Npc_IsInState  (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Canthar_CANTHARANGEPISST_Info ()
{
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Varoval jsem tě, ale tys neposlouchal. Probereme to později.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //A teď se ztrať, chci si odpočinout.
	
	AI_StopProcessInfos (self);	
};
///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_MinenAnteil		(C_INFO)
{
	npc			 = 	Vlk_468_Canthar;
	nr			 = 	3;
	condition	 = 	DIA_Canthar_MinenAnteil_Condition;
	information	 = 	DIA_Canthar_MinenAnteil_Info;

	description	 = 	"Prodáváš nelegální důlní akcie!";
};

func int DIA_Canthar_MinenAnteil_Condition ()
{
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Canthar_WhatOffer))
		{
				return TRUE;
		};
};

func void DIA_Canthar_MinenAnteil_Info ()
{
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //Prodáváš nelegální důlní akcie!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //No a? Co teda! Kdybych to nedělal já, chytne se toho někdo jiný.
	B_GivePlayerXP (XP_Ambient);
};











