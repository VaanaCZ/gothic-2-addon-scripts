///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_EXIT   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 999;
	condition   = DIA_Halvor_EXIT_Condition;
	information = DIA_Halvor_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Halvor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Halvor_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Halvor_PICKPOCKET (C_INFO)
{
	npc			= VLK_469_Halvor;
	nr			= 900;
	condition	= DIA_Halvor_PICKPOCKET_Condition;
	information	= DIA_Halvor_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Halvor_PICKPOCKET_Condition()
{
	C_Beklauen (78, 150);
};
 
FUNC VOID DIA_Halvor_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Halvor_PICKPOCKET);
	Info_AddChoice		(DIA_Halvor_PICKPOCKET, DIALOG_BACK 		,DIA_Halvor_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Halvor_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Halvor_PICKPOCKET_DoIt);
};

func void DIA_Halvor_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Halvor_PICKPOCKET);
};
	
func void DIA_Halvor_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Halvor_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Hallo		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_Hallo_Condition;
	information	 = 	DIA_Halvor_Hallo_Info;
	permanent    =  FALSE;
	important	 =  TRUE;
};

func int DIA_Halvor_Hallo_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	&& (Wld_IsTime (05,00,20,00))
	{
			return TRUE;
	};
};
func void DIA_Halvor_Hallo_Info ()
{
	AI_Output (self, other, "DIA_Halvor_Hallo_06_00"); //Hej, chcesz ryb�? Kupujcie ryby, ryby, �wie�e ryby prosto z morza!
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Halvor sprzedaje ryby w porcie.");
};
///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_TRADE		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_TRADE_Condition;
	information	 = 	DIA_Halvor_TRADE_Info;
	permanent	 =  TRUE;
	trade		 =  TRUE;
	description	 = 	"Poka� mi swoje ryby.";
};

func int DIA_Halvor_TRADE_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Halvor_Hallo)
	&& (Wld_IsTime (05,00,20,00))
	&& (Halvor_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Halvor_TRADE_15_00"); //Poka� mi swoje ryby.
	
};
///////////////////////////////////////////////////////////////////////
//	Info Night
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Night		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_Night_Condition;
	information	 = 	DIA_Halvor_Night_Info;
	permanent	 =  TRUE;
	important 	 =  TRUE;
};
func int DIA_Halvor_Night_Condition ()
{
	if (Wld_IsTime (20,00,00,00))
	&& Npc_IsInState (self, ZS_Talk)
	&& (Halvor_Ausgeliefert == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_Night_Info ()
{
	AI_Output (self, other, "DIA_Halvor_Night_06_00"); //Hej, je�li chcesz kupi� ryb�, przyjd� tutaj jutro, dobrze?
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Halvor_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_469_Halvor;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Halvor_MissingPeople_Condition;
	information	 = 	DIA_Addon_Halvor_MissingPeople_Info;

	description	 = 	"Wiesz co� o zaginionych?";
};

func int DIA_Addon_Halvor_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE)
	&& (Halvor_Ausgeliefert == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Halvor_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Halvor_MissingPeople_15_00"); //Wiesz co� o zaginionych?
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_01"); //Zaginieni? To jest port - takie rzeczy zdarzaj� si� tu od czasu do czasu.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_02"); //Morze to gro�na bestia - czasami kto� nie wraca.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_03"); //Wi�kszo�� kapitan�w du�ych jednostek najmuje za�ogi w miastach takich jak Khorinis.
	AI_Output	(self, other, "DIA_Addon_Halvor_MissingPeople_06_04"); //Je�li za� jest za ma�o ochotnik�w, to czasem zmuszaj� ludzi do s�u�by...
	
	Info_ClearChoices	(DIA_Addon_Halvor_MissingPeople);
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, DIALOG_BACK, DIA_Addon_Halvor_MissingPeople_Back );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "Du�ych jednostek?", DIA_Addon_Halvor_MissingPeople_schiff );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "Znasz jakich� zaginionych?", DIA_Addon_Halvor_MissingPeople_wer );
	Info_AddChoice	(DIA_Addon_Halvor_MissingPeople, "A tobie nikt nie zagin��?", DIA_Addon_Halvor_MissingPeople_you );
};
func void DIA_Addon_Halvor_MissingPeople_Back ()
{
	Info_ClearChoices	(DIA_Addon_Halvor_MissingPeople);
};
func void DIA_Addon_Halvor_MissingPeople_wer ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_wer_15_00"); //Znasz jakich� zaginionych?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_wer_06_01"); //Nie. Pom�w ze szkutnikami.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Handlarz rybami, Halvor, poradzi� mi jedynie, bym porozmawia� z rybakami w porcie."); 
};
func void DIA_Addon_Halvor_MissingPeople_schiff ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_schiff_15_00"); //Du�ych jednostek?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_schiff_06_01"); //Fakt, zbyt du�o statk�w tu ostatnio nie zawija.
};
func void DIA_Addon_Halvor_MissingPeople_you ()
{
	AI_Output			(other, self, "DIA_Addon_Halvor_MissingPeople_you_15_00"); //A tobie nikt nie zagin��?
	AI_Output			(self, other, "DIA_Addon_Halvor_MissingPeople_you_06_01"); //Mi? Nie.
};

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_MESSAGE		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	2;
	condition	 = 	DIA_Halvor_MESSAGE_Condition;
	information	 = 	DIA_Halvor_MESSAGE_Info;
	permanent    =  FALSE;
	description	 = 	"Wydaje mi si�, �e ten kawa�ek papieru nale�y do ciebie...";
	trade		 =  FALSE;
};

