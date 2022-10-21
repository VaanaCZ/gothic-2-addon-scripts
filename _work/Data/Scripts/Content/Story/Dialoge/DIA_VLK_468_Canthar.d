
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
	description = "MusÌm jÌt!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //MusÌm jÌt!
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
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //To od tebe bylo opravdu hloupÈ, ûe jsi mÏ napadl.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(posmÏönÏ) To sis myslel, ûe mÏ p¯em˘ûeö tak snadno?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //BuÔ mi to nÏjak vynahradÌö, nebo se budu dÌvat na to, jak ho¯ce litujeö sv˝ch Ëin˘!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //A co p¯esnÏ myslÌö?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "NemÏl jsem toho tolik!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Tady je zlato - zapomeneme na tu vÏc!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Tady je zlato - zapomeneme na tu vÏc!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //To je od tebe hodnÏ rozumnÈ!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //NemÏl jsem toho tolik!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //Tak proË pl˝tv·ö m˝m Ëasem?
	
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
	
	// ------ OHNE R¸stung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //Tak kohopak to tu m·me?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Jsi na cestÏ do mÏsta, nem·m pravdu?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Moûn·.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Hm! (odfrkne) Vypad·ö jako uprchlÌk! Vöichni uprchlÌci majÌ namÌ¯eno do mÏsta.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Dokonce bys mohl b˝t b˝val˝m vÏznÏm z hornickÈ kolonie.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(kvapnÏ) Je mi jedno, odkud jdeö. Ale vÏ¯Ìm, ûe bych pro tebe mÏl zajÌmavou nabÌdku.
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//Jak jde pr·ce, rolnÌku?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "Vypad·m snad jako farm·¯?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "Nemohu si stÏûovat."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen R¸stungen (hˆchst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //Co pro tebe mohu udÏlat?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nem˘ûu si stÏûovat.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//M˘ûu pro tebe nÏco udÏlat?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //Vypad·m snad jako rolnÌk?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //P¯esnÏ jako rolnÌk. Ale nemluvÌö tak!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //(hloubavÏ) Jestli nejsem ˙plnÏ mimo, tak bych pro tebe mÏl zajÌmavou nabÌdku.
	
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
	description	= "Co mi m˘ûeö nabÌdnout?";
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
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //Co je to za nabÌdku?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Tak, jak si to ty p¯edstavujeö, tÏ str·ûe do mÏsta nikdy nepustÌ.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(ironicky) Jestli budeö v oËÌch str·ûÌ tak "p¯esvÏdËiv˝" jako v tÏch m˝ch, nikdy tÏ do mÏsta nepustÌ.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //M˘ûu ti pomoct dostat se do mÏsta.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //M·m tady kousek papÌru. S kr·lovskou peËetÌ a podpisem mÌstodrûÌcÌho. Propustku.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //S tÌmhle kouskem papÌru v kapse m˘ûeö vypadat tak otrhanÏ, jak se ti zachce, a str·ûe tÏ nechajÌ na pokoji.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //M·ö z·jem?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Ne! Nech si ten papÌr!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Co za tu propustku chceö?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Jak se dostaneö do mÏsta TY?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "V tom musÌ b˝t nÏjak˝ h·Ëek..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Jsem obchodnÌ cestujÌcÌ. Prod·v·m od kaûdÈho trochu.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar obchoduje se vöemoûn˝mi zbranÏmi."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //V tom musÌ b˝t nÏjak˝ h·Ëek.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //(p¯ehr·v·) Ne. é·dn˝ h·Ëek. Jenom mi budeö dluûit laskavost.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //Jak se dostaneö do mÏsta TY?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Str·ûe uû mÏ znajÌ. ProstÏ jim ¯eknu, ûe jsem svoji propustku ztratil.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //Co za tu propustku chceö?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(spokojenÏ) VÃDÃL JSEM, ûe ty jsi ten prav˝!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Poslouchej. TeÔ ode mÏ dostaneö tu propustku.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //Jen tak?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Jen tak. ALE: Aû tÏ ve mÏstÏ potk·m, m·m u tebe laskavost.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //Dohodnuto?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "JasnÏ. Dej mi ten papÌr.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //JasnÏ. Dej mi ten papÌr.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Tady. BuÔ na to opatrn˝, je to velmi cennÈ.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //JeötÏ jedna vÏc: Ani nepomysli na to, ûe bys poruöil slovo!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Jako obchodnÌk se ve mÏstÏ tÏöÌm velkÈ v·ûnosti - nedopadlo by to pro tebe dob¯e, vÏ¯ mi!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Od obchodnÌka Canthara jsem dostal propustku, dÌky nÌû se dostanu mÏsta. DluûÌm mu za to protisluûbu.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //Ne! Nech si ten papÌr!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Hm. Vypad· to, ûe jsem se v tobÏ spletl, co?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //Dobr·. Chceö jeötÏ nÏco? M˘ûu ti uk·zat svÈ zboûÌ?
	
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
	description	= "Ukaû mi svÈ zboûÌ!";
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
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //Ukaû mi svÈ zboûÌ!
	
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
		Aber ein H‰ndler namnes Canthar hat das erz‰hlt. 
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
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //JeötÏ st·le mi dluûÌö laskavost. P¯iöel Ëas splatit dluh.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Hej, ty. M·m pro tebe ˙kol.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //Co chceö?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Chci zp·tky sv˘j st·nek na trûiöti. Sarah mi ho ukradla.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //A uû to mÌsto zabÌr· dost dlouho. Chci, aby mi ho vr·tila.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //A co j· s tÌm?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //D·m ti dopis, co jÌ strËÌö do kapsy.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Pak p˘jdeö za lordem Andrem a ¯ekneö mu, ûe Sarah prod·v· zbranÏ Onarovi.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //SkonËÌ ve vÏzenÌ, ty shr·bneö penÌze a j· dostanu zp·tky sv˘j st·nek.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //M·ö na to dva dny.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //Co z toho budu mÌt?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Jakmile budu mÌt zp·tky st·nek, dostaneö ode mÏ zbraÚ - zatracenÏ dobrou zbraÚ.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Ne, nechci s tÌm nic mÌt.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "No tak dob¯e, udÏl·m to.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Co se stane, kdyû odmÌtnu?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //Co se stane, kdyû odmÌtnu?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //To by od tebe bylo opravdu hloupÈ. VÌm, ûe jsi b˝val˝ trestanec.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Pokud se to roznese, m˘ûe to oöklivÏ ublÌûit tvÈ povÏsti ve mÏstÏ.
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //Ne, nechci s tÌm nic mÌt.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //To bylo öpatnÈ rozhodnutÌ, chlapËe. JeötÏ si spolu promluvÌme.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //Dobr·, vypad· to, ûe nem·m na vybranou.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Chytrej kluk. Tady m·ö ten dopis.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //Jak jÌ ten dopis m·m podstrËit?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Nech ji, aù ti uk·ûe svÈ zboûÌ -  a mezitÌm k nÌ ten dopis schovej.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //A nezapomeÚ, ûe m·m ve mÏstÏ znaËn˝ vliv, takûe û·dnÈ hlouposti.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar po mnÏ nynÌ chce tu laskavost, kterou mu st·le dluûÌm.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar mi za onu laskavost slÌbil pÏknou zbraÚ.");
	};
	B_LogEntry (TOPIC_Canthar,"M·m obchodnici Sarah nen·padnÏ podstrËit dopis, kter˝ budÌ zd·nÌ, ûe prod·v· zbranÏ Onarovi. Pak m·m zajÌt za lordem Andreem a udat ji.");
	
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
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //Nem·ö co na pr·ci?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Nejd¯Ìv ten dopis podstrË Sarah, pak zajdi za Andrem a obviÚ ji.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //UdÏlej to a nepokouöej se mÏ podvÈst. Litoval bys toho.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //UtÌk· ti Ëas. ZaËni s tÌm uû!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sarah je mrtv·.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //Opravdu? V˝bornÏ. Tak to jsi splnil polovinu naöeho malÈho pl·nu.
			
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
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Dobr· pr·ce. Sarah je tam, kde si zaslouûÌ.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //P¯evezmu jejÌ zboûÌ, takûe jestli pot¯ebujeö zbraÚ, stav se u mÏ.
	
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
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //SlÌbils mi zbraÚ.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //Spr·vnÏ. Tady, tahle zbraÚ je mistrovsk˝m kouskem kov·¯skÈho umÏnÌ.
				
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
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //Jak to, ûe nejsi ve vÏzenÌ?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Byl jsem propuötÏn. Jak uû jsem ti ¯Ìkal - m·m ve mÏstÏ velk˝ vliv.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //A mezitÌm jsem se se Sarah dohodl s·m. M˘ûeö na tu vÏc s dopisem zapomenout.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //Copak jsem tÏ nevaroval? Bylo by lÌp, kdybys udÏlal, co jsem ti ¯ekl.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //TeÔ se mezi obchodnÌky povÌd·, ûe jsi trestanec.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Politov·nÌhodn· vÏc - teÔ tady na trûiöti nedostaneö ani kousek chleba.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Samoz¯ejmÏ bych tu vÏc mohl zase urovnat, ¯eknÏme...
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
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //ZaplatÌö?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"No tak dob¯e, zaplatÌm...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"Nem·m u sebe dost penÏz...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"Kolik ûe to bylo?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //Dobr·, zaplatÌm. Ned·v·ö mi jinou moûnost.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(smÏje se) V˝bornÏ. Tak to bych se mÏl postarat o to, aby tv· reputace mezi obchodnÌky zase stoupla.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //Nem·m u sebe dost penÏz.
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Tak si je seûeÚ.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //Kolik ûe to bylo?
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
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Varoval jsem tÏ, ale tys neposlouchal. Probereme to pozdÏji.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //A teÔ se ztraù, chci si odpoËinout.
	
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

	description	 = 	"Prod·v·ö neleg·lnÌ d˘lnÌ akcie!";
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
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //Prod·v·ö neleg·lnÌ d˘lnÌ akcie!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //No a? Co teda! Kdybych to nedÏlal j·, chytne se toho nÏkdo jin˝.
	B_GivePlayerXP (XP_Ambient);
};











