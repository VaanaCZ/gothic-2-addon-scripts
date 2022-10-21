///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jack_EXIT   (C_INFO)
{
	npc         = VLK_444_Jack;
	nr          = 999;
	condition   = DIA_Jack_EXIT_Condition;
	information = DIA_Jack_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jack_EXIT_Condition()
{
	if (Kapitel < 3)
		{
				return TRUE;
		};
};

FUNC VOID DIA_Jack_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jack_PICKPOCKET (C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 900;
	condition	= DIA_Jack_PICKPOCKET_Condition;
	information	= DIA_Jack_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jack_PICKPOCKET_Condition()
{
	C_Beklauen (50, 100);
};
 
FUNC VOID DIA_Jack_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jack_PICKPOCKET);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_BACK 		,DIA_Jack_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jack_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jack_PICKPOCKET_DoIt);
};

func void DIA_Jack_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
	
func void DIA_Jack_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jack_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_GREET		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	4;
	condition	 = 	DIA_Jack_GREET_Condition;
	information	 = 	DIA_Jack_GREET_Info;
	important 	 =  TRUE; 

};

func int DIA_Jack_GREET_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Jack_GREET_Info ()
{
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Ahoj, szczurze l�dowy! Utkn��e� tu na dobre, co?
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //He, he... Troch� blado wygl�dasz.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Ale nie przejmuj si�, ch�opcze. Przyda ci si� troch� �wie�ej, morskiej bryzy, ot i wszystko!
};


///////////////////////////////////////////////////////////////////////
//	Was machst Du hier
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Job		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	5;
	condition	 = 	DIA_Jack_Job_Condition;
	information	 = 	DIA_Jack_Job_Info;

	description	 = 	"Co tu porabiasz?";
};

func int DIA_Jack_Job_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_GREET)
	{
		return TRUE;
	};
};
func void DIA_Jack_Job_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Czym si� tu zajmujesz?
	//AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Dawno temu, kiedy by�em takim m�odzikiem jak ty, wyruszy�em w morze i �eglowa�em przez niejeden sztorm.
	//AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Wiele lat temu osiad�em w Khorinis i zaj��em si� tutejsz� latarni�.
	//AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Gdzie tam, niby nic wielkiego... Ale tylko dzi�ki tej starej wie�y mog� by� blisko mojego prawdziwego domu.
	//AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Nie by�em na g�rze od wiek�w...
	//AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Dlaczego?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Odk�d te �otry zaj�y moj� latarni�, ba�em si� do niej zbli�y� na dwadzie�cia krok�w. Banda �ajdak�w.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Wiesz, to ci bandyci z G�rniczej Doliny.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Najpierw po drugiej stronie g�r by� wielki huk, a potem ca�a ta zgraja zwali�a si� do miasta jak plaga szara�czy. Teraz kryj� si�, gdzie popadnie - nawet w mojej latarni.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //My�l�, �e wypatruj� jakiego� statku, kt�ry mogliby zaj��.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //I niech sobie zajmuj�! Byle tylko wynie�li si� z mojej wie�y.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Stary marynarz, Jack, nie mo�e wr�ci� do latarni morskiej, dop�ki przebywaj� tam bandyci."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"Cz�sto odwiedzasz miasto?";
};

func int DIA_Jack_City_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_Job)
	{
		return TRUE;
	};
};
func void DIA_Jack_City_Info ()
{
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Cz�sto odwiedzasz miasto?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Miasto jest tylko tak dobre, jak jego przysta�. Zawsze to m�wi�.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Przysta� jest oknem na �wiat. To tutaj spotykaj� si� ludzie. Tutaj wszystko si� zaczyna.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Gdy przysta� schodzi na psy, miasto wkr�tce pod��y jej �ladem.
};

///////////////////////////////////////////////////////////////////////
//	Erz�hl mir was �ber den Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_Harbor		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	70;
	condition	 = 	DIA_Jack_Harbor_Condition;
	information	 = 	DIA_Jack_Harbor_Info;
	permanent	 =  TRUE;

	description	 = 	"Opowiedz mi o przystani.";
};