func int DIA_Halvor_MESSAGE_Condition ()
{	
	if (Knows_Halvor == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Halvor_MESSAGE_Info ()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_15_00"); //Wydaje mi si�, �e ten kawa�ek papieru nale�y do ciebie...
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_01"); //Co...? Poka� go.
	B_UseFakeScroll 	();
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_02"); //Ale przecie� nie trzeba i�� z tym od razu do stra�y miejskiej, prawda? Z pewno�ci� uda nam si� doj�� do porozumienia, co?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_06_03"); //Ale przecie� nie trzeba i�� z tym od razu do stra�y miejskiej, prawda? Z pewno�ci� uda si� nam doj�� do porozumienia, co?
	
	Info_ClearChoices (DIA_Halvor_MESSAGE);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Czekam na twoj� ofert�.",DIA_Halvor_MESSAGE_OFFER);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Wygl�da na to, ze p�jdziesz siedzie�.",DIA_Halvor_MESSAGE_PRISON);

};
FUNC VOID DIA_Halvor_MESSAGE_OFFER()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_OFFER_15_00"); //Czekam na twoj� ofert�.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_OFFER_06_01"); //Dobrze. Powiem ci co�. Mog� ci sprzeda� co� wi�cej ni� tylko ryby.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_OFFER_06_03"); //Je�li oddasz mi ten papier i, hm, zapomnisz o ca�ej sprawie, mo�emy zosta� najlepszymi partnerami handlowymi.
	
	Info_ClearChoices (DIA_Halvor_MESSAGE);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Dobra, umowa stoi.",DIA_Halvor_MESSAGE_Okay);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Wygl�da na to, ze p�jdziesz siedzie�.",DIA_Halvor_MESSAGE_PRISON);
	Info_AddChoice    (DIA_Halvor_MESSAGE,"Doprawdy? A jakie jeszcze towary rozprowadzasz?",DIA_Halvor_MESSAGE_DEAL);
};	
FUNC VOID DIA_Halvor_MESSAGE_PRISON()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_PRISON_15_00"); //Wygl�da na to, ze p�jdziesz siedzie�.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_PRISON_06_01"); //Nie, zaczekaj, nie r�b tego! W ko�cu jestem tylko... No wiesz... Ma�� p�otk�...
	AI_Output (other, self, "DIA_Halvor_MESSAGE_PRISON_15_02"); //Powiniene� by� o tym pomy�le� wcze�niej. Teraz jest ju� za p�no - Lord Andre dowie si�, co zrobi�e�.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_PRISON_06_03"); //Po�a�ujesz tego.
	
	Betrayal_Halvor = TRUE;
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Halvor_MESSAGE_DEAL()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_DEAL_15_00"); //Doprawdy? A jakie jeszcze towary rozprowadzasz?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_DEAL_06_01"); //M�g�bym ci na przyk�ad zaoferowa�... specjaln� ryb�. Nie tak� zwyk�� ryb� do jedzenia.
	AI_Output (other, self, "DIA_Halvor_MESSAGE_DEAL_15_02"); //Masz na my�li tak� ryb� z niespodziank�, jak ta, kt�ra zawiera�a sekretn� wiadomo��?
	AI_Output (self, other, "DIA_Halvor_MESSAGE_DEAL_06_03"); //Dok�adnie. Mam kilka takich... ryb.
	
};
FUNC VOID DIA_Halvor_MESSAGE_Okay()
{
	AI_Output (other, self, "DIA_Halvor_MESSAGE_Okay_15_00"); //Dobrze, umowa stoi. A zatem ca�a sprawa pozostanie tylko mi�dzy nami.
	AI_Output (self, other, "DIA_Halvor_MESSAGE_Okay_06_01"); //Dzi�kuj� ci. Zajrzyj do mnie, je�li kiedy� b�dziesz w s�siedztwie. Na pewno znajdzie si� dla ciebie co� ciekawego.
	
	B_GiveInvItems 	   (other, self, ItWr_HalvorMessage,1);
	Npc_RemoveInvItems (self, ItWr_HalvorMessage,1);
	
	Halvor_Deal = TRUE;
	Diebesgilde_Okay = (Diebesgilde_Okay + 1);
	//------------------------------------------------------
	CreateInvItems 	   (self,ItSe_ErzFisch , 1);
	CreateInvItems 	   (self,ItSe_GoldFisch, 1);
	CreateInvItems 	   (self,ItSe_Ringfisch , 1);
	CreateInvItems 	   (self,ItSe_LockpickFisch , 1);
	//------------------------------------------------------
	Info_ClearChoices (DIA_Halvor_MESSAGE);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_Zeichen   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 2;
	condition   = DIA_Halvor_Zeichen_Condition;
	information = DIA_Halvor_Zeichen_Info;
	permanent   = FALSE;
	description = "(Poka� z�odziejski gest)";
};

