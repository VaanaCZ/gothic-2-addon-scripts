
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
	description = "Muszę iść!";
};                       

FUNC INT DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Canthar_EXIT_Info()
{
	AI_Output (other, self,"DIA_Canthar_EXIT_15_00"); //Muszę iść!
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
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_00"); //Atak na mnie to było głupie posunięcie.
	}
		
	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_01"); //Wydawało ci się, że łatwo mnie pokonasz?
	};
	
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_09_02"); //Albo to naprawisz, albo zadbam, żebyś gorzko pożałował swego czynu!
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_15_03"); //A co konkretnie miałeś na myśli?
	B_Say_Gold(self,other, 100);
	
	Info_ClearChoices	(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Nie mam tyle!"	,DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems (other, itmi_gold) >= 100)
	{
		Info_AddChoice		(DIA_Canthar_PersonalCRIMES, "Oto twoje złoto - zapomnijmy o całej sprawie!",DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_Pay_15_00"); //Oto twoje złoto - zapomnijmy o całej sprawie!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_Pay_09_01"); //Bardzo rozsądnie!
	
	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;
	
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output (other, self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //Nie mam tyle!
	AI_Output (self, other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //To dlaczego marnujesz mój czas?
	
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
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_00"); //Kogo my tu mamy?
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_01"); //Idziesz do miasta - mam rację?
		AI_Output	(other, self,"DIA_Canthar_Hallo_15_02"); //Może.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_03"); //Hmmm! Wyglądasz na zbiega! Wszyscy zbiegowie kierują się do miasta.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_04"); //Może nawet jesteś byłym skazańcem z kopalni.
		AI_Output	(self, other,"DIA_Canthar_Hallo_09_05"); //Nie obchodzi mnie, skąd przyszedłeś. Wydaje mi się jednak, że mam dla ciebie interesującą ofertę...
		
		Canthar_GotMe = TRUE;
	}
	
	// ------ Bauernkleidung ------
	else if (Hlp_IsItem (itm, ItAr_Bau_L)) 
	|| 		(Hlp_IsItem (itm, ItAr_Bau_M))
	{
		AI_Output (self, other,"DIA_Canthar_HelloArmor_09_06");	//Jak tam robota, wieśniaku?
			
		Info_ClearChoices	(DIA_Canthar_Hallo);
		Info_AddChoice		(DIA_Canthar_Hallo, "Czy ja wyglądam na wieśniaka?" 	,DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice		(DIA_Canthar_Hallo, "Nie mogę narzekać."		,DIA_Canthar_Hallo_Bauer);
	}
	
	// ------ alle anderen Rüstungen (höchst unwahrscheinlich) ------
	else 
	{
		AI_Output (self, other,"DIA_Canthar_Hallo_09_07"); //Co mogę dla ciebie zrobić?
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_Bauer_15_00");	//Nie mogę narzekać.
	AI_Output	(self, other,"DIA_Canthar_Hallo_Bauer_09_01");	//Mogę coś dla ciebie zrobić?

	Info_ClearChoices	(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output	(other, self,"DIA_Canthar_Hallo_NoBauer_15_00"); //Czy ja wyglądam na wieśniaka?
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_01"); //Wyglądasz jak wieśniak. Ale mówisz inaczej!
	AI_Output	(self, other,"DIA_Canthar_Hallo_NoBauer_09_02"); //Jeżeli się nie mylę, to mam dla ciebie interesującą ofertę...
	
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
	description	= "Co chcesz mi zaproponować?";
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
	AI_Output (other, self,"DIA_Canthar_WhatOffer_15_00"); //Co chcesz mi zaproponować?
	
	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_01"); //Z takim wyglądem strażnicy nigdy nie wpuszczą cię do miasta.
		}
		else
		{
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_02"); //Jeżeli dla strażników przy bramie będziesz równie przekonujący, jak teraz, to nigdy nie wpuszczą cię do miasta.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_03"); //Mogę ci pomóc dostać się do miasta.
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_04"); //Mam tu taki mały kawałek papieru. Jest na nim królewska pieczęć i podpis gubernatora. To glejt.
				
		if (Npc_HasEquippedArmor(other) == FALSE)
		{	
			AI_Output (self, other,"DIA_Canthar_WhatOffer_09_05"); //Mając ten papier w kieszeni, możesz się pętać, gdzie ci się tam podoba, a strażnicy nie będą cię niepokoić.
		};
		
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_06"); //Zainteresowany?
		
		Info_ClearChoices	(DIA_Canthar_WhatOffer);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Nie! Zatrzymaj sobie ten papier!",DIA_Canthar_WhatOffer_No);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Co chcesz w zamian?",DIA_Canthar_WhatOffer_Price);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "A jak TY dostaniesz się do miasta?" 			,DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice		(DIA_Canthar_WhatOffer, "Musi być w tym jakiś haczyk..."	,DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output (self, other,"DIA_Canthar_WhatOffer_09_07"); //Jestem wędrownym kupcem. Handluję wszystkim po trochu.
	};
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Canthar handluje wszystkimi rodzajami oręża."); 
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Strings_15_00"); //Musi być w tym jakiś haczyk...
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Strings_09_01"); //Nie. Nie ma żadnego haczyka. Będziesz mi tylko winien przysługę.
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");  //A jak TY dostaniesz się do miasta?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_HowYouIn_09_01"); //Strażnicy mnie znają. Powiem im po prostu, że zgubiłem swój glejt.
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_00"); //Co chcesz w zamian?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_01"); //WIEDZIAŁEM, że jesteś odpowiednim człowiekiem.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_02"); //Posłuchaj. Dostaniesz ode mnie ten glejt.
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Price_15_03"); //Tak po prostu?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_04"); //Jeśli jednak spotkamy się w mieście, to jesteś mi winien przysługę.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Price_09_05"); //Umowa stoi?
		
	Info_AddChoice (DIA_Canthar_WhatOffer, "Pewnie. Dawaj ten papier.",DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_Ok_15_00"); //Pewnie. Dawaj ten papier.
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_01"); //Masz. Uważaj na niego, jest bardzo cenny.
	CreateInvItems (self,ItWr_Passierschein, 1);
	B_GiveInvItems (self, other, ItWr_Passierschein, 1);
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_02"); //Jeszcze jedno: nawet nie myśl o złamaniu danego słowa!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_Ok_09_03"); //Jako kupiec mam spore wpływy w mieście - nie skończyłoby się to dla ciebie za dobrze, wierz mi!
	
	Canthar_Gefallen = TRUE;	
	Info_ClearChoices	(DIA_Canthar_WhatOffer);
	
	Log_CreateTopic (TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_City,LOG_RUNNING);
	B_LogEntry (TOPIC_City,"Kupiec Canthar wręczył mi przepustkę, dzięki której uzyskam wstęp do miasta. Jestem mu za to winien przysługę.");

};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output (other, self,"DIA_Canthar_WhatOffer_No_15_00"); //Nie! Zatrzymaj sobie ten papier!
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_01"); //Hmmm. Wygląda na to, że źle cię oceniłem, co?
	AI_Output (self, other,"DIA_Canthar_WhatOffer_No_09_02"); //No dobra. Chcesz jeszcze czegoś? Może zainteresuje cię coś z moich towarów?
	
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
	description	= "Pokaż mi, co masz na sprzedaż!";
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
	AI_Output (other, self, "DIA_Canthar_TRADE_15_00"); //Pokaż mi, co masz na sprzedaż!
	
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
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //Wciąż mi jesteś winien przysługę. Pora, żebyś spłacił swój dług.
	}
	else
	{
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //Hej, ty, mam dla ciebie propozycję.
	};
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //Czego chcesz?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //Chcę mieć z powrotem moje stoisko na targu. Sara mnie z niego wygryzła.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //Korzystała z niego już dostatecznie długo. Chcę, żeby zrezygnowała.
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //A co ja mam z tym wspólnego?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //Dam ci list, który musisz wsunąć jej do kieszeni.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //Potem pójdziesz do Andre i powiesz mu, że Sara sprzedaje broń Onarowi.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //Ona wyląduje w więzieniu, ty dostaniesz nagrodę, a ja odzyskam stragan.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //Masz na to dwa dni.
	
	if (Canthar_Gefallen == FALSE)
	{
		AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //A co JA będę z tego miał?
		AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //Kiedy już będę miał stragan, dostaniesz ode mnie broń - i to nie byle jaką.
	};
	
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Nie, nie wezmę w tym udziału.", DIA_Canthar_PAYPRICEINCITY_Nein );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "Dobrze, zrobię to.", DIA_Canthar_PAYPRICEINCITY_Ok );
	Info_AddChoice	(DIA_Canthar_PAYPRICEINCITY, "A co się stanie, jeśli odmówię?", DIA_Canthar_PAYPRICEINCITY_If );
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //A co się stanie, jeśli odmówię?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //To byłoby bardzo głupie. Widzisz, ja wiem, że jesteś zbiegłym skazańcem.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //Jeżeli to się rozniesie, możesz mieć poważne problemy...
};

