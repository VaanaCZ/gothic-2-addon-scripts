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
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Jeœli chcesz coœ do picia, to bêdziesz musia³ sobie zamówiæ.
	
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
	description	 = 	"Za³o¿ê siê, ¿e s³yszysz tu wiele rzeczy...";
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
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Za³o¿ê siê, ¿e s³yszysz tu wiele rzeczy...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //No i co z tego?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Interesuj¹ mnie najnowsze wieœci.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //Nie widzê w twoim rêku sakiewki...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Za ka¿d¹ informacjê, któr¹ ode mnie uzyskasz, bêdziesz musia³ zap³aciæ 10 sztuk z³ota.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, w³aœciciel portowej knajpy, sprzedaje informacje.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Za twoje informacje nie dam ci wiêcej ni¿ 5 sztuk z³ota.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie ma mowy. Znajdê sobie inne Ÿród³o informacji.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, zgadzam siê.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //Dobrze, zgadzam siê.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Ubi³eœ dobry interes. Jestem do twojej dyspozycji.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //Nie dam ci wiêcej ni¿ 5.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //Co, 5 sztuk z³ota? Chcesz mnie zrujnowaæ? Dobra, niech bêdzie 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie, nic z tego. A co powiesz na 6?",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, 7 sztuk z³ota to uczciwa cena.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //Zapomnij o tym - zdobêdê informacje w inny sposób.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //Dobra, dobra... Obni¿ê cenê do 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, 7 sztuk z³ota to uczciwa cena.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"A¿ tak strasznie nie potrzebujê twoich informacji.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //Dobrze, 7 sztuk z³ota to uczciwa cena.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //M¹dra decyzja. Jeœli chcesz coœ wiedzieæ, pytaj.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //A¿ tak strasznie nie potrzebujê twoich informacji.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Hej, zaczekaj... No dobrze, niech bêdzie 5 monet. Ale to moje ostatnie s³owo!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie lepiej by³o tak od razu?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //Nie lepiej by³o tak od razu?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //Hm, po prostu nie jestem dziœ w formie. Ale niewa¿ne - umowa stoi.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //Nie, nic z tego. A co powiesz na 6?
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Ale z ciebie drañ. Dobrze, jeœli nalegasz, niech bêdzie - 6 sztuk z³ota za ka¿d¹ informacjê.
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
	description	 = 	"Daj mi coœ do picia.";
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
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //Daj mi coœ do picia.
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
	description	 = 	"Potrzebujê informacji.";
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
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //Potrzebujê informacji.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//Wróæ tutaj, jak bêdziesz mia³ doœæ pieniêdzy.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"Kto zalicza siê do najbardziej wp³ywowych obywateli w mieœcie?";
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
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //Kto zalicza siê do najbardziej wp³ywowych obywateli w mieœcie?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //Tutaj, w porcie, trudno znaleŸæ wielkie szychy. Tylko jeden jedyny Lehmar posiada ogromne wp³ywy.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //Ma du¿o pieniêdzy, które po¿ycza na procent. Zajêcie to nie zyska³o mu wielu zwolenników, ale wielu wp³ywowych obywateli zapo¿ycza siê u niego.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Handlarze i rzemieœlnicy równie¿ maj¹ du¿e wp³ywy - uwa¿am nawet, ¿e ZBYT du¿e.
		
		
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
	description	 = 	"Kto jest winien pieni¹dze Lehmarowi?";
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
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //Kto jest winien pieni¹dze Lehmarowi?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //Jeœli naprawdê chcesz wiedzieæ, powinieneœ zajrzeæ do jego ksiêgi rachunkowej.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Chocia¿ podejrzewam, ¿e nie zdo³asz tego zrobiæ w taki sposób, ¿eby niczego nie zauwa¿y³.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Z tego co wiem, zawsze nosi j¹ przy sobie...
		
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
	description	 = 	"Gdzie mogê znaleŸæ pracê?";
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
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //Gdzie mogê znaleŸæ pracê?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //W porcie bêdzie ciê¿ko. Najlepiej, jeœli udasz siê do rzemieœlników zamieszkuj¹cych doln¹ czêœæ miasta.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Jeœli posiadasz w miarê przyzwoity miecz, mo¿esz spróbowaæ pojedynku z Alrikiem. Walczy za pieni¹dze. Znajdziesz go za magazynem.
			
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
	description	 = 	"Co wiesz o zaginionych mieszkañcach?";
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
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //Co wiesz o zaginionych mieszkañcach?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //Tylko tyle, ¿e ostatnio znikaj¹ w mieœcie ludzie.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //Wydaje siê, ¿e najbardziej dotyczy to obszaru portu - na twoim miejscu tam bym o to popyta³.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //Podobno niektóre przypadki dotycz¹ te¿ osób z dolnego miasta.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Coragon powinien wiedzieæ wiêcej na ten temat.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //Prowadzi gospodê w dolnym mieœcie i na pewno s³yszy wiele ciekawych opowieœci.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //Coœ w tej sprawie mo¿e wiedzieæ równie¿ Halvor, sprzedawca ryb z nadbrze¿a - choæby tylko z powodu du¿ej liczby klientów, których obs³uguje.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif uwa¿a, ¿e w sprawie zaginionych ludzi powinienem przepytaæ Coragona, kupca z dolnego miasta, i handlarza rybami z portu, Halvora."); 

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
	description	 = 	"Kto mo¿e mnie czegoœ tutaj nauczyæ?";
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
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //Kto mo¿e mnie czegoœ tutaj nauczyæ?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Tu, w porcie, mo¿esz znaleŸæ kilku niez³ych nauczycieli.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Kowal Carl to bardzo silny mê¿czyzna. Z pewnoœci¹ zna siê na treningu si³owym.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Wie równie¿ wiele na temat walki. Lares z kolei to przebieg³y opryszek. Jego te¿ czasami mo¿na znaleŸæ w porcie.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //Jeœli jesteœ na tyle szalony, mo¿esz odwiedziæ starego Ignaza - podobno wie on co nieco na temat alche... alchi... mikstur.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //Gdzie mogê ich wszystkich znaleŸæ?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //Ch³opcze, prêdzej Król wygra wojnê z orkami, ni¿ ja zdo³am ci to wyt³umaczyæ.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Po prostu rozejrzyj siê po dzielnicy, a prêdzej czy póŸniej natkniesz siê na nich. A jeœli nie znasz tego miejsca, udaj siê do Brahima i kup sobie mapê.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //Jego z kolei nietrudno odnaleŸæ. Ma chatê tu¿ obok mojej knajpy. Za to powinienem za¿¹daæ podwójnej ceny.
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, kowal z dzielnicy portowej, mo¿e mi pokazaæ, jak staæ siê silniejszym.");
		B_LogEntry (Topic_CityTeacher,"Lares mo¿e mi pomóc w zwiêkszeniu zrêcznoœci.");
		B_LogEntry (Topic_CityTeacher,"Alrik, który krêci siê za magazynem w dzielnicy portowej, mo¿e mnie nauczyæ walki orê¿em jednorêcznym.");
		B_LogEntry (Topic_CityTeacher,"Igaraz, który mieszka w dzielnicy portowej, zna przepisy na przeró¿ne mikstury.");
	
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
	description	 = 	"Czy w okolicy mo¿na znaleŸæ jakieœ 'specjalne' zlecenia...?";
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
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //Czy w okolicy mo¿na dostaæ jakieœ 'specjalne' zlecenia? Chodzi mi o jak najszybszy zarobek.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //Coœ specjalnego, mówisz... hm...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //...idŸ porozmawiaæ z Nagurem. Mo¿e on bêdzie w stanie ci pomóc.
	
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
	description	 = 	"Czy masz dla mnie jakieœ 'specjalne' zadanie?";
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
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //Czy masz dla mnie jakieœ 'specjalne' zadanie?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //Mam pewne zlecenie - ale jest to zadanie dla kogoœ o wielu talentach.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //Co masz?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //Zuris, sprzedawca mikstur z targowiska, przyjmuje w³aœnie goœcia - Maga Ognia, Darona.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //I?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Specjalnie dla niego zamówi³ kufer u stolarza Thorbena.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //Powiadaj¹, ¿e Daron przywióz³ ze sob¹ sporo kosztownoœci. Ale tego ode mnie nie s³ysza³eœ, jasne?
		
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
	description	 = 	"Gdzie mogê kupiæ ziele?";
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
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //Gdzie mogê kupiæ ziele?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Na pewno nie tutaj - nie mam nic wspólnego z tym towarem.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Z pewnoœci¹ nie tutaj.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //Dobrze, wiêc gdzie?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //Na twoim miejscu pogada³bym z Meldorem - on pali przez ca³y czas.
		
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
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Ktokolwiek posiada tak¹ paczkê, jest bogatym cz³owiekiem. I prawdopodobnie nie musi siê o nic martwiæ!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //Nie próbuj mnie oszukaæ. Wiesz coœ na ten temat, i lepiej to z siebie wyduœ!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //Dobrze, dobrze - jakiœ czas temu w mojej knajpie pojawi³ siê pewien cz³owiek. Najemnik.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //Powiedzia³, ¿e sprzeda³ w porcie paczkê ziela. Kto wie, jak by³o naprawdê, facet by³ kompletnie zamroczony. To wszystko co wiem.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif rozmawia³ z jakimœ najemnikiem, który mia³ do sprzedania paczkê bagiennego ziela.");
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
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Hej, podejdŸ tutaj. Mam coœ dla ciebie.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //By³ tutaj jeden cz³owiek, chcia³ z tob¹ koniecznie porozmawiaæ.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Poniewa¿ ciê tu nie by³o, poprosi³ mnie o przekazanie ci wiadomoœci.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Chce siê z tob¹ spotkaæ za sklepem rybnym Halvora.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Ta informacja by³a darmowa - ale siê za bardzo nie przyzwyczajaj! Nic wiêcej nie powiem, jeœli mi nie zap³acisz.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //Jak wygl¹da³ ten cz³owiek?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //Móg³bym ci odpowiedzieæ na to pytanie, ale musisz mi najpierw zap³aciæ, przyjacielu.
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Za ka¿d¹ informacjê, któr¹ ode mnie uzyskasz, bêdziesz musia³ zap³aciæ 10 sztuk z³ota.
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
	description	 = 	"Jak wygl¹da³ ten cz³owiek?";
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
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //Jak wygl¹da³ ten cz³owiek?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //Wysoki, raczej ciemna karnacja, wygl¹da³ na silnego. Nie mia³ na sobie ¿adnego munduru. Wygl¹da³ jakoœ tak... z³owrogo.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //A jego twarz?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //Jego twarz? Kiedy na mnie popatrzy³, szczerze siê ucieszy³em, ¿e to nie do mnie przyszed³.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //Mia³ takie dziwne, niepokoj¹ce spojrzenie - s¹dzê jednak, ¿e powinieneœ siê z nim zobaczyæ. Z pewnoœci¹ bêdzie to interesuj¹ce spotkanie.
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
	description	 = 	"Ten drañ próbowa³ mnie zabiæ!";
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
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //Ten drañ próbowa³ mnie zabiæ!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Hej, czy to moja wina? Ja tylko przekaza³em ci wiadomoœæ od niego.
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Jeœli ktoœ ma coœ przeciwko tobie, to podejrzewam, ¿e mo¿e te¿ mieæ swoje powody.

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
	description = "(Poka¿ z³odziejski gest)";
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
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Ach, jesteœ cz³onkiem gangu. W takim wypadku mam tu coœ dla ciebie.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//Jeœli bêd¹ ci kiedyœ potrzebne jakieœ wytrychy, zg³oœ siê do mnie. Mam jeszcze parê na zbyciu. Wystarczy, ¿e poprosisz o coœ do picia.
	
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
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//Marne czasy nasta³y, przyjacielu. W ca³ym Khorinis nie ma wystarczaj¹cej iloœci marynarzy. Wiêkszoœæ z nich opuœci³a miasto.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Ale dobry kapitan nie powinien mieæ wielkich problemów z zebraniem za³ogi. Potrzebujemy jeszcze paru ch³opaków.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//Gdzie mogê znaleŸæ kapitana?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//Pytasz nieodpowiedni¹ osobê. Ja tylko prowadzê knajpê.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif wys³a³ mnie do starego Jacka, który podobno bêdzie móg³ udzieliæ mi pomocy.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//IdŸ do Starego Jacka. Krêci siê po porcie, od kiedy siêgam pamiêci¹. Nie znajdziesz nikogo lepszego.
	};
};




























