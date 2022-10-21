
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
	description = "Musz� i��!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //Musz� i��!
	AI_Output (self, other,"DIA_Canthar_EXIT_09_01"); //Jak sobie chcesz.
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
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //Atak na mnie to by�o g�upie posuni�cie.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //Wydawa�o ci si�, �e �atwo mnie pokonasz?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //Albo to naprawisz, albo zadbam, �eby� gorzko po�a�owa� swego czynu!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //A co konkretnie mia�e� na my�li?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Nie mam tyle!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Oto twoje z�oto - zapomnijmy o ca�ej sprawie!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Oto twoje z�oto - zapomnijmy o ca�ej sprawie!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //Bardzo rozs�dnie!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //Nie mam tyle!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //To dlaczego marnujesz m�j czas?
	
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
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //Kogo my tu mamy?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Idziesz do miasta - mam racj�?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Mo�e.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Hmmm! Wygl�dasz na zbiega! Wszyscy zbiegowie kieruj� si� do miasta.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Mo�e nawet jeste� by�ym skaza�cem z kopalni.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //Nie obchodzi mnie, sk�d przyszed�e�. Wydaje mi si� jednak, �e mam dla ciebie interesuj�c� ofert�...
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//Jak tam robota, wie�niaku?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "Czy ja wygl�dam na wie�niaka?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "Nie mog� narzeka�."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen R�stungen (h�chst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //Co mog� dla ciebie zrobi�?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nie mog� narzeka�.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//Mog� co� dla ciebie zrobi�?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //Czy ja wygl�dam na wie�niaka?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //Wygl�dasz jak wie�niak. Ale m�wisz inaczej!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //Je�eli si� nie myl�, to mam dla ciebie interesuj�c� ofert�...
	
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
	description	= "Co chcesz mi zaproponowa�?";
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
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //Co chcesz mi zaproponowa�?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Z takim wygl�dem stra�nicy nigdy nie wpuszcz� ci� do miasta.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //Je�eli dla stra�nik�w przy bramie b�dziesz r�wnie przekonuj�cy, jak teraz, to nigdy nie wpuszcz� ci� do miasta.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //Mog� ci pom�c dosta� si� do miasta.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //Mam tu taki ma�y kawa�ek papieru. Jest na nim kr�lewska piecz�� i podpis gubernatora. To glejt.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //Maj�c ten papier w kieszeni, mo�esz si� p�ta�, gdzie ci si� tam podoba, a stra�nicy nie b�d� ci� niepokoi�.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //Zainteresowany?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Nie! Zatrzymaj sobie ten papier!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Co chcesz w zamian?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "A jak TY dostaniesz si� do miasta?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Musi by� w tym jaki� haczyk..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Jestem w�drownym kupcem. Handluj� wszystkim po trochu.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar handluje wszystkimi rodzajami or�a."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //Musi by� w tym jaki� haczyk...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //Nie. Nie ma �adnego haczyka. B�dziesz mi tylko winien przys�ug�.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //A jak TY dostaniesz si� do miasta?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Stra�nicy mnie znaj�. Powiem im po prostu, �e zgubi�em sw�j glejt.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //Co chcesz w zamian?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //WIEDZIA�EM, �e jeste� odpowiednim cz�owiekiem.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Pos�uchaj. Dostaniesz ode mnie ten glejt.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //Tak po prostu?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Je�li jednak spotkamy si� w mie�cie, to jeste� mi winien przys�ug�.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //Umowa stoi?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Pewnie. Dawaj ten papier.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Pewnie. Dawaj ten papier.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Masz. Uwa�aj na niego, jest bardzo cenny.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Jeszcze jedno: nawet nie my�l o z�amaniu danego s�owa!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Jako kupiec mam spore wp�ywy w mie�cie - nie sko�czy�oby si� to dla ciebie za dobrze, wierz mi!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Kupiec Canthar wr�czy� mi przepustk�, dzi�ki kt�rej uzyskam wst�p do miasta. Jestem mu za to winien przys�ug�.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //Nie! Zatrzymaj sobie ten papier!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Hmmm. Wygl�da na to, �e �le ci� oceni�em, co?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //No dobra. Chcesz jeszcze czego�? Mo�e zainteresuje ci� co� z moich towar�w?
	
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
	description	= "Poka� mi, co masz na sprzeda�!";
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
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //Poka� mi, co masz na sprzeda�!
	
	B_GiveTradeInv (self);
	
	AI_Output (self, other, "DIA_Canthar_TRADE_09_01"); //Wybierz sobie.
	
	
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
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //Wci�� mi jeste� winien przys�ug�. Pora, �eby� sp�aci� sw�j d�ug.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Hej, ty, mam dla ciebie propozycj�.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //Czego chcesz?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Chc� mie� z powrotem moje stoisko na targu. Sara mnie z niego wygryz�a.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //Korzysta�a z niego ju� dostatecznie d�ugo. Chc�, �eby zrezygnowa�a.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //A co ja mam z tym wsp�lnego?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //Dam ci list, kt�ry musisz wsun�� jej do kieszeni.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Potem p�jdziesz do Andre i powiesz mu, �e Sara sprzedaje bro� Onarowi.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Ona wyl�duje w wi�zieniu, ty dostaniesz nagrod�, a ja odzyskam stragan.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //Masz na to dwa dni.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //A co JA b�d� z tego mia�?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Kiedy ju� b�d� mia� stragan, dostaniesz ode mnie bro� - i to nie byle jak�.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Nie, nie wezm� w tym udzia�u.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Dobrze, zrobi� to.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "A co si� stanie, je�li odm�wi�?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //A co si� stanie, je�li odm�wi�?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //To by�oby bardzo g�upie. Widzisz, ja wiem, �e jeste� zbieg�ym skaza�cem.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Je�eli to si� rozniesie, mo�esz mie� powa�ne problemy...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //Nie, nie wezm� w tym udzia�u.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //B��dna decyzja, ch�opcze. Jeszcze sobie pogadamy.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //No dobra, wygl�da na to, �e nie mam wyboru.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Bystry z ciebie ch�opak. Oto list.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //Jak mam go jej podrzuci�?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Pozw�l, �eby pokaza�a ci sw�j towar - wtedy ukryjesz list w jej kieszeni.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //Pami�taj, �e jestem wp�ywowym cz�owiekiem, wi�c nie pr�buj mnie oszuka�.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar chce, abym mu si� odwdzi�czy�.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar obieca� mi, �e w zamian za przys�ug� odda mi jedn� ze swoich broni.");
	};
	B_LogEntry (TOPIC_Canthar,"Mam pod�o�y� handlarce Sarze fa�szywy list, z kt�rego wynika, �e sprzedawa�a bro� Onarowi. Potem mam na ni� donie�� Lordowi Andre.");
	
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
	description	 = 	"Co do tej Sary...";
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
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //Nie masz czego� do zrobienia?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Najpierw podrzu� list Sarze, a potem id� do Andre i j� oskar�.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Zr�b to - i nie pr�buj mnie oszuka�, bo po�a�ujesz.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Twoja sprawa, kiedy to zrobisz. Id�!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sara nie �yje.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //Naprawd�? Wspaniale. Zatem wykona�e� ju� p� naszej umowy.
			
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
	description	 = "Co do tej Sary...";
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
	AI_Output (self, other, "DIA_Canthar_Success_09_00"); //Dobra robota. Sara jest tam, gdzie jej miejsce.
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //Przej��em jej maj�tek, wi�c przyjd� do mnie, je�li potrzebujesz broni.
	
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
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //Mia�e� da� mi bro�.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //Dok�adnie. Masz, ta bro� to mistrzowskie dzie�o sztuki kowalskiej.
				
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
	AI_Output (self, other, "DIA_Canthar_Again_09_00"); //Och, to znowu ty.
	
	if (MIS_Canthars_KomproBrief  == LOG_FAILED)
	{
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //Dlaczego nie siedzisz w wi�zieniu?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Zosta�em zwolniony. Ju� ci m�wi�em - mam spore wp�ywy w mie�cie.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //W mi�dzyczasie sam si� zaj��em Sar�. Mo�esz zapomnie� o tej sprawie z listem.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //Chyba ci� ostrzega�em? By�oby lepiej, gdyby� zrobi� to, co ci kaza�em.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //W�r�d kupc�w chodz� s�uchy, �e jeste� skaza�cem.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Przykra sprawa - teraz na targu nie kupisz ju� nawet bochenka chleba.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //M�g�bym oczywi�cie rozwi�za� twoje problemy za, powiedzmy...
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
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //Przyszed�e� zap�aci�?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"Dobrze, zap�ac�.",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"Nie mam przy sobie do�� pieni�dzy...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"Ile to mia�o by�?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //Dobra, zap�ac�. Nie mam wyboru.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //Dobrze. Zadbam o to, �eby twoja reputacja u kupc�w si� poprawi�a.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //Nie mam przy sobie do�� pieni�dzy...
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Bierz.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //Ile to mia�o by�?
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
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Ostrzega�em ci�, ale ty nie s�uchasz. Om�wmy to p�niej.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //A teraz zje�d�aj, chc� odpocz��.
	
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

	description	 = 	"Sprzedajesz nielegalne udzia�y w kopalni!";
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
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //Sprzedajesz nielegalne udzia�y w kopalni!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //Tak, i co? Co z tego! Je�li ja tego nie zrobi�, zajmie si� tym kto� inny.
	B_GivePlayerXP (XP_Ambient);
};