FUNC INT DIA_Halvor_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	&& (Betrayal_Halvor ==  FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Halvor_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Halvor_Zeichen_06_00");//Rozumiem. Nie przyszed�e� tylko po ryb�.
	AI_Output (self, other, "DIA_Halvor_Zeichen_06_01");//Mam dla ciebie propozycj�. Je�li masz jakie� srebrne talerze lub kielichy, odkupi� je od ciebie za dobr� cen�.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
	
	Log_CreateTopic (Topic_Diebesgilde,LOG_NOTE);
	B_LogEntry (Topic_Diebesgilde,"Halvor zap�aci mi za srebrne kielichy i talerze wi�cej ni� jakikolwiek inny kupiec.");
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Halvor_Hehlerei   (C_INFO)
{
	npc         = VLK_469_Halvor;
	nr          = 2;
	condition   = DIA_Halvor_Hehlerei_Condition;
	information = DIA_Halvor_Hehlerei_Info;
	permanent   = TRUE;
	description = "(Sprzeda� starych talerzy i kielich�w)";
};

FUNC INT DIA_Halvor_Hehlerei_Condition()
{
	if Npc_KnowsInfo (other,DIA_Halvor_Zeichen)
	&& (Betrayal_Halvor == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Halvor_Hehlerei_Info()
{
	Halvor_Score = 0; //resetten
	
	if  (Halvor_Day != Wld_GetDay())
	{
		
		if (Npc_HasItems (other,ItMi_SilverPlate) >= 1)
		|| (Npc_HasItems (other,ItMi_SilverCup) >= 1)
		{
			Halvor_Score =  (Npc_HasItems (other,ItMi_SilverPlate) * (Value_SilverPlate/2)) + (Npc_HasItems (other,ItMi_SilverCup) * (Value_SilverCup/2));
			
			if (Halvor_Score <=  1000)  //weil sonst kein B_Say_Gold mehr...
			{
				AI_Output (self, other, "DIA_Halvor_Zeichen_06_05");//Za to wszystko, mog� ci da�...
				B_Say_Gold (self, other, Halvor_Score);
			
				Info_ClearChoices (DIA_Halvor_Hehlerei);
				Info_AddChoice (DIA_Halvor_Hehlerei,"Sprzedano.",DIA_Halvor_Hehlerei_Annehmen);
				Info_AddChoice (DIA_Halvor_Hehlerei,"Musz� si� zastanowi�.",DIA_Halvor_Hehlerei_Ablehnen);
			}
			else 
			{
				AI_Output (self, other, "DIA_Halvor_Zeichen_06_06");//Przynios�e� za du�o - nie zdo�am sprzeda� naraz tego wszystkiego.
				Info_ClearChoices (DIA_Halvor_Hehlerei);
			};
		}
		else 
		{
			AI_Output (self, other, "DIA_Halvor_Zeichen_06_02");//Wr��, kiedy b�dziesz mia� jeszcze jakie� talerze albo kielichy na sprzeda�.
			Info_ClearChoices (DIA_Halvor_Hehlerei);
		};
	}
	else if (Wld_GetDay() == 0)
	{
		AI_Output (self, other, "DIA_Halvor_Zeichen_06_03");//Kupi� od ciebie te srebra, ale dopiero jutro. Dzisiaj jest jeszcze za wcze�nie.
	}
	else 
	{
		AI_Output (self, other, "DIA_Halvor_Zeichen_06_04");//Przykro mi, dzisiaj nie robi� ju� �adnych interes�w. Wr�� jutro, dobrze?
	};

};
FUNC VOID DIA_Halvor_Hehlerei_Annehmen()
{
	/*
	CreateInvItems (other, ItRW_Arrow,(Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)));//F�r Textausgabe -> ist ziemlich dreckig, aber wie sonst? 
	B_GiveInvItems (other, self, ItRW_Arrow,(Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)) ); 
 	*/
 	
 	//--------- Patch 2.5a-----------------------------------------
 	var int amount;
 	var string concatText;
 	amount = (Npc_HasItems (other, ItMi_SilverPlate)+ Npc_HasItems (other, ItMi_SilverCup)) ;
 	
 	concatText = ConcatStrings(IntToString(amount), PRINT_ItemsGegeben);
 	AI_PrintScreen (concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
 	
 	//------------------------------------------------------------
 	
 	Npc_RemoveInvItems (other, ItMi_SilverCup,Npc_HasItems (other, ItMi_SilverCup));
 	Npc_RemoveInvItems (other, ItMi_SilverPlate, Npc_HasItems (other, ItmI_SilverPlate));
 	
 	B_GiveInvItems (self, other, ItMi_Gold, Halvor_Score);
 	
 	AI_Output (other, self, "DIA_Halvor_Zeichen_Annehmen_15_00");//Sprzedano.
 	AI_Output (self, other, "DIA_Halvor_Zeichen_Annehmen_06_01");//Ubili�my ostatnio par� dobrych interes�w. Lepiej ju� dzi� nie wracaj, bo kto� mo�e nabra� podejrze�.
	
	Halvor_Day = Wld_GetDay ();
	Info_ClearChoices (DIA_Halvor_Hehlerei);
}; 
FUNC VOID DIA_Halvor_Hehlerei_Ablehnen()
{
	Info_ClearChoices (DIA_Halvor_Hehlerei);
};

//#############################################
//##
//##	Kapitel 5
//##
//#############################################

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Halvor_Crew		(C_INFO)
{
	npc			 = 	VLK_469_Halvor;
	nr			 = 	51;
	condition	 = 	DIA_Halvor_Crew_Condition;
	information	 = 	DIA_Halvor_Crew_Info;
	permanent    =  FALSE;
	description	 =  "Szukam za�ogi.";
};

func int DIA_Halvor_Crew_Condition ()
{	
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Halvor_Ausgeliefert == FALSE)
	{
			return TRUE;
	};
};
func void DIA_Halvor_Crew_Info ()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_15_00"); //Szukam za�ogi.
	AI_Output (self ,other,"DIA_Halvor_Crew_06_01"); //A jak zamierzasz st�d wyp�yn��?
	
	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,"To ju� moje zmartwienie.",DIA_Halvor_Crew_MyThing);
	Info_AddChoice (DIA_Halvor_Crew,"Zamierzam przej�� statek.",DIA_Halvor_Crew_StealShip);
	
};

FUNC VOID DIA_Halvor_Crew_MyThing()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_MyThing_15_00"); //To ju� moje zmartwienie.
	AI_Output (self ,other,"DIA_Halvor_Crew_MyThing_06_01"); //Oczywi�cie. To naprawd� nie moja sprawa.

	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,DIALOG_BACK,DIA_Halvor_Crew_BACK);
	Info_AddChoice (DIA_Halvor_Crew,"Chcesz si� ze mn� zabra�?",DIA_Halvor_Crew_JoinMe);
	Info_AddChoice (DIA_Halvor_Crew,"Mo�esz mi pom�c?",DIA_Halvor_Crew_HelpMe); 
};

