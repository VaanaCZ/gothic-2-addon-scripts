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
	description	 = 	"Jak to jde?";
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
	AI_Output (other, self, "DIA_Kardif_Hi_15_00"); //Jak se vede?
	AI_Output (self, other, "DIA_Kardif_Hi_14_01"); //Jestli chce� n�co k pit�, mus� si to objednat.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif prod�v� v p��stavn� kr�m� n�poje.");
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
	description	 = 	"Po��t�m, �e tady zaslechne� spoustu v�c�...";
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
	AI_Output (other, self, "DIA_Kardif_Hallo_15_00"); //Po��t�m, �e tady zaslechne� spoustu v�c�.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_01"); //Jo, a co je ti po tom?
	AI_Output (other, self, "DIA_Kardif_Hallo_15_02"); //Nov� zpr�vy v�dycky v�t�m s otev�enou n�ru��.
	AI_Output (self, other, "DIA_Kardif_Hallo_14_03"); //A je stejn� otev�en� i tvoje pen�enka?
	AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Ka�d� informace, kterou ti d�m, t� bude st�t 10 zla��k�.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Kardif, hospodsk� z p��stavn� kr�my, prod�v� krom ko�alky i informace.");
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Ned�m ti za informaci v�c ne� 5 zla��k�.",DIA_Kardif_Hallo_Angebot);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Zapome� na to - najdu si je jinde.",DIA_Kardif_Hallo_Hart);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"No dob�e, souhlas�m.",DIA_Kardif_Hallo_Zehn);	
};
FUNC VOID DIA_Kardif_Hallo_Zehn()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //No dob�e, souhlas�m.
	AI_Output (self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //Um� dob�e smlouvat (usm�je se). Jsem ti v�dycky k slu�b�m.
	
	Kardif_Deal = 10;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Angebot()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //Ned�m ti za informaci v�c ne� 5 zla��k�.
	AI_Output (self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //Co�e, 5 zla��k�? Chce� m� o�ebra�it? (kr�tce se zamysl�) Tak to zaokrouhleme na 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Ne, takhle to nefunguje. �ekn�me 6.",DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"OK, 7 zla��k� zn� rozumn�.",DIA_Kardif_Hallo_Sieben);
};
FUNC VOID DIA_Kardif_Hallo_Hart()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Hart_15_00"); //Zapome� na to - najdu si informace jinde.
	AI_Output (self, other, "DIA_Kardif_Hallo_Hart_14_01"); //No dobr�, dobr�... slev�m tedy na 7.
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"OK, 7 zla��k� zn� rozumn�.",DIA_Kardif_Hallo_Sieben);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"Ne, ty tv� informace vlastn� a� tak nutn� nepot�ebuji.",DIA_Kardif_Hallo_Ablehnen);
};
FUNC VOID DIA_Kardif_Hallo_Sieben()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //Fajn, 7 zla��k� zn� rozumn�.
	AI_Output (self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //(zazub� se) To je moudr� rozhodnut�. Tak�e a� bude� n�co pot�ebovat, klidn� se m� zeptej.
	
	Kardif_Deal = 7;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //Ne, ty tv� informace vlastn� a� tak nutn� nepot�ebuji.
	AI_Output (self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //Hej, po�kej... (povzdech) - dobr�, 5 zla��k�, ale to je moje posledn� nab�dka!
	
	Info_ClearChoices (DIA_Kardif_Hallo);
	Info_AddChoice 	  (DIA_Kardif_Hallo,"A pro� jsi to ne�ekl hned?",DIA_Kardif_Hallo_Fuenf);

};
FUNC VOID DIA_Kardif_Hallo_Fuenf()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //A pro� jsi to ne�ekl hned?
	AI_Output (self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //�le, prost� nejsem �pln� fit. Ale a� je to, jak chce, u� jsme se dohodli.
	Kardif_Deal = 5;
	Info_ClearChoices (DIA_Kardif_Hallo);
};
FUNC VOID DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output (other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //Ne, takhle to nefunguje. �ekn�me 6.
	AI_Output (self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //Ty jsi p�kn� lump, v� to? No, kdy� na tom trv�, tak �ekn�me 6 zla��k� za ka�dou informaci.
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
	description	 = 	"R�d bych si dal n�co k pit�.";
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
	AI_Output (other, self, "DIA_Kardif_TRADE_15_00"); //R�d bych si dal n�co k pit�.
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
	description	 = 	"Pot�ebuju n�jak� informace.";
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
	AI_Output (other, self, "DIA_Kardif_TradeInfo_15_00"); //Pot�ebuji informace.

	Kardif_OneQuestion = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft! 
///////////////////////////////////////////////////////////////////////
FUNC VOID B_SayKardifZuwenigGold()
{
	AI_Output (self,other, "B_SayKardifZuwenigGold_14_00");//Vra� se, a� bude� m�t dost zlata.
};
instance DIA_Kardif_Buerger		(C_INFO)
{
	npc			 = 	VLK_431_Kardif;
	nr			 =  5;
	condition	 = 	DIA_Kardif_Buerger_Condition;
	information	 = 	DIA_Kardif_Buerger_Info;
	permanent    =  TRUE;
	description	 = 	"Kdo pat�� mezi nejvlivn�j�� ob�any tohoto m�sta?";
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
		AI_Output (other, self, "DIA_Kardif_Buerger_15_00"); //Kdo pat�� mezi nejvlivn�j�� ob�any tohoto m�sta?
		AI_Output (self, other, "DIA_Kardif_Buerger_14_01"); //Tady dole v p��stavu nenajde� nikoho. Jedin� zdej�� mocn� mu� je Lehmar.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_02"); //Lichv�� nen� zrovna popul�rn�, ale m� zlato a p�r jin�ch vlivn�ch m��an� mu dlu�� pen�ze.
		AI_Output (self, other, "DIA_Kardif_Buerger_14_03"); //Kupci a �emesln�ci maj� tak� dost velk� vliv - a� moc velk�, �ekl bych.
		
		
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
	description	 = 	"Kdo v�echno Lehmarovi n�co dlu��?";
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
		AI_Output (other, self, "DIA_Kardif_Add_15_00"); //Kdo v�echno Lehmarovi n�co dlu��?
		AI_Output (self, other, "DIA_Kardif_Add_14_01"); //(sm�je se) Jestli to chce� zjistit, m�l bys nahl�dnout do jeho ��etn� knihy.
		AI_Output (self, other, "DIA_Kardif_Add_14_02"); //Akor�t ur�it� nebude snadn� tam jen tak nepozorovan� nakouknout.
		AI_Output (self, other, "DIA_Kardif_Add_14_03"); //Pokud v�m, v�dycky ji nos� u sebe.
		
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
	description	 = 	"Kde bych mohl naj�t pr�ci?";
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
		AI_Output (other, self, "DIA_Kardif_Arbeit_15_00"); //Kde bych mohl naj�t pr�ci?
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_01"); //Tady v p��stavu pr�ci asi jen tak nenajde�. Bude� muset zaj�t za �emesln�ky v doln� ��sti m�sta.
		AI_Output (self, other, "DIA_Kardif_Arbeit_14_02"); //Ale jestli m� trochu slu�n� me�, m��e� zkusit vyzvat na souboj Alrika. Bije se za pen�ze - najde� ho za skladi�t�m.
			
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
	description	 = 	"Co v� o t�ch poh�e�ovan�ch lidech?";
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
		AI_Output (other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //V� n�co o t�ch poh�e�ovan�ch lidech z m�sta?
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //V�m jenom to, �e za posledn�ch p�r dn� tu n�jac� lid� zmizeli.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //Tady v p��stavu je to prej nejhor��. Mo�n� bys to tu mohl trochu obhl�dnout.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //A p�r p��pad� bylo i v doln� ��sti m�sta.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //Jestli chce� v�d�t v�c, promluv si s Coragonem.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //M� hospodu v doln� ��sti m�sta a leccos se doslechne.
		AI_Output (self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //A Halvor, obchodn�k s rybami dole u mola, by taky mohl v�d�t n�co zaj�mav�ho. Po��d tam za n�m n�kdo chod�.
		
	 	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_WhoStolePeople,"Kardif mi poradil, �e na poh�e�ovan� lidi bych se m�l zeptat hospodsk�ho Coragona, kter� m� kr�mu dole ve m�st�, a obchodn�ka s rybami Halvora."); 

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
	description	 = 	"Kdo m� tady m��e n�co nau�it?";
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
		AI_Output (other, self, "DIA_Kardif_Lernen_15_00"); //Kdo m� tady m��e n�co nau�it?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_01"); //Tady v p��stavi�ti najde� p�r schopn�ch lid�.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_02"); //Kov�� Carl je po��dn� sil�k. Vsad�m se, �e s jeho pomoc� si m��e� zv��it s�lu.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_03"); //Alrik toho v� spoustu o boji a Lares je prohnan� lump. N�kdy ho m��e� naj�t i tady v p��stavu.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_04"); //A jestli jsi dostate�n� pra�t�n�, zastav se u star�ho Ignaze - v� v�echno o tuhlect� aleche... almich... o lektvarech.
		AI_Output (other, self, "DIA_Kardif_Lernen_15_05"); //Kde bych je v�echny na�el?
		AI_Output (self, other, "DIA_Kardif_Lernen_14_06"); //(mru��) Hochu, ne� bych ti to vysv�tlil, tak by kr�l vyhr�l celou tuhle v�lku proti sk�et�m.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_07"); //Prost� se porozhl�dni po p��stavn� �tvrti a mus� je naj�t. A pokud to tu moc nezn�, stav se u Brahima a kup si od n�j mapu.
		AI_Output (self, other, "DIA_Kardif_Lernen_14_08"); //JEHO najde� snadno. M� ch��i hned vedle m� hospody. (mru��) Za tohle bych si m�l ��tovat dvojn�sobek.
		
		Log_CreateTopic (Topic_CityTeacher,LOG_NOTE);
		
		
		B_LogEntry (Topic_CityTeacher,"Carl, kov�� z p��stavn� �tvrti, mi m��e pomoci vylep�it s�lu.");
		B_LogEntry (Topic_CityTeacher,"Lares mi vylep�� obratnost.");
		B_LogEntry (Topic_CityTeacher,"Alrik m� vycvi�� v boji jednoru�n�mi zbran�mi. Potlouk� se kdesi za skladi�t�m v p��stavn� �tvrti.");
		B_LogEntry (Topic_CityTeacher,"Ignaz mi uk�e n�kter� recepty na m�ch�n� lektvar�. �ije v p��stavn� �tvrti.");
	
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Brahim kresl� a prod�v� mapy. Bydl� pobl� p��stavu.");
		
		
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
	description	 = 	"M��u dostat t�eba n�jakou 'zvl�tn�' pr�ci?";
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
		AI_Output (other, self, "DIA_Kardif_Diebeswerk_15_00"); //M��u dostat t�eba n�jakou "zvl�tn�" pr�ci, abych mohl rychle p�ij�t k n�jak�m pen�z�m?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_01"); //N�co zvl�tn�ho ��k�? Hmmmm...
		AI_PlayAni(self, "T_SEARCH");
		AI_Output (self, other, "DIA_Kardif_Diebeswerk_14_02"); //...tak si zkus promluvit s Nagurem, mo�n� ti pom��e.
	
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
	description	 = 	"M� pro m� n�jakou 'zvl�tn�' pr�ci?";
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
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_00"); //M� pro m� n�jakou "zvl�tn�" pr�ci?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_01"); //N�co pro tebe m�m - ale to t� bude zaj�mat jenom tehdy, pokud jsi opravdu v�estrann�.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_02"); //Co m�?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_03"); //No, Zuris, co prod�v� na tr�i�ti lektvary, m� zrovna u sebe hosta - m�ga ohn� Darona.
		AI_Output (other, self, "DIA_Kardif_Diebeswerk2_15_04"); //A?
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_05"); //Tesa� Thorben mu zvl�� vyrobil novou truhlu.
		AI_Output (self, other, "DIA_Kardif_Diebeswerk2_14_06"); //A ten Daron mu pr� p�inesl spoustu cenn�ho zbo��. Ale nic jsi ode m� nesly�el, rozum�?
		
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
	description	 = 	"Kde bych tu koupil n�jakou tr�vu?";
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
	
	AI_Output (other, self, "DIA_Kardif_DOPE_15_01"); //Kde bych tu koupil n�jakou tr�vu?
	
	if (Hlp_IsItem (heroArmor, ItAR_MIl_L) == TRUE) 
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_00"); //Ur�it� ne tady - s takov�mi v�cmi nechci nic m�t.
	}
	else
	{
		AI_Output (self, other, "DIA_Kardif_DOPE_14_02"); //Ur�it� ne tady.
		AI_Output (other, self, "DIA_Kardif_DOPE_15_03"); //A kde tedy?
		AI_Output (self, other, "DIA_Kardif_DOPE_14_04"); //B�t tebou, promluv�m si s Meldorem - ten hul� od r�na do ve�era.
		
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
	description	 = 	"Co v� o bal�ku tr�vy z ba�in?";
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
		AI_Output (other, self, "DIA_Kardif_Paket_15_00"); //Co v� o bal�ku tr�vy z ba�in?
		AI_Output (self, other, "DIA_Kardif_Paket_14_01"); //Ten, kdo takov� bal�k m�, je boh��. A nejsp� je taky t�ce v pohod�!
		AI_Output (other, self, "DIA_Kardif_Paket_15_02"); //Nesna� se m� oblbnout. Ty n�co v�, tak to vyklop!
		AI_Output (self, other, "DIA_Kardif_Paket_14_03"); //Nojo, nojo - takov� chl�pek ke mn� onehd� p�i�el. Pat�il k �old�k�m.
		AI_Output (self, other, "DIA_Kardif_Paket_14_04"); //�e pr� v p��stavu prodal bal�k tr�vy z ba�in, ale samoz�ejm� byl tot�ln� zhulen�. V�c nev�m.
		
		DIA_Kardif_Paket_perm = TRUE;
		
		B_LogEntry (TOPIC_WAREHOUSE,"Kardif hovo�il s �oldn��em, kter� se sna�il prodat bal�k tr�vy z ba�in.");
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
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_00"); //Hej ty, poj� sem. N�co pro tebe m�m.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_01"); //Jeden chl�pek tu s tebou cht�l mermomoc� mluvit.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_02"); //Kdy� t� tu nezastihl, nechal tu pro tebe vzkaz.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_03"); //Chce se s tebou sej�t. Za Halvorov�m obchodem s rybami.
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_04"); //Tahle informace je zadarmo - to je ale v�jimka, hochu! V�ecko ostatn� t� zase bude n�co st�t.
	AI_Output (other, self, "DIA_Kardif_SENDATTILA_15_05"); //Jak ten chl�pek vypadal?
	AI_Output (self, other, "DIA_Kardif_SENDATTILA_14_06"); //To ti m��u ��ct, ale nap�ed za to mus� zaplatit, k�mo. (za�kleb� se)
	
	if (Kardif_Deal == 0)
	{
		AI_Output (self, other, "DIA_Kardif_Hallo_14_04"); //Ka�d� informace, kterou ti d�m, t� bude st�t 10 zla��k�.
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
	description	 = 	"Jak ten chl�pek vypadal?";
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
		AI_Output (other, self, "DIA_Kardif_Kerl_15_00"); //Jak ten chl�pek vypadal?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_01"); //No, byl pom�rn� vysok�, siln� a m�l tmavou ple� - ale ��dnou uniformu. P�sobil tak n�jak... hroziv�.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_02"); //A jeho tv��?
		AI_Output (self, other, "DIA_Kardif_Kerl_14_03"); //Tv��? Kdy� se na m� pod�val, byl jsem r�d, �e si nep�i�el pro m�.
		AI_Output (self, other, "DIA_Kardif_Kerl_14_04"); //Z o�� mu koukala d�sn� zloba - ale i tak bys za n�m m�l zaj�t. Ur�it� to bude zaj�mav�.
		AI_Output (other, self, "DIA_Kardif_Kerl_15_05"); //Ale ot�zkou je pro koho.
		
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
	description	 = 	"Ten bastard se m� sna�il zab�t!";
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
	AI_Output (other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //Ten bastard se m� sna�il zab�t!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //Hele, j� za to p�ece nem��u! J� ti jenom p�edal informaci!
	AI_Output (self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //Jestli ti n�kdo �lape na paty, pak k tomu m� nejsp� sv� d�vody.

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
	description = "(P�edv�st zlod�jsk� sign�l.)";
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
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_00");//Aha, ty ses zapletl s t�m gangem. No dob�e, v tom p��pad� tu pro tebe n�co m�m.
	AI_Output (self, other, "DIA_Kardif_Zeichen_14_01");//(ti�e) Kdy� bude� pot�ebovat n�jak� pakl��e, p�ij� za mnou, p�r jich tu je�t� m�m. A sta��, kdy� si �ekne� o n�co k pit�.
	
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
	description = "Je�t� po��d pot�ebuji p�r n�mo�n�k�.";
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
	AI_Output (other,self , "DIA_Kardif_Crew_15_00");//Je�t� po��d pot�ebuji p�r n�mo�n�k�.
	AI_Output (self, other, "DIA_Kardif_Crew_14_01");//�asy jsou zl�, p��teli. V cel�m Khorinidu asi dost n�mo�n�k� nese�ene� - v�t�ina z nich z m�sta ode�la.
	AI_Output (self, other, "DIA_Kardif_Crew_14_02");//Ale kdy� si najde� dobr�ho kapit�na, pos�dku se�ene� celkem rychle - p�r chytr�ch chl�pk� se tu v�dycky najde.
	AI_Output (other,self , "DIA_Kardif_Crew_15_03");//Kde bych na�el kapit�na?
	AI_Output (self, other, "DIA_Kardif_Crew_14_04");//To se nept� toho neprav�ho, j� jenom vedu tuhle hospodu.
	if (Npc_IsDead (Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                           
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                         
			B_LogEntry (TOPIC_Captain,"Kardif m� poslal ke star�mu Jackovi, kter� mi nejsp� m��e pomoci.");
	    };
		AI_Output (self, other, "DIA_Kardif_Crew_14_05");//Promluv si se star�m Jackem. Bloum� tu po p��stavu u� hezky dlouho. Kdy� p�ijde na n�mo�nictv�, je to tv�j mu�.
	};
};




























