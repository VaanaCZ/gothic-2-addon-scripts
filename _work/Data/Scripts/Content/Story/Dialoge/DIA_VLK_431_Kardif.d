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
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Je�li chcesz co� do picia, to b�dziesz musia� sobie zam�wi�.
	
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
	description	 = 	"Za�o�� si�, �e s�yszysz tu wiele rzeczy...";
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
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Za�o�� si�, �e s�yszysz tu wiele rzeczy...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //No i co z tego?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Interesuj� mnie najnowsze wie�ci.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //Nie widz� w twoim r�ku sakiewki...
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Za ka�d� informacj�, kt�r� ode mnie uzyskasz, b�dziesz musia� zap�aci� 10 sztuk z�ota.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, w�a�ciciel portowej knajpy, sprzedaje informacje.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Za twoje informacje nie dam ci wi�cej ni� 5 sztuk z�ota.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie ma mowy. Znajd� sobie inne �r�d�o informacji.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, zgadzam si�.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //Dobrze, zgadzam si�.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Ubi�e� dobry interes. Jestem do twojej dyspozycji.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //Nie dam ci wi�cej ni� 5.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //Co, 5 sztuk z�ota? Chcesz mnie zrujnowa�? Dobra, niech b�dzie 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie, nic z tego. A co powiesz na 6?",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, 7 sztuk z�ota to uczciwa cena.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //Zapomnij o tym - zdob�d� informacje w inny spos�b.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //Dobra, dobra... Obni�� cen� do 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Dobrze, 7 sztuk z�ota to uczciwa cena.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"A� tak strasznie nie potrzebuj� twoich informacji.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //Dobrze, 7 sztuk z�ota to uczciwa cena.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //M�dra decyzja. Je�li chcesz co� wiedzie�, pytaj.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //A� tak strasznie nie potrzebuj� twoich informacji.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Hej, zaczekaj... No dobrze, niech b�dzie 5 monet. Ale to moje ostatnie s�owo!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Nie lepiej by�o tak od razu?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //Nie lepiej by�o tak od razu?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //Hm, po prostu nie jestem dzi� w formie. Ale niewa�ne - umowa stoi.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //Nie, nic z tego. A co powiesz na 6?
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Ale z ciebie dra�. Dobrze, je�li nalegasz, niech b�dzie - 6 sztuk z�ota za ka�d� informacj�.
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
	description	 = 	"Daj mi co� do picia.";
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
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //Daj mi co� do picia.
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
	description	 = 	"Potrzebuj� informacji.";
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
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //Potrzebuj� informacji.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//Wr�� tutaj, jak b�dziesz mia� do�� pieni�dzy.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"Kto zalicza si� do najbardziej wp�ywowych obywateli w mie�cie?";
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
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //Kto zalicza si� do najbardziej wp�ywowych obywateli w mie�cie?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //Tutaj, w porcie, trudno znale�� wielkie szychy. Tylko jeden jedyny Lehmar posiada ogromne wp�ywy.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //Ma du�o pieni�dzy, kt�re po�ycza na procent. Zaj�cie to nie zyska�o mu wielu zwolennik�w, ale wielu wp�ywowych obywateli zapo�ycza si� u niego.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Handlarze i rzemie�lnicy r�wnie� maj� du�e wp�ywy - uwa�am nawet, �e ZBYT du�e.
		
		
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
	description	 = 	"Kto jest winien pieni�dze Lehmarowi?";
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
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //Kto jest winien pieni�dze Lehmarowi?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //Je�li naprawd� chcesz wiedzie�, powiniene� zajrze� do jego ksi�gi rachunkowej.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Chocia� podejrzewam, �e nie zdo�asz tego zrobi� w taki spos�b, �eby niczego nie zauwa�y�.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Z tego co wiem, zawsze nosi j� przy sobie...
		
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
	description	 = 	"Gdzie mog� znale�� prac�?";
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
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //Gdzie mog� znale�� prac�?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //W porcie b�dzie ci�ko. Najlepiej, je�li udasz si� do rzemie�lnik�w zamieszkuj�cych doln� cz�� miasta.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Je�li posiadasz w miar� przyzwoity miecz, mo�esz spr�bowa� pojedynku z Alrikiem. Walczy za pieni�dze. Znajdziesz go za magazynem.
			
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
	description	 = 	"Co wiesz o zaginionych mieszka�cach?";
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
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //Co wiesz o zaginionych mieszka�cach?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //Tylko tyle, �e ostatnio znikaj� w mie�cie ludzie.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //Wydaje si�, �e najbardziej dotyczy to obszaru portu - na twoim miejscu tam bym o to popyta�.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //Podobno niekt�re przypadki dotycz� te� os�b z dolnego miasta.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Coragon powinien wiedzie� wi�cej na ten temat.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //Prowadzi gospod� w dolnym mie�cie i na pewno s�yszy wiele ciekawych opowie�ci.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //Co� w tej sprawie mo�e wiedzie� r�wnie� Halvor, sprzedawca ryb z nadbrze�a - cho�by tylko z powodu du�ej liczby klient�w, kt�rych obs�uguje.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif uwa�a, �e w sprawie zaginionych ludzi powinienem przepyta� Coragona, kupca z dolnego miasta, i handlarza rybami z portu, Halvora."); 

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
	description	 = 	"Kto mo�e mnie czego� tutaj nauczy�?";
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
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //Kto mo�e mnie czego� tutaj nauczy�?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Tu, w porcie, mo�esz znale�� kilku niez�ych nauczycieli.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Kowal Carl to bardzo silny m�czyzna. Z pewno�ci� zna si� na treningu si�owym.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Wie r�wnie� wiele na temat walki. Lares z kolei to przebieg�y opryszek. Jego te� czasami mo�na znale�� w porcie.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //Je�li jeste� na tyle szalony, mo�esz odwiedzi� starego Ignaza - podobno wie on co nieco na temat alche... alchi... mikstur.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //Gdzie mog� ich wszystkich znale��?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //Ch�opcze, pr�dzej Kr�l wygra wojn� z orkami, ni� ja zdo�am ci to wyt�umaczy�.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Po prostu rozejrzyj si� po dzielnicy, a pr�dzej czy p�niej natkniesz si� na nich. A je�li nie znasz tego miejsca, udaj si� do Brahima i kup sobie map�.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //Jego z kolei nietrudno odnale��. Ma chat� tu� obok mojej knajpy. Za to powinienem za��da� podw�jnej ceny.
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, kowal z dzielnicy portowej, mo�e mi pokaza�, jak sta� si� silniejszym.");
		B_LogEntry (Topic_CityTeacher,"Lares mo�e mi pom�c w zwi�kszeniu zr�czno�ci.");
		B_LogEntry (Topic_CityTeacher,"Alrik, kt�ry kr�ci si� za magazynem w dzielnicy portowej, mo�e mnie nauczy� walki or�em jednor�cznym.");
		B_LogEntry (Topic_CityTeacher,"Igaraz, kt�ry mieszka w dzielnicy portowej, zna przepisy na przer�ne mikstury.");
	
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
	description	 = 	"Czy w okolicy mo�na znale�� jakie� 'specjalne' zlecenia...?";
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
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //Czy w okolicy mo�na dosta� jakie� 'specjalne' zlecenia? Chodzi mi o jak najszybszy zarobek.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //Co� specjalnego, m�wisz... hm...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //...id� porozmawia� z Nagurem. Mo�e on b�dzie w stanie ci pom�c.
	
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
	description	 = 	"Czy masz dla mnie jakie� 'specjalne' zadanie?";
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
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //Czy masz dla mnie jakie� 'specjalne' zadanie?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //Mam pewne zlecenie - ale jest to zadanie dla kogo� o wielu talentach.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //Co masz?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //Zuris, sprzedawca mikstur z targowiska, przyjmuje w�a�nie go�cia - Maga Ognia, Darona.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //I?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Specjalnie dla niego zam�wi� kufer u stolarza Thorbena.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //Powiadaj�, �e Daron przywi�z� ze sob� sporo kosztowno�ci. Ale tego ode mnie nie s�ysza�e�, jasne?
		
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
	description	 = 	"Gdzie mog� kupi� ziele?";
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
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //Gdzie mog� kupi� ziele?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Na pewno nie tutaj - nie mam nic wsp�lnego z tym towarem.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Z pewno�ci� nie tutaj.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //Dobrze, wi�c gdzie?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //Na twoim miejscu pogada�bym z Meldorem - on pali przez ca�y czas.
		
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
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Ktokolwiek posiada tak� paczk�, jest bogatym cz�owiekiem. I prawdopodobnie nie musi si� o nic martwi�!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //Nie pr�buj mnie oszuka�. Wiesz co� na ten temat, i lepiej to z siebie wydu�!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //Dobrze, dobrze - jaki� czas temu w mojej knajpie pojawi� si� pewien cz�owiek. Najemnik.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //Powiedzia�, �e sprzeda� w porcie paczk� ziela. Kto wie, jak by�o naprawd�, facet by� kompletnie zamroczony. To wszystko co wiem.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif rozmawia� z jakim� najemnikiem, kt�ry mia� do sprzedania paczk� bagiennego ziela.");
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
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Hej, podejd� tutaj. Mam co� dla ciebie.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //By� tutaj jeden cz�owiek, chcia� z tob� koniecznie porozmawia�.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Poniewa� ci� tu nie by�o, poprosi� mnie o przekazanie ci wiadomo�ci.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Chce si� z tob� spotka� za sklepem rybnym Halvora.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Ta informacja by�a darmowa - ale si� za bardzo nie przyzwyczajaj! Nic wi�cej nie powiem, je�li mi nie zap�acisz.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //Jak wygl�da� ten cz�owiek?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //M�g�bym ci odpowiedzie� na to pytanie, ale musisz mi najpierw zap�aci�, przyjacielu.
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Za ka�d� informacj�, kt�r� ode mnie uzyskasz, b�dziesz musia� zap�aci� 10 sztuk z�ota.
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
	description	 = 	"Jak wygl�da� ten cz�owiek?";
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
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //Jak wygl�da� ten cz�owiek?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //Wysoki, raczej ciemna karnacja, wygl�da� na silnego. Nie mia� na sobie �adnego munduru. Wygl�da� jako� tak... z�owrogo.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //A jego twarz?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //Jego twarz? Kiedy na mnie popatrzy�, szczerze si� ucieszy�em, �e to nie do mnie przyszed�.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //Mia� takie dziwne, niepokoj�ce spojrzenie - s�dz� jednak, �e powiniene� si� z nim zobaczy�. Z pewno�ci� b�dzie to interesuj�ce spotkanie.
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
	description	 = 	"Ten dra� pr�bowa� mnie zabi�!";
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
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //Ten dra� pr�bowa� mnie zabi�!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Hej, czy to moja wina? Ja tylko przekaza�em ci wiadomo�� od niego.
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Je�li kto� ma co� przeciwko tobie, to podejrzewam, �e mo�e te� mie� swoje powody.

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
	description = "(Poka� z�odziejski gest)";
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
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Ach, jeste� cz�onkiem gangu. W takim wypadku mam tu co� dla ciebie.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//Je�li b�d� ci kiedy� potrzebne jakie� wytrychy, zg�o� si� do mnie. Mam jeszcze par� na zbyciu. Wystarczy, �e poprosisz o co� do picia.
	
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
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//Marne czasy nasta�y, przyjacielu. W ca�ym Khorinis nie ma wystarczaj�cej ilo�ci marynarzy. Wi�kszo�� z nich opu�ci�a miasto.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Ale dobry kapitan nie powinien mie� wielkich problem�w z zebraniem za�ogi. Potrzebujemy jeszcze paru ch�opak�w.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//Gdzie mog� znale�� kapitana?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//Pytasz nieodpowiedni� osob�. Ja tylko prowadz� knajp�.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif wys�a� mnie do starego Jacka, kt�ry podobno b�dzie m�g� udzieli� mi pomocy.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//Id� do Starego Jacka. Kr�ci si� po porcie, od kiedy si�gam pami�ci�. Nie znajdziesz nikogo lepszego.
	};
};




