func void DIA_Canthar_PAYPRICEINCITY_Nein ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //Nie, nie wezmę w tym udziału.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //Błędna decyzja, chłopcze. Jeszcze sobie pogadamy.
	
	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog ();
	Info_ClearChoices (DIA_Canthar_PAYPRICEINCITY);
	
};

func void DIA_Canthar_PAYPRICEINCITY_Ok ()
{
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //No dobra, wygląda na to, że nie mam wyboru.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //Bystry z ciebie chłopak. Oto list.
	
	CreateInvItems (self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems (self, other, ItWr_Canthars_KomproBrief_MIS, 1);
	
	AI_Output (other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //Jak mam go jej podrzucić?
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //Pozwól, żeby pokazała ci swój towar - wtedy ukryjesz list w jej kieszeni.
	AI_Output (self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //Pamiętaj, że jestem wpływowym człowiekiem, więc nie próbuj mnie oszukać.
	
	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay(); 
	
	Log_CreateTopic (TOPIC_Canthar,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Canthar,LOG_RUNNING);
	
	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry (TOPIC_Canthar,"Canthar chce, abym mu się odwdzięczył.");
	}
	else
	{
		B_LogEntry (TOPIC_Canthar,"Canthar obiecał mi, że w zamian za przysługę odda mi jedną ze swoich broni.");
	};
	B_LogEntry (TOPIC_Canthar,"Mam podłożyć handlarce Sarze fałszywy list, z którego wynika, że sprzedawała broń Onarowi. Potem mam na nią donieść Lordowi Andre.");
	
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
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //Nie masz czegoś do zrobienia?
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //Najpierw podrzuć list Sarze, a potem idź do Andre i ją oskarż.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //Zrób to - i nie próbuj mnie oszukać, bo pożałujesz.
		}
		else  
		{
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //Twoja sprawa, kiedy to zrobisz. Idź!
		};
	}
	else
	{
			AI_Output (other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //Sara nie żyje.
			AI_Output (self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //Naprawdę? Wspaniale. Zatem wykonałeś już pół naszej umowy.
			
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
	AI_Output (self, other, "DIA_Canthar_Success_09_01"); //Przejąłem jej majątek, więc przyjdź do mnie, jeśli potrzebujesz broni.
	
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
		AI_Output (other, self, "DIA_Canthar_Success_15_02"); //Miałeś dać mi broń.
		AI_Output (self, other, "DIA_Canthar_Success_09_03"); //Dokładnie. Masz, ta broń to mistrzowskie dzieło sztuki kowalskiej.
				
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
		AI_Output (other,self , "DIA_Canthar_Again_15_01"); //Dlaczego nie siedzisz w więzieniu?
		AI_Output (self,other, "DIA_Canthar_Again_09_02"); //Zostałem zwolniony. Już ci mówiłem - mam spore wpływy w mieście.
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_03"); //W międzyczasie sam się zająłem Sarą. Możesz zapomnieć o tej sprawie z listem.
		
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output (self, other, "DIA_Canthar_Again_09_04"); //Chyba cię ostrzegałem? Byłoby lepiej, gdybyś zrobił to, co ci kazałem.
	};
	AI_Output (self, other, "DIA_Canthar_Again_09_05"); //Wśród kupców chodzą słuchy, że jesteś skazańcem.
	AI_Output (self, other, "DIA_Canthar_Again_09_06"); //Przykra sprawa - teraz na targu nie kupisz już nawet bochenka chleba.
	AI_Output (self, other, "DIA_Canthar_Again_09_07"); //Mógłbym oczywiście rozwiązać twoje problemy za, powiedzmy...
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
	AI_Output (self, other, "DIA_Canthar_Pay_09_00"); //Przyszedłeś zapłacić?
	
	Info_ClearChoices (DIA_Canthar_Pay);
	
	if (Npc_HasItems (other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice (DIA_Canthar_Pay,"Dobrze, zapłacę.",DIA_Canthar_Pay_Ja);
	};
	Info_AddChoice (DIA_Canthar_Pay,"Nie mam przy sobie dość pieniędzy...",DIA_Canthar_Pay_Nein);
	Info_AddChoice (DIA_Canthar_Pay,"Ile to miało być?",DIA_Canthar_Pay_Wieviel);
};


FUNC VOID DIA_Canthar_Pay_Ja()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Ja_15_00"); //Dobra, zapłacę. Nie mam wyboru.
	B_GiveInvItems (other, self, Itmi_Gold,Canthar_Gold);
	AI_Output (self, other, "DIA_Canthar_Pay_Ja_09_01"); //Dobrze. Zadbam o to, żeby twoja reputacja u kupców się poprawiła.
	
	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE; 
	Info_ClearChoices (DIA_Canthar_Pay);
};
FUNC VOID DIA_Canthar_Pay_Nein()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Nein_15_00"); //Nie mam przy sobie dość pieniędzy...
	AI_Output (self, other, "DIA_Canthar_Pay_Nein_09_01"); //Bierz.
	Info_ClearChoices (DIA_Canthar_Pay);
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Canthar_Pay_Wieviel()
{
	AI_Output (other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //Ile to miało być?
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
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //Ostrzegałem cię, ale ty nie słuchasz. Omówmy to później.
	AI_Output (self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //A teraz zjeżdżaj, chcę odpocząć.
	
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

	description	 = 	"Sprzedajesz nielegalne udziały w kopalni!";
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
	AI_Output (other, self, "DIA_Canthar_Minenanteil_15_00"); //Sprzedajesz nielegalne udziały w kopalni!
	AI_Output (self, other, "DIA_Canthar_Minenanteil_09_01"); //Tak, i co? Co z tego! Jeśli ja tego nie zrobię, zajmie się tym ktoś inny.
	B_GivePlayerXP (XP_Ambient);
};