func int DIA_Jack_Harbor_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Jack_City)
		&&	((Npc_GetDistToWP(self,"LIGHTHOUSE")< 3000) == FALSE)
		&& 	(JackIsCaptain == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Jack_Harbor_Info ()
{
	AI_Output			(other, self, "DIA_Jack_Harbor_15_00"); //Opowiedz mi o przystani.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Przysta� w Khorinis to ju� nie to samo co kiedy�.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Zosta�y tu same szumowiny, statki przesta�y przyp�ywa�, nie ma handlu. Ta przysta� to ju� stara historia.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Dlaczego statki przesta�y tu przyp�ywa�?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Co masz na my�li, m�wi�c 'szumowiny'?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Wi�c dlaczego st�d nie odp�yniesz?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Dlaczego statki przesta�y tu przyp�ywa�?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //M�wi�, �e jak sko�czy si� wojna, wszystko b�dzie po staremu, ale to bzdury.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Uwierz mi - marynarz zawsze wie, kiedy miasto schodzi na psy.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Czuje to we krwi. A powiadam - ta przysta� jest ju� stracona. Nigdy nie wr�ci do dawnej �wietno�ci.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Co masz na my�li, m�wi�c 'szumowiny'?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Popatrz tylko na nich: leniwe obwiesie! Wi�kszo�� z nich nie wie, co to uczciwa praca. Ca�ymi dniami nic tylko ��opi� piwsko i puszczaj� ostatnie pieni�dze w burdelu.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Dobrze ci radz� - trzymaj si� od nich z dala!
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Wi�c dlaczego st�d nie odp�yniesz?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //A kto by przyj�� na pok�ad takiego starego wilka jak ja?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //Ludzie my�l�, �e Stary Jack nie nadaje si� ju� do �eglowania.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //A maj� racj�?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Do diaska to� to brednie. Jak tylko poczuj� pod nogami deski pok�adu, dam jeszcze popali� niejednemu m�okosowi!
};

///////////////////////////////////////////////////////////////////////
//	Info BanditenWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BANDITENWEG		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	7;
	condition	 = 	DIA_Jack_BANDITENWEG_Condition;
	information	 = 	DIA_Jack_BANDITENWEG_Info;

	description	 = 	"Nie musisz si� ju� martwi� o bandyt�w zajmuj�cych twoj� latarni�.";
};

func int DIA_Jack_BANDITENWEG_Condition ()
{
	if (Npc_IsDead(LeuchtturmBandit_1021))
		&& (Npc_IsDead(LeuchtturmBandit_1022))
		&& (Npc_IsDead(LeuchtturmBandit_1023))
		&& (MIS_Jack_KillLighthouseBandits == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Jack_BANDITENWEG_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Nie musisz si� ju� martwi� o bandyt�w zajmuj�cych twoj� latarni�.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Naprawd�? �wietnie! Nareszcie mog� wr�ci� do pracy!
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //Chod� ze mn� do latarni. Jest z niej wspania�y widok na morze.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Lighthouse");
	MIS_Jack_KillLighthouseBandits = LOG_SUCCESS;
	B_GivePlayerXP (XP_KillLighthouseBandits);
};

///////////////////////////////////////////////////////////////////////
//	Info LighthouseFree
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LIGHTHOUSEFREE		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	8;
	condition	 = 	DIA_Jack_LIGHTHOUSEFREE_Condition;
	information	 = 	DIA_Jack_LIGHTHOUSEFREE_Info;
	permanent	 = 	TRUE;


	description	 = 	"�adna latarnia.";
};

