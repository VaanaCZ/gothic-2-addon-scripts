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
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Ahoj, szczurze lądowy! Utknąłeś tu na dobre, co?
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //He, he... Trochę blado wyglądasz.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Ale nie przejmuj się, chłopcze. Przyda ci się trochę świeżej, morskiej bryzy, ot i wszystko!
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
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Czym się tu zajmujesz?
	//AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Dawno temu, kiedy byłem takim młodzikiem jak ty, wyruszyłem w morze i żeglowałem przez niejeden sztorm.
	//AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Wiele lat temu osiadłem w Khorinis i zająłem się tutejszą latarnią.
	//AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Gdzie tam, niby nic wielkiego... Ale tylko dzięki tej starej wieży mogę być blisko mojego prawdziwego domu.
	//AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Nie byłem na górze od wieków...
	//AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Dlaczego?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Odkąd te łotry zajęły moją latarnię, bałem się do niej zbliżyć na dwadzieścia kroków. Banda łajdaków.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Wiesz, to ci bandyci z Górniczej Doliny.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Najpierw po drugiej stronie gór był wielki huk, a potem cała ta zgraja zwaliła się do miasta jak plaga szarańczy. Teraz kryją się, gdzie popadnie - nawet w mojej latarni.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //Myślę, że wypatrują jakiegoś statku, który mogliby zająć.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //I niech sobie zajmują! Byle tylko wynieśli się z mojej wieży.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Stary marynarz, Jack, nie może wrócić do latarni morskiej, dopóki przebywają tam bandyci."); 
	
	MIS_Jack_KillLighthouseBandits = LOG_RUNNING;
	
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_City		(C_INFO)
{
	npc			 = 	VLK_444_Jack;
	nr			 = 	6;
	condition	 = 	DIA_Jack_City_Condition;
	information	 = 	DIA_Jack_City_Info;

	description	 = 	"Często odwiedzasz miasto?";
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
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Często odwiedzasz miasto?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Miasto jest tylko tak dobre, jak jego przystań. Zawsze to mówię.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Przystań jest oknem na świat. To tutaj spotykają się ludzie. Tutaj wszystko się zaczyna.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Gdy przystań schodzi na psy, miasto wkrótce podąży jej śladem.
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über den Hafen
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
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Przystań w Khorinis to już nie to samo co kiedyś.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Zostały tu same szumowiny, statki przestały przypływać, nie ma handlu. Ta przystań to już stara historia.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Dlaczego statki przestały tu przypływać?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Co masz na myśli, mówiąc 'szumowiny'?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Więc dlaczego stąd nie odpłyniesz?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Dlaczego statki przestały tu przypływać?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Mówią, że jak skończy się wojna, wszystko będzie po staremu, ale to bzdury.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Uwierz mi - marynarz zawsze wie, kiedy miasto schodzi na psy.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Czuje to we krwi. A powiadam - ta przystań jest już stracona. Nigdy nie wróci do dawnej świetności.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Co masz na myśli, mówiąc 'szumowiny'?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Popatrz tylko na nich: leniwe obwiesie! Większość z nich nie wie, co to uczciwa praca. Całymi dniami nic tylko żłopią piwsko i puszczają ostatnie pieniądze w burdelu.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Dobrze ci radzę - trzymaj się od nich z dala!
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Więc dlaczego stąd nie odpłyniesz?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //A kto by przyjął na pokład takiego starego wilka jak ja?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //Ludzie myślą, że Stary Jack nie nadaje się już do żeglowania.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //A mają rację?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Do diaska toż to brednie. Jak tylko poczuję pod nogami deski pokładu, dam jeszcze popalić niejednemu młokosowi!
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

	description	 = 	"Nie musisz się już martwić o bandytów zajmujących twoją latarnię.";
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
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Nie musisz się już martwić o bandytów zajmujących twoją latarnię.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Naprawdę? Świetnie! Nareszcie mogę wrócić do pracy!
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //Chodź ze mną do latarni. Jest z niej wspaniały widok na morze.
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


	description	 = 	"Ładna latarnia.";
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
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //Ładna latarnia.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Dzięki! Wdrap się po schodach na górę, a zobaczysz widok jakich mało, chłopcze. Czuj się jak u siebie w domu.
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

	description	 = 	"Nie chciałbyś znowu wypłynąć w morze?";
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
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Nie chciałbyś znowu wypłynąć w morze?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Chłopcze, oddałbym prawą dłoń, gdyby ktoś zechciał wziąć mnie na pokład porządnej łajby.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Ale w moim wieku nie mam już chyba o czym marzyć. A poza tym - kto by się zajął moją latarnią?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Mniejsza z tym. Tak się tylko zastanawiałem.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Przyda mi się taki doświadczony żeglarz jak ty.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Przyda mi się taki doświadczony żeglarz jak ty.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //A niech mnie rekin! Co chcesz zrobić, chłopcze? Chyba nie przymierzasz się do porwania królewskiego okrętu, co?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Kto wie?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //A to ci dopiero heca! Ale nie mogę tak po prostu zostawić mojej latarni. Co z tym zrobimy, co?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Jack, stary żeglarz z portu, byłby dobrym kapitanem. Jednak najpierw muszę znaleźć kogoś, kto popilnowałby jego latarni morskiej."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Mniejsza z tym. Tak się tylko zastanawiałem.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "A gdybym sprowadził tu kogoś...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //A gdybym sprowadził tu kogoś, kto zająłby się latarnią pod twoją nieobecność?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //Niegłupi pomysł. Znam nawet odpowiednią osobę.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Kowal Harad ma czeladnika imieniem Brian. Często z nim rozmawiałem.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Tylko jemu mogę powierzyć moją latarnię. To sumienny chłopak.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Porozmawiaj z nim. Może nam się poszczęści i zgodzi się pomóc?
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Mniejsza z tym. Tak się tylko zastanawiałem.
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
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian nie żyje.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //O tak, żyjemy w paskudnych czasach. To był dobry człowiek.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Od dziś o twoją latarnię będzie się troszczył Brian.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Miałem nadzieję, że to powiesz.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Potrzebujesz mnie jeszcze?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Zobaczmy, czy ten chłopak do czegoś się nadaje.
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

	description	 = 	"Zostań kapitanem mojego statku.";
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
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Zostań kapitanem mojego statku.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Swego czasu przemierzyłem siedem mórz, chłopcze, ale jeszcze nigdy nie dowodziłem okrętem.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //Nie mam bladego pojęcia o nawigacji. Będziesz musiał się tym zająć.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Zrobię co w mojej mocy!
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Pokaż mi tylko swój statek i załogę. Wiesz chociaż, dokąd płyniemy? Masz jakąś mapę?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Czekaj na mnie na przystani. O resztę się nie martw.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Jak uważasz.
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

	description	 = 	"No, staruszku. Ruszajmy w drogę.";
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
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //No, staruszku. Ruszajmy w drogę.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Wszystko w najlepszym porządku. Masz tę mapę?
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //Czeka nas niezła przeprawa. Mam tylko nadzieję, że dotrzemy na miejsce w jednym kawałku.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Na pewno masz wszystko, co trzeba? Nie będziemy zawracać, jeśli w połowie drogi przypomnisz sobie o czymś ważnym.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Jeśli jesteś pewien, że masz wszystko, idź do kajuty kapitana i walnij się na koję. Przyda ci się trochę snu.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Powoli, chłopcze. Nie pokazałeś mi jeszcze swojej łajby. Wszystko w swoim czasie.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Musisz mieć co najmniej 5 osób w załodze, swobodny dostęp do statku i mapę morską. Inaczej nie mamy o czym mówić.
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

	description	 = 	"Co zamierzasz robić dalej?";
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
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //Co zamierzasz robić dalej?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Przemyślałem sobie parę spraw. Chyba jednak zostanę w mojej latarni.
	
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










































 





