FUNC VOID DIA_Halvor_Crew_StealShip()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_StealShip_15_00"); //Zamierzam przej�� statek.
	AI_Output (self ,other,"DIA_Halvor_Crew_StealShip_06_01"); //Jasne. M�wisz powa�nie? Je�li z�api� ci� paladyni, nie b�d� si� z tob� cacka�.
	AI_Output (self ,other,"DIA_Halvor_Crew_StealShip_06_02"); //Bardzo prosz� - w ko�cu to nie ja strac� �ycie.
	
	Info_ClearChoices (DIA_Halvor_Crew);
	Info_AddChoice (DIA_Halvor_Crew,DIALOG_BACK,DIA_Halvor_Crew_BACK);
	Info_AddChoice (DIA_Halvor_Crew,"Chcesz si� ze mn� zabra�?",DIA_Halvor_Crew_JoinMe);
	if (Npc_IsDead (JACK) == FALSE)
	{
		Info_AddChoice (DIA_Halvor_Crew,"Mo�esz mi pom�c?",DIA_Halvor_Crew_HelpMe); 
	};
};

FUNC VOID DIA_Halvor_Crew_JoinMe()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_JoinMe_15_00"); //Chcesz si� ze mn� zabra�?
	AI_Output (self ,other,"DIA_Halvor_Crew_JoinMe_06_01"); //Nie, chyba nie. Mam tu du�o roboty i m�wi�c szczerze, nie marzy mi si� spotkanie galery pe�nej ork�w.
	AI_Output (self ,other,"DIA_Halvor_Crew_JoinMe_06_02"); //Ale �ycz� ci powodzenia.
};

FUNC VOID DIA_Halvor_Crew_HelpMe()
{
	AI_Output (other,self ,"DIA_Halvor_Crew_HelpMe_15_00"); //Mo�esz mi pom�c?
	AI_Output (self ,other,"DIA_Halvor_Crew_HelpMe_06_01"); //Nie jestem chyba odpowiedni� osob�. Id� pogada� z Jackiem, powinien by� gdzie� w porcie. On b�dzie wiedzia� najlepiej, czego ci potrzeba.
};

FUNC VOID DIA_Halvor_Crew_Back()
{
	Info_ClearChoices (DIA_Halvor_Crew);
};