func int DIA_Jack_LIGHTHOUSEFREE_Condition ()
{
	if (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&&	(Npc_GetDistToWP(self,"LIGHTHOUSE")<3000) 
		&& (MIS_SCKnowsWayToIrdorath == FALSE) 
		{
				return TRUE;
		};
};

func void DIA_Jack_LIGHTHOUSEFREE_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //�adna latarnia.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Dzi�ki! Wdrap si� po schodach na g�r�, a zobaczysz widok jakich ma�o, ch�opcze. Czuj si� jak u siebie w domu.
};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

INSTANCE DIA_Jack_KAP3_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP3_EXIT_Condition;
	information	= DIA_Jack_KAP3_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************

INSTANCE DIA_Jack_KAP4_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP4_EXIT_Condition;
	information	= DIA_Jack_KAP4_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************

INSTANCE DIA_Jack_KAP5_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP5_EXIT_Condition;
	information	= DIA_Jack_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	51;
	condition	 = 	DIA_Jack_BEMYCAPTAIN_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Nie chcia�by� znowu wyp�yn�� w morze?";
};

func int DIA_Jack_BEMYCAPTAIN_Condition ()
{
	if (Kapitel == 5)
		&& (MIS_SCKnowsWayToIrdorath == TRUE)
		&& (MIS_Jack_KillLighthouseBandits == LOG_SUCCESS)
		&& (MIS_Jack_NewLighthouseOfficer == 0)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Nie chcia�by� znowu wyp�yn�� w morze?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Ch�opcze, odda�bym praw� d�o�, gdyby kto� zechcia� wzi�� mnie na pok�ad porz�dnej �ajby.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Ale w moim wieku nie mam ju� chyba o czym marzy�. A poza tym - kto by si� zaj�� moj� latarni�?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Mniejsza z tym. Tak si� tylko zastanawia�em.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Przyda mi si� taki do�wiadczony �eglarz jak ty.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Przyda mi si� taki do�wiadczony �eglarz jak ty.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //A niech mnie rekin! Co chcesz zrobi�, ch�opcze? Chyba nie przymierzasz si� do porwania kr�lewskiego okr�tu, co?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Kto wie?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //A to ci dopiero heca! Ale nie mog� tak po prostu zostawi� mojej latarni. Co z tym zrobimy, co?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Jack, stary �eglarz z portu, by�by dobrym kapitanem. Jednak najpierw musz� znale�� kogo�, kto popilnowa�by jego latarni morskiej."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Mniejsza z tym. Tak si� tylko zastanawia�em.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "A gdybym sprowadzi� tu kogo�...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //A gdybym sprowadzi� tu kogo�, kto zaj��by si� latarni� pod twoj� nieobecno��?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //Nieg�upi pomys�. Znam nawet odpowiedni� osob�.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Kowal Harad ma czeladnika imieniem Brian. Cz�sto z nim rozmawia�em.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Tylko jemu mog� powierzy� moj� latarni�. To sumienny ch�opak.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Porozmawiaj z nim. Mo�e nam si� poszcz�ci i zgodzi si� pom�c?
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Mniejsza z tym. Tak si� tylko zastanawia�em.
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN2		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	52;
	condition	 = 	DIA_Jack_BEMYCAPTAIN2_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN2_Info;

	description	 = 	"Co do Briana...";
};

func int DIA_Jack_BEMYCAPTAIN2_Condition ()
{
	if 	((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		|| 	((MIS_Jack_NewLighthouseOfficer == LOG_RUNNING)	&& 	(Npc_IsDead(Brian))))
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN2_Info ()
{
	if (Npc_IsDead(Brian))
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian nie �yje.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //O tak, �yjemy w paskudnych czasach. To by� dobry cz�owiek.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Od dzi� o twoj� latarni� b�dzie si� troszczy� Brian.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Mia�em nadziej�, �e to powiesz.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Potrzebujesz mnie jeszcze?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Zobaczmy, czy ten ch�opak do czego� si� nadaje.
			AI_StopProcessInfos (self);
			};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_BEMYCAPTAIN3		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	53;
	condition	 = 	DIA_Jack_BEMYCAPTAIN3_Condition;
	information	 = 	DIA_Jack_BEMYCAPTAIN3_Info;

	description	 = 	"Zosta� kapitanem mojego statku.";
};

func int DIA_Jack_BEMYCAPTAIN3_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& (SCGotCaptain == FALSE)
		&& (MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS)
		{
				return TRUE;
		};
};

