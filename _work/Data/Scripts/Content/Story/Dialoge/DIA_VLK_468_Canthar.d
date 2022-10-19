
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
	description = "Mus�m j�t!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //Mus�m j�t!
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
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //To od tebe bylo opravdu hloup�, �e jsi m� napadl.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //(posm�n�) To sis myslel, �e m� p�em��e� tak snadno?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //Bu� mi to n�jak vynahrad�, nebo se budu d�vat na to, jak ho�ce lituje� sv�ch �in�!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //A co p�esn� mysl�?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Nem�l jsem toho tolik!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Tady je zlato - zapomeneme na tu v�c!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Tady je zlato - zapomeneme na tu v�c!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //To je od tebe hodn� rozumn�!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //Nem�l jsem toho tolik!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //Tak pro� pl�tv� m�m �asem?
	
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
	
	// ------ OHNE R�stung ------
	if (Npc_HasEquippedArmor(other) == FALSE) 
	{
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //Tak kohopak to tu m�me?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Jsi na cest� do m�sta, nem�m pravdu?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Mo�n�.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Hm! (odfrkne) Vypad� jako uprchl�k! V�ichni uprchl�ci maj� nam��eno do m�sta.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Dokonce bys mohl b�t b�val�m v�zn�m z hornick� kolonie.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //(kvapn�) Je mi jedno, odkud jde�. Ale v���m, �e bych pro tebe m�l zaj�mavou nab�dku.
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//Jak jde pr�ce, roln�ku?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "Vypad�m snad jako farm��?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "Nemohu si st�ovat."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen R�stungen (h�chst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //Co pro tebe mohu ud�lat?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nem��u si st�ovat.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//M��u pro tebe n�co ud�lat?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //Vypad�m snad jako roln�k?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //P�esn� jako roln�k. Ale nemluv� tak!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //(hloubav�) Jestli nejsem �pln� mimo, tak bych pro tebe m�l zaj�mavou nab�dku.
	
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
	description	= "Co mi m��e� nab�dnout?";
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
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //Co je to za nab�dku?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Tak, jak si to ty p�edstavuje�, t� str�e do m�sta nikdy nepust�.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //(ironicky) Jestli bude� v o��ch str�� tak "p�esv�d�iv�" jako v t�ch m�ch, nikdy t� do m�sta nepust�.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //M��u ti pomoct dostat se do m�sta.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //M�m tady kousek pap�ru. S kr�lovskou pe�et� a podpisem m�stodr��c�ho. Propustku.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //S t�mhle kouskem pap�ru v kapse m��e� vypadat tak otrhan�, jak se ti zachce, a str�e t� nechaj� na pokoji.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //M� z�jem?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Ne! Nech si ten pap�r!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Co za tu propustku chce�?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Jak se dostane� do m�sta TY?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "V tom mus� b�t n�jak� h��ek..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Jsem obchodn� cestuj�c�. Prod�v�m od ka�d�ho trochu.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar obchoduje se v�emo�n�mi zbran�mi."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //V tom mus� b�t n�jak� h��ek.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //(p�ehr�v�) Ne. ��dn� h��ek. Jenom mi bude� dlu�it laskavost.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //Jak se dostane� do m�sta TY?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Str�e u� m� znaj�. Prost� jim �eknu, �e jsem svoji propustku ztratil.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //Co za tu propustku chce�?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //(spokojen�) V�D�L JSEM, �e ty jsi ten prav�!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Poslouchej. Te� ode m� dostane� tu propustku.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //Jen tak?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Jen tak. ALE: A� t� ve m�st� potk�m, m�m u tebe laskavost.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //Dohodnuto?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Jasn�. Dej mi ten pap�r.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Jasn�. Dej mi ten pap�r.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Tady. Bu� na to opatrn�, je to velmi cenn�.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Je�t� jedna v�c: Ani nepomysli na to, �e bys poru�il slovo!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Jako obchodn�k se ve m�st� t��m velk� v�nosti - nedopadlo by to pro tebe dob�e, v�� mi!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Od obchodn�ka Canthara jsem dostal propustku, d�ky n� se dostanu m�sta. Dlu��m mu za to protislu�bu.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //Ne! Nech si ten pap�r!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Hm. Vypad� to, �e jsem se v tob� spletl, co?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //Dobr�. Chce� je�t� n�co? M��u ti uk�zat sv� zbo��?
	
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
	description	= "Uka� mi sv� zbo��!";
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
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //Uka� mi sv� zbo��!
	
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
		Aber ein H�ndler namnes Canthar hat das erz�hlt. 
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
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //Je�t� st�le mi dlu�� laskavost. P�i�el �as splatit dluh.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Hej, ty. M�m pro tebe �kol.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //Co chce�?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Chci zp�tky sv�j st�nek na tr�i�ti. Sarah mi ho ukradla.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //A u� to m�sto zab�r� dost dlouho. Chci, aby mi ho vr�tila.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //A co j� s t�m?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //D�m ti dopis, co j� str�� do kapsy.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Pak p�jde� za lordem Andrem a �ekne� mu, �e Sarah prod�v� zbran� Onarovi.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Skon�� ve v�zen�, ty shr�bne� pen�ze a j� dostanu zp�tky sv�j st�nek.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //M� na to dva dny.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //Co z toho budu m�t?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Jakmile budu m�t zp�tky st�nek, dostane� ode m� zbra� - zatracen� dobrou zbra�.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Ne, nechci s t�m nic m�t.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "No tak dob�e, ud�l�m to.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Co se stane, kdy� odm�tnu?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //Co se stane, kdy� odm�tnu?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //To by od tebe bylo opravdu hloup�. V�m, �e jsi b�val� trestanec.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Pokud se to roznese, m��e to o�kliv� ubl�it tv� pov�sti ve m�st�.
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //Ne, nechci s t�m nic m�t.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //To bylo �patn� rozhodnut�, chlap�e. Je�t� si spolu promluv�me.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //Dobr�, vypad� to, �e nem�m na vybranou.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Chytrej kluk. Tady m� ten dopis.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //Jak j� ten dopis m�m podstr�it?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Nech ji, a� ti uk�e sv� zbo�� -  a mezit�m k n� ten dopis schovej.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //A nezapome�, �e m�m ve m�st� zna�n� vliv, tak�e ��dn� hlouposti.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar po mn� nyn� chce tu laskavost, kterou mu st�le dlu��m.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar mi za onu laskavost sl�bil p�knou zbra�.");
	};
	B_LogEntry (TOPIC_Canthar,"M�m obchodnici Sarah nen�padn� podstr�it dopis, kter� bud� zd�n�, �e prod�v� zbran� Onarovi. Pak m�m zaj�t za lordem Andreem a udat ji.");
	
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
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //Nem� co na pr�ci?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Nejd��v ten dopis podstr� Sarah, pak zajdi za Andrem a obvi� ji.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Ud�lej to a nepokou�ej se m� podv�st. Litoval bys toho.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Ut�k� ti �as. Za�ni s t�m u�!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sarah je mrtv�.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //Opravdu? V�born�. Tak to jsi splnil polovinu na�eho mal�ho pl�nu.
			
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
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Dobr� pr�ce. Sarah je tam, kde si zaslou��.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //P�evezmu jej� zbo��, tak�e jestli pot�ebuje� zbra�, stav se u m�.
	
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
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //Sl�bils mi zbra�.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //Spr�vn�. Tady, tahle zbra� je mistrovsk�m kouskem kov��sk�ho um�n�.
				
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
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //Jak to, �e nejsi ve v�zen�?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Byl jsem propu�t�n. Jak u� jsem ti ��kal - m�m ve m�st� velk� vliv.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //A mezit�m jsem se se Sarah dohodl s�m. M��e� na tu v�c s dopisem zapomenout.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //Copak jsem t� nevaroval? Bylo by l�p, kdybys ud�lal, co jsem ti �ekl.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //Te� se mezi obchodn�ky pov�d�, �e jsi trestanec.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Politov�n�hodn� v�c - te� tady na tr�i�ti nedostane� ani kousek chleba.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Samoz�ejm� bych tu v�c mohl zase urovnat, �ekn�me...
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
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //Zaplat�?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"No tak dob�e, zaplat�m...",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"Nem�m u sebe dost pen�z...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"Kolik �e to bylo?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //Dobr�, zaplat�m. Ned�v� mi jinou mo�nost.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //(sm�je se) V�born�. Tak to bych se m�l postarat o to, aby tv� reputace mezi obchodn�ky zase stoupla.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //Nem�m u sebe dost pen�z.
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Tak si je se�e�.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //Kolik �e to bylo?
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
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Varoval jsem t�, ale tys neposlouchal. Probereme to pozd�ji.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //A te� se ztra�, chci si odpo�inout.
	
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

	description	 = 	"Prod�v� neleg�ln� d�ln� akcie!";
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
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //Prod�v� neleg�ln� d�ln� akcie!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //No a? Co teda! Kdybych to ned�lal j�, chytne se toho n�kdo jin�.
	B_GivePlayerXP (XP_Ambient);
};











