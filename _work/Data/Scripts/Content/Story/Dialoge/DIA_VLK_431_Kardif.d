///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_EXIT   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 999;
	condition   = DIA_Kardif_EXIT_Condition;
	information = DIA_Kardif_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kardif_EXIT_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Kardif_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Kardif_PICKPOCKET (C_INFO)
{
	npc			= VLK_431_Kardif;
	nr			= 900;
	condition	= DIA_Kardif_PICKPOCKET_Condition;
	information	= DIA_Kardif_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Kardif_PICKPOCKET_Condition()
{
	C_Beklauen (55, 85);
};
 
FUNC VOID DIA_Kardif_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kardif_PICKPOCKET);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_BACK 		,DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kardif_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
	
func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kardif_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hi		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hi_Condition;
	information	 = 	DIA_Kardif_Hi_Info;
	permanent    =  FALSE;
	description	 = 	"Jak leci?";
};
func int DIA_Kardif_Hi_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hi_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hi_15_00"); //Jak leci?
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Jeśli chcesz coś do picia, to będziesz musiał sobie zamówić.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif sprzedaje napoje w portowej knajpie.");
};	
	
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hallo		(C_INFO)
{
	npc		 	 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_Hallo_Condition;
	information	 = 	DIA_Kardif_Hallo_Info;
	permanent    =  FALSE;
	description	 = 	"Założę się, że słyszysz tu wiele rzeczy...";
};
func int DIA_Kardif_Hallo_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Kardif_Hi)
	&& (Kardif_Deal == 0)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Założę się, że słyszysz tu wiele rzeczy...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //No i co z tego?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Interesują mnie najnowsze wieści.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //Nie widzę w twoim ręku sakiewki...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Za każdą informację, którą ode mnie uzyskasz, będziesz musiał zapłacić 10 sztuk złota.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, właściciel portowej knajpy, sprzedaje informacje.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Za twoje informacje nie dam ci więcej niż 5 sztuk złota.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie ma mowy. Znajdę sobie inne źródło informacji.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, zgadzam się.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //Dobrze, zgadzam się.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Ubiłeś dobry interes. Jestem do twojej dyspozycji.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //Nie dam ci więcej niż 5.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //Co, 5 sztuk złota? Chcesz mnie zrujnować? Dobra, niech będzie 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie, nic z tego. A co powiesz na 6?",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, 7 sztuk złota to uczciwa cena.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //Zapomnij o tym - zdobędę informacje w inny sposób.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //Dobra, dobra... Obniżę cenę do 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, 7 sztuk złota to uczciwa cena.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Aż tak strasznie nie potrzebuję twoich informacji.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //Dobrze, 7 sztuk złota to uczciwa cena.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //Mądra decyzja. Jeśli chcesz coś wiedzieć, pytaj.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //Aż tak strasznie nie potrzebuję twoich informacji.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Hej, zaczekaj... No dobrze, niech będzie 5 monet. Ale to moje ostatnie słowo!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie lepiej było tak od razu?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //Nie lepiej było tak od razu?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //Hm, po prostu nie jestem dziś w formie. Ale nieważne - umowa stoi.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //Nie, nic z tego. A co powiesz na 6?
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Ale z ciebie drań. Dobrze, jeśli nalegasz, niech będzie - 6 sztuk złota za każdą informację.
	Kardif_Deal = 6;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TRADE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TRADE_Condition;
	information	 = 	DIA_Kardif_TRADE_Info;
	permanent	 = 	TRUE;
	trade		 = 	TRUE;
	description	 = 	"Daj mi coś do picia.";
};

func int DIA_Kardif_TRADE_Condition ()
{
	if (Kardif_OneQuestion == FALSE)	
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //Daj mi coś do picia.
};
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TradeInfo		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_TradeInfo_Condition;
	information	 = 	DIA_Kardif_TradeInfo_Info;
	permanent	 = 	TRUE;
	description	 = 	"Potrzebuję informacji.";
};