func void DIA_Jack_BEMYCAPTAIN3_Info ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Zosta� kapitanem mojego statku.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Swego czasu przemierzy�em siedem m�rz, ch�opcze, ale jeszcze nigdy nie dowodzi�em okr�tem.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //Nie mam bladego poj�cia o nawigacji. B�dziesz musia� si� tym zaj��.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Zrobi� co w mojej mocy!
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Poka� mi tylko sw�j statek i za�og�. Wiesz chocia�, dok�d p�yniemy? Masz jak�� map�?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Czekaj na mnie na przystani. O reszt� si� nie martw.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Jak uwa�asz.
	AI_StopProcessInfos (self);
	SCGotCaptain = TRUE;
	JackIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine	(self,"WaitForShipCaptain");
	
	B_GivePlayerXP (XP_Captain_Success);        
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_LOSFAHREN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_LOSFAHREN_Condition;
	information	 = 	DIA_Jack_LOSFAHREN_Info;
	permanent	 = 	TRUE;

	description	 = 	"No, staruszku. Ruszajmy w drog�.";
};

func int DIA_Jack_LOSFAHREN_Condition ()
{
	if (JackIsCaptain == TRUE)
		&& (MIS_ReadyforChapter6 ==	FALSE)
		{
				return TRUE;
		};
};

func void DIA_Jack_LOSFAHREN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //No, staruszku. Ruszajmy w drog�.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Wszystko w najlepszym porz�dku. Masz t� map�?
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //Czeka nas niez�a przeprawa. Mam tylko nadziej�, �e dotrzemy na miejsce w jednym kawa�ku.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Na pewno masz wszystko, co trzeba? Nie b�dziemy zawraca�, je�li w po�owie drogi przypomnisz sobie o czym� wa�nym.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Je�li jeste� pewien, �e masz wszystko, id� do kajuty kapitana i walnij si� na koj�. Przyda ci si� troch� snu.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Powoli, ch�opcze. Nie pokaza�e� mi jeszcze swojej �ajby. Wszystko w swoim czasie.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Musisz mie� co najmniej 5 os�b w za�odze, swobodny dost�p do statku i map� morsk�. Inaczej nie mamy o czym m�wi�.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////

instance DIA_Jack_PERM5_NOTCAPTAIN		(C_INFO)
{
	npc		 = 	VLK_444_Jack;
	nr		 = 	59;
	condition	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Condition;
	information	 = 	DIA_Jack_PERM5_NOTCAPTAIN_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co zamierzasz robi� dalej?";
};

func int DIA_Jack_PERM5_NOTCAPTAIN_Condition ()
{
		if	((Npc_KnowsInfo(other, DIA_Jack_BEMYCAPTAIN2))
		&& 	(SCGotCaptain == TRUE)
		&&	(JackIsCaptain == FALSE))
		|| 	(MIS_Jack_NewLighthouseOfficer == LOG_OBSOLETE)
		{
				return TRUE;
		};
};

func void DIA_Jack_PERM5_NOTCAPTAIN_Info ()
{
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //Co zamierzasz robi� dalej?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Przemy�la�em sobie par� spraw. Chyba jednak zostan� w mojej latarni.
	
	AI_StopProcessInfos (self);
};

//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************


INSTANCE DIA_Jack_KAP6_EXIT(C_INFO)
{
	npc			= VLK_444_Jack;
	nr			= 999;
	condition	= DIA_Jack_KAP6_EXIT_Condition;
	information	= DIA_Jack_KAP6_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Jack_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)	
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jack_KAP6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};










































 





