func int DIA_Kardif_TradeInfo_Condition ()
{
	if (Kardif_OneQuestion == FALSE)
	&& (Kardif_Deal > 0)	
	{
		return TRUE;
	};
};
func void DIA_Kardif_TradeInfo_Info ()
{
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //Potrzebuję informacji.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//Wróć tutaj, jak będziesz miał dość pieniędzy.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"Kto zalicza się do najbardziej wpływowych obywateli w mieście?";
};
//-------------------------------------------
var int DIA_Kardif_Buerger_permanent;
//-------------------------------------------
func int DIA_Kardif_Buerger_Condition ()
{	
	if (DIA_Kardif_Buerger_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Buerger_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //Kto zalicza się do najbardziej wpływowych obywateli w mieście?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //Tutaj, w porcie, trudno znaleźć wielkie szychy. Tylko jeden jedyny Lehmar posiada ogromne wpływy.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //Ma dużo pieniędzy, które pożycza na procent. Zajęcie to nie zyskało mu wielu zwolenników, ale wielu wpływowych obywateli zapożycza się u niego.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Handlarze i rzemieślnicy również mają duże wpływy - uważam nawet, że ZBYT duże.
		
		
		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

// *****************************************************
//						Lehmar
// *****************************************************

instance DIA_Kardif_Lehmar	(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lehmar_Condition;
	information	 = 	DIA_Kardif_Lehmar_Info;
	permanent    =  TRUE;
	description	 = 	"Kto jest winien pieniądze Lehmarowi?";
};
//-------------------------------------------
var int DIA_Kardif_Lehmar_permanent;
//-------------------------------------------
func int DIA_Kardif_Lehmar_Condition ()
{	
	if (DIA_Kardif_Lehmar_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Buerger_permanent == TRUE) //(Knows perm Info)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lehmar_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //Kto jest winien pieniądze Lehmarowi?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //Jeśli naprawdę chcesz wiedzieć, powinieneś zajrzeć do jego księgi rachunkowej.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Chociaż podejrzewam, że nie zdołasz tego zrobić w taki sposób, żeby niczego nie zauważył.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Z tego co wiem, zawsze nosi ją przy sobie...
		
		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};



///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Arbeit		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Arbeit_Condition;
	information	 = 	DIA_Kardif_Arbeit_Info;
	permanent    =  TRUE;
	description	 = 	"Gdzie mogę znaleźć pracę?";
};
//-------------------------------------------
var int DIA_Kardif_Arbeit_permanent;
//-------------------------------------------
func int DIA_Kardif_Arbeit_Condition ()
{	
	if (DIA_Kardif_Arbeit_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Arbeit_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //Gdzie mogę znaleźć pracę?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //W porcie będzie ciężko. Najlepiej, jeśli udasz się do rzemieślników zamieszkujących dolną część miasta.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Jeśli posiadasz w miarę przyzwoity miecz, możesz spróbować pojedynku z Alrikiem. Walczy za pieniądze. Znajdziesz go za magazynem.
			
	DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Kardif_MissingPeople		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Addon_Kardif_MissingPeople_Condition;
	information	 = 	DIA_Addon_Kardif_MissingPeople_Info;
	permanent    =  TRUE;
	description	 = 	"Co wiesz o zaginionych mieszkańcach?";
};
//-------------------------------------------
var int DIA_Addon_Kardif_MissingPeople_permanent;
//-------------------------------------------
func int DIA_Addon_Kardif_MissingPeople_Condition ()
{	
	if (DIA_Addon_Kardif_MissingPeople_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Kardif_MissingPeople_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //Co wiesz o zaginionych mieszkańcach?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //Tylko tyle, że ostatnio znikają w mieście ludzie.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //Wydaje się, że najbardziej dotyczy to obszaru portu - na twoim miejscu tam bym o to popytał.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //Podobno niektóre przypadki dotyczą też osób z dolnego miasta.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Coragon powinien wiedzieć więcej na ten temat.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //Prowadzi gospodę w dolnym mieście i na pewno słyszy wiele ciekawych opowieści.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //Coś w tej sprawie może wiedzieć również Halvor, sprzedawca ryb z nadbrzeża - choćby tylko z powodu dużej liczby klientów, których obsługuje.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif uważa, że w sprawie zaginionych ludzi powinienem przepytać Coragona, kupca z dolnego miasta, i handlarza rybami z portu, Halvora."); 

		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Lernen		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Lernen_Condition;
	information	 = 	DIA_Kardif_Lernen_Info;
	permanent    =  TRUE;
	description	 = 	"Kto może mnie czegoś tutaj nauczyć?";
};
//-------------------------------------------
var int DIA_Kardif_Lernen_permanent;
//-------------------------------------------
func int DIA_Kardif_Lernen_Condition ()
{	
	if (DIA_Kardif_Lernen_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};

};
func void DIA_Kardif_Lernen_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //Kto może mnie czegoś tutaj nauczyć?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Tu, w porcie, możesz znaleźć kilku niezłych nauczycieli.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Kowal Carl to bardzo silny mężczyzna. Z pewnością zna się na treningu siłowym.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Wie również wiele na temat walki. Lares z kolei to przebiegły opryszek. Jego też czasami można znaleźć w porcie.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //Jeśli jesteś na tyle szalony, możesz odwiedzić starego Ignaza - podobno wie on co nieco na temat alche... alchi... mikstur.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //Gdzie mogę ich wszystkich znaleźć?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //Chłopcze, prędzej Król wygra wojnę z orkami, niż ja zdołam ci to wytłumaczyć.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Po prostu rozejrzyj się po dzielnicy, a prędzej czy później natkniesz się na nich. A jeśli nie znasz tego miejsca, udaj się do Brahima i kup sobie mapę.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //Jego z kolei nietrudno odnaleźć. Ma chatę tuż obok mojej knajpy. Za to powinienem zażądać podwójnej ceny.
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, kowal z dzielnicy portowej, może mi pokazać, jak stać się silniejszym.");
		B_LogEntry (Topic_CityTeacher,"Lares może mi pomóc w zwiększeniu zręczności.");
		B_LogEntry (Topic_CityTeacher,"Alrik, który kręci się za magazynem w dzielnicy portowej, może mnie nauczyć walki orężem jednoręcznym.");
		B_LogEntry (Topic_CityTeacher,"Igaraz, który mieszka w dzielnicy portowej, zna przepisy na przeróżne mikstury.");
	
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Brahim sprzedaje mapy w dzielnicy portowej.");
		
		
	DIA_Kardif_Lernen_permanent = TRUE;
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk_Condition;
	information	 = 	DIA_Kardif_Diebeswerk_Info;
	permanent    =  TRUE;
	description	 = 	"Czy w okolicy można znaleźć jakieś 'specjalne' zlecenia...?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk_Condition ()
{	
	if (DIA_Kardif_Diebeswerk_permanent == FALSE)
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	//&& (other.guild == GIL_NONE) 
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //Czy w okolicy można dostać jakieś 'specjalne' zlecenia? Chodzi mi o jak najszybszy zarobek.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //Coś specjalnego, mówisz... hm...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //...idź porozmawiać z Nagurem. Może on będzie w stanie ci pomóc.
	
		DIA_Kardif_Diebeswerk_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk2		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Diebeswerk2_Condition;
	information	 = 	DIA_Kardif_Diebeswerk2_Info;
	permanent    =  TRUE;
	description	 = 	"Czy masz dla mnie jakieś 'specjalne' zadanie?";
};
//-------------------------------------------
var int DIA_Kardif_Diebeswerk2_permanent;
//-------------------------------------------
func int DIA_Kardif_Diebeswerk2_Condition ()
{	
	if (DIA_Kardif_Diebeswerk2_permanent == FALSE)
	&& (DIA_Kardif_Diebeswerk_permanent == TRUE) //andere Info
	&& (DIA_Kardif_Arbeit_permanent     == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	&& (other.guild != GIL_KDF) 
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Diebeswerk2_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //Czy masz dla mnie jakieś 'specjalne' zadanie?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //Mam pewne zlecenie - ale jest to zadanie dla kogoś o wielu talentach.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //Co masz?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //Zuris, sprzedawca mikstur z targowiska, przyjmuje właśnie gościa - Maga Ognia, Darona.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //I?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Specjalnie dla niego zamówił kufer u stolarza Thorbena.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //Powiadają, że Daron przywiózł ze sobą sporo kosztowności. Ale tego ode mnie nie słyszałeś, jasne?
		
		DIA_Kardif_Diebeswerk2_permanent = TRUE;
		
	}
	else 
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Kardif's ich will doch keine Info kaufen 
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Zurueck		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Zurueck_Condition;
	information	 = 	DIA_Kardif_Zurueck_Info;
	permanent    =  TRUE;
	description	 = 	DIALOG_BACK;
};
func int DIA_Kardif_Zurueck_Condition ()
{	
	if (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Zurueck_Info ()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices (DIA_Kardif_Zurueck);
};
///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DOPE		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_DOPE_Condition;
	information	 = 	DIA_Kardif_DOPE_Info;
	permanent    =  TRUE;
	description	 = 	"Gdzie mogę kupić ziele?";
};
var int DIA_Kardif_DOPE_perm;
func int DIA_Kardif_DOPE_Condition ()
{
	if 	(MIS_Andre_REDLIGHT == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&&  (DIA_Kardif_DOPE_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_DOPE_Info ()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //Gdzie mogę kupić ziele?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Na pewno nie tutaj - nie mam nic wspólnego z tym towarem.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Z pewnością nie tutaj.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //Dobrze, więc gdzie?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //Na twoim miejscu pogadałbym z Meldorem - on pali przez cały czas.
		
		DIA_Kardif_DOPE_perm = TRUE;
	};
	
};
///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Paket		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  3;
	condition	 = 	DIA_Kardif_Paket_Condition;
	information	 = 	DIA_Kardif_Paket_Info;
	permanent	 =  TRUE;
	description	 = 	"Co wiesz na temat paczki bagiennego ziela?";
};
var int DIA_Kardif_Paket_perm;
func int DIA_Kardif_Paket_Condition ()
{
	if 	(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	&&  (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Paket_perm == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Kardif_Paket_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Paket_15_00"); //Co wiesz na temat paczki bagiennego ziela?
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Ktokolwiek posiada taką paczkę, jest bogatym człowiekiem. I prawdopodobnie nie musi się o nic martwić!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //Nie próbuj mnie oszukać. Wiesz coś na ten temat, i lepiej to z siebie wyduś!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //Dobrze, dobrze - jakiś czas temu w mojej knajpie pojawił się pewien człowiek. Najemnik.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //Powiedział, że sprzedał w porcie paczkę ziela. Kto wie, jak było naprawdę, facet był kompletnie zamroczony. To wszystko co wiem.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif rozmawiał z jakimś najemnikiem, który miał do sprzedania paczkę bagiennego ziela.");
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info SendAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_SENDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  2;
	condition	 = 	DIA_Kardif_SENDATTILA_Condition;
	information	 = 	DIA_Kardif_SENDATTILA_Info;
	important	 = 	TRUE;
};

func int DIA_Kardif_SENDATTILA_Condition ()
{
	if (MIS_ThiefGuild_sucked == TRUE)
	|| (Diebesgilde_Okay >= 3)
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Kardif_SENDATTILA_Info ()
{
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Hej, podejdź tutaj. Mam coś dla ciebie.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //Był tutaj jeden człowiek, chciał z tobą koniecznie porozmawiać.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Ponieważ cię tu nie było, poprosił mnie o przekazanie ci wiadomości.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Chce się z tobą spotkać za sklepem rybnym Halvora.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Ta informacja była darmowa - ale się za bardzo nie przyzwyczajaj! Nic więcej nie powiem, jeśli mi nie zapłacisz.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //Jak wyglądał ten człowiek?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //Mógłbym ci odpowiedzieć na to pytanie, ale musisz mi najpierw zapłacić, przyjacielu.
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Za każdą informację, którą ode mnie uzyskasz, będziesz musiał zapłacić 10 sztuk złota.
		Kardif_Deal = 10;
	};
	Wld_InsertNpc (VLK_494_Attila, "NW_CITY_ENTRANCE_01");
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Kerl		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_Kerl_Condition;
	information	 = 	DIA_Kardif_Kerl_Info;
	permanent    =  TRUE;
	description	 = 	"Jak wyglądał ten człowiek?";
};
//----------------------------------
var int DIA_Kardif_Kerl_permanent;
//----------------------------------
func int DIA_Kardif_Kerl_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kardif_SENDATTILA)
	&& (Attila.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info ()
{
	if B_GiveInvItems (other,self,ItMi_Gold, Kardif_Deal)
	{
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //Jak wyglądał ten człowiek?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //Wysoki, raczej ciemna karnacja, wyglądał na silnego. Nie miał na sobie żadnego munduru. Wyglądał jakoś tak... złowrogo.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //A jego twarz?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //Jego twarz? Kiedy na mnie popatrzył, szczerze się ucieszyłem, że to nie do mnie przyszedł.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //Miał takie dziwne, niepokojące spojrzenie - sądzę jednak, że powinieneś się z nim zobaczyć. Z pewnością będzie to interesujące spotkanie.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_05"); //Tak... Pytanie tylko, dla kogo bardziej...
		
		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};
///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DEFEATEDATTILA		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr 			 =  2; 
	condition	 = 	DIA_Kardif_DEFEATEDATTILA_Condition;
	information	 = 	DIA_Kardif_DEFEATEDATTILA_Info;
	permanent    =  FALSE;
	description	 = 	"Ten drań próbował mnie zabić!";
};

func int DIA_Kardif_DEFEATEDATTILA_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info ()
{
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //Ten drań próbował mnie zabić!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Hej, czy to moja wina? Ja tylko przekazałem ci wiadomość od niego.
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Jeśli ktoś ma coś przeciwko tobie, to podejrzewam, że może też mieć swoje powody.

	B_GivePlayerXP (XP_Kardif_Blame4Attila);
	
	B_KillNpc	(Attila);
	Npc_RemoveInvItem	(Attila, ItMi_OldCoin);
};
///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Zeichen   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 2;
	condition   = DIA_Kardif_Zeichen_Condition;
	information = DIA_Kardif_Zeichen_Info;
	permanent   = FALSE;
	description = "(Pokaż złodziejski gest)";
};

FUNC INT DIA_Kardif_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni (other, "T_YES");
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Ach, jesteś członkiem gangu. W takim wypadku mam tu coś dla ciebie.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//Jeśli będą ci kiedyś potrzebne jakieś wytrychy, zgłoś się do mnie. Mam jeszcze parę na zbyciu. Wystarczy, że poprosisz o coś do picia.
	
	CreateInvItems (self, ItKe_Lockpick, 20);
};

//###########################
//##
//##	Kapitel 5
//##
//###########################

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kardif_Crew   (C_INFO)
{
	npc         = VLK_431_Kardif;
	nr          = 51;
	condition   = DIA_Kardif_Crew_Condition;
	information = DIA_Kardif_Crew_Info;
	permanent   = FALSE;
	description = "Brakuje mi jeszcze paru marynarzy.";
};

FUNC INT DIA_Kardif_Crew_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Kardif_Crew_Info()
{
	AI_Output (other,self , "DIA_Kardif_Crew_15_00");//Brakuje mi jeszcze paru marynarzy.
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//Marne czasy nastały, przyjacielu. W całym Khorinis nie ma wystarczającej ilości marynarzy. Większość z nich opuściła miasto.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Ale dobry kapitan nie powinien mieć wielkich problemów z zebraniem załogi. Potrzebujemy jeszcze paru chłopaków.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//Gdzie mogę znaleźć kapitana?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//Pytasz nieodpowiednią osobę. Ja tylko prowadzę knajpę.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif wysłał mnie do starego Jacka, który podobno będzie mógł udzielić mi pomocy.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//Idź do Starego Jacka. Kręci się po porcie, od kiedy sięgam pamięcią. Nie znajdziesz nikogo lepszego.
	};
};




























