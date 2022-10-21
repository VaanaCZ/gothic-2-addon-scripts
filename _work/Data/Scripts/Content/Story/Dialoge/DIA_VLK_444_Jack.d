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
	AI_Output			(self ,other, "DIA_Jack_GREET_14_00"); //Ahoj, szczurze l¹dowy! Utkn¹³eœ tu na dobre, co?
	AI_Output			(self ,other, "DIA_Jack_GREET_14_01"); //He, he... Trochê blado wygl¹dasz.
	AI_Output			(self ,other, "DIA_Jack_GREET_14_02"); //Ale nie przejmuj siê, ch³opcze. Przyda ci siê trochê œwie¿ej, morskiej bryzy, ot i wszystko!
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
	AI_Output			(other, self, "DIA_Jack_Job_15_00"); //Czym siê tu zajmujesz?
	//AI_Output			(self, other, "DIA_Jack_Job_14_01"); //Dawno temu, kiedy by³em takim m³odzikiem jak ty, wyruszy³em w morze i ¿eglowa³em przez niejeden sztorm.
	//AI_Output			(self, other, "DIA_Jack_Job_14_02"); //Wiele lat temu osiad³em w Khorinis i zaj¹³em siê tutejsz¹ latarni¹.
	//AI_Output			(self, other, "DIA_Jack_Job_14_03"); //Gdzie tam, niby nic wielkiego... Ale tylko dziêki tej starej wie¿y mogê byæ blisko mojego prawdziwego domu.
	//AI_Output			(self, other, "DIA_Jack_Job_14_04"); //Nie by³em na górze od wieków...
	//AI_Output			(other, self, "DIA_Jack_Job_15_05"); //Dlaczego?
	AI_Output			(self ,other, "DIA_Jack_Job_14_06"); //Odk¹d te ³otry zajê³y moj¹ latarniê, ba³em siê do niej zbli¿yæ na dwadzieœcia kroków. Banda ³ajdaków.
	AI_Output			(self ,other, "DIA_Jack_Job_14_07"); //Wiesz, to ci bandyci z Górniczej Doliny.
	AI_Output			(self ,other, "DIA_Jack_Job_14_08"); //Najpierw po drugiej stronie gór by³ wielki huk, a potem ca³a ta zgraja zwali³a siê do miasta jak plaga szarañczy. Teraz kryj¹ siê, gdzie popadnie - nawet w mojej latarni.
	AI_Output			(self ,other, "DIA_Jack_Job_14_09"); //Myœlê, ¿e wypatruj¹ jakiegoœ statku, który mogliby zaj¹æ.
	AI_Output			(self ,other, "DIA_Jack_Job_14_10"); //I niech sobie zajmuj¹! Byle tylko wynieœli siê z mojej wie¿y.
	
	Log_CreateTopic (TOPIC_KillLighthouseBandits, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillLighthouseBandits, LOG_RUNNING);
	B_LogEntry (TOPIC_KillLighthouseBandits,"Stary marynarz, Jack, nie mo¿e wróciæ do latarni morskiej, dopóki przebywaj¹ tam bandyci."); 
	
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

	description	 = 	"Czêsto odwiedzasz miasto?";
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
	AI_Output			(other, self, "DIA_Jack_City_15_00"); //Czêsto odwiedzasz miasto?
	AI_Output			(self ,other, "DIA_Jack_City_14_01"); //Miasto jest tylko tak dobre, jak jego przystañ. Zawsze to mówiê.
	AI_Output			(self ,other, "DIA_Jack_City_14_02"); //Przystañ jest oknem na œwiat. To tutaj spotykaj¹ siê ludzie. Tutaj wszystko siê zaczyna.
	AI_Output			(self ,other, "DIA_Jack_City_14_03"); //Gdy przystañ schodzi na psy, miasto wkrótce pod¹¿y jej œladem.
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
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_01"); //Przystañ w Khorinis to ju¿ nie to samo co kiedyœ.
	AI_Output			(self ,other, "DIA_Jack_Harbor_14_02"); //Zosta³y tu same szumowiny, statki przesta³y przyp³ywaæ, nie ma handlu. Ta przystañ to ju¿ stara historia.
	
	Info_ClearChoices (DIA_Jack_Harbor);
	Info_AddChoice (DIA_Jack_Harbor,DIALOG_BACK,DIA_Jack_Harbor_Back);
	Info_AddChoice (DIA_Jack_Harbor,"Dlaczego statki przesta³y tu przyp³ywaæ?",DIA_Jack_Harbor_Ships);
	Info_AddChoice (DIA_Jack_Harbor,"Co masz na myœli, mówi¹c 'szumowiny'?",DIA_Jack_Harbor_Rogue);
	Info_AddChoice (DIA_Jack_Harbor,"Wiêc dlaczego st¹d nie odp³yniesz?",DIA_Jack_Harbor_Leave);
};

FUNC VOID DIA_Jack_Harbor_Back ()
{
	Info_ClearChoices (DIA_Jack_Harbor);
};

FUNC VOID DIA_Jack_Harbor_Ships ()
{	
	AI_Output (other,self ,"DIA_Jack_Harbor_Ships_15_00"); //Dlaczego statki przesta³y tu przyp³ywaæ?
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_01"); //Mówi¹, ¿e jak skoñczy siê wojna, wszystko bêdzie po staremu, ale to bzdury.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_02"); //Uwierz mi - marynarz zawsze wie, kiedy miasto schodzi na psy.
	AI_Output (self ,other,"DIA_Jack_Harbor_Ships_14_03"); //Czuje to we krwi. A powiadam - ta przystañ jest ju¿ stracona. Nigdy nie wróci do dawnej œwietnoœci.
};

FUNC VOID DIA_Jack_Harbor_Rogue ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Rogue_15_00"); //Co masz na myœli, mówi¹c 'szumowiny'?
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_01"); //Popatrz tylko na nich: leniwe obwiesie! Wiêkszoœæ z nich nie wie, co to uczciwa praca. Ca³ymi dniami nic tylko ¿³opi¹ piwsko i puszczaj¹ ostatnie pieni¹dze w burdelu.
	AI_Output (self ,other,"DIA_Jack_Harbor_Rogue_14_02"); //Dobrze ci radzê - trzymaj siê od nich z dala!
};

FUNC VOID DIA_Jack_Harbor_Leave ()
{
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_00"); //Wiêc dlaczego st¹d nie odp³yniesz?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_01"); //A kto by przyj¹³ na pok³ad takiego starego wilka jak ja?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_02"); //Ludzie myœl¹, ¿e Stary Jack nie nadaje siê ju¿ do ¿eglowania.
	AI_Output (other,self ,"DIA_Jack_Harbor_Leave_15_03"); //A maj¹ racjê?
	AI_Output (self ,other,"DIA_Jack_Harbor_Leave_14_04"); //Do diaska to¿ to brednie. Jak tylko poczujê pod nogami deski pok³adu, dam jeszcze popaliæ niejednemu m³okosowi!
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

	description	 = 	"Nie musisz siê ju¿ martwiæ o bandytów zajmuj¹cych twoj¹ latarniê.";
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
	AI_Output			(other, self, "DIA_Jack_BANDITENWEG_15_00"); //Nie musisz siê ju¿ martwiæ o bandytów zajmuj¹cych twoj¹ latarniê.
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_01"); //Naprawdê? Œwietnie! Nareszcie mogê wróciæ do pracy!
	AI_Output			(self, other, "DIA_Jack_BANDITENWEG_14_02"); //ChodŸ ze mn¹ do latarni. Jest z niej wspania³y widok na morze.
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


	description	 = 	"£adna latarnia.";
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
	AI_Output			(other, self, "DIA_Jack_LIGHTHOUSEFREE_15_00"); //£adna latarnia.
	AI_Output			(self, other, "DIA_Jack_LIGHTHOUSEFREE_14_01"); //Dziêki! Wdrap siê po schodach na górê, a zobaczysz widok jakich ma³o, ch³opcze. Czuj siê jak u siebie w domu.
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

	description	 = 	"Nie chcia³byœ znowu wyp³yn¹æ w morze?";
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
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_15_00"); //Nie chcia³byœ znowu wyp³yn¹æ w morze?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_01"); //Ch³opcze, odda³bym praw¹ d³oñ, gdyby ktoœ zechcia³ wzi¹æ mnie na pok³ad porz¹dnej ³ajby.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_14_02"); //Ale w moim wieku nie mam ju¿ chyba o czym marzyæ. A poza tym - kto by siê zaj¹³ moj¹ latarni¹?

	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Mniejsza z tym. Tak siê tylko zastanawia³em.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Przyda mi siê taki doœwiadczony ¿eglarz jak ty.", DIA_Jack_BEMYCAPTAIN_seaman );

};

func void DIA_Jack_BEMYCAPTAIN_seaman ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_00"); //Przyda mi siê taki doœwiadczony ¿eglarz jak ty.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_01"); //A niech mnie rekin! Co chcesz zrobiæ, ch³opcze? Chyba nie przymierzasz siê do porwania królewskiego okrêtu, co?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_15_02"); //Kto wie?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_14_03"); //A to ci dopiero heca! Ale nie mogê tak po prostu zostawiæ mojej latarni. Co z tym zrobimy, co?
	
	Log_CreateTopic (TOPIC_Captain, LOG_MISSION);                                                                                                                        
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);                                                                                                                      
	B_LogEntry (TOPIC_Captain,"Jack, stary ¿eglarz z portu, by³by dobrym kapitanem. Jednak najpierw muszê znaleŸæ kogoœ, kto popilnowa³by jego latarni morskiej."); 
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "Mniejsza z tym. Tak siê tylko zastanawia³em.", DIA_Jack_BEMYCAPTAIN_no );
	Info_AddChoice	(DIA_Jack_BEMYCAPTAIN, "A gdybym sprowadzi³ tu kogoœ...?", DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer );

};
func void DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00"); //A gdybym sprowadzi³ tu kogoœ, kto zaj¹³by siê latarni¹ pod twoj¹ nieobecnoœæ?
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01"); //Nieg³upi pomys³. Znam nawet odpowiedni¹ osobê.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02"); //Kowal Harad ma czeladnika imieniem Brian. Czêsto z nim rozmawia³em.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03"); //Tylko jemu mogê powierzyæ moj¹ latarniê. To sumienny ch³opak.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04"); //Porozmawiaj z nim. Mo¿e nam siê poszczêœci i zgodzi siê pomóc?
	
	Info_ClearChoices	(DIA_Jack_BEMYCAPTAIN);
	MIS_Jack_NewLighthouseOfficer = LOG_RUNNING;
};


func void DIA_Jack_BEMYCAPTAIN_no ()
{
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN_no_15_00"); //Mniejsza z tym. Tak siê tylko zastanawia³em.
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
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_00"); //Brian nie ¿yje.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_01"); //O tak, ¿yjemy w paskudnych czasach. To by³ dobry cz³owiek.
			MIS_Jack_NewLighthouseOfficer = LOG_OBSOLETE;
	}
	else
	{
			AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN2_15_02"); //Od dziœ o twoj¹ latarniê bêdzie siê troszczy³ Brian.
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_03"); //Mia³em nadziejê, ¿e to powiesz.
			B_GivePlayerXP (XP_Jack_NewLighthouseOfficer);
 
		
			if (SCGotCaptain == FALSE)
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_04"); //Potrzebujesz mnie jeszcze?
			}
			else
			{
			AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN2_14_05"); //Zobaczmy, czy ten ch³opak do czegoœ siê nadaje.
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

	description	 = 	"Zostañ kapitanem mojego statku.";
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
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_00"); //Zostañ kapitanem mojego statku.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_01"); //Swego czasu przemierzy³em siedem mórz, ch³opcze, ale jeszcze nigdy nie dowodzi³em okrêtem.
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_02"); //Nie mam bladego pojêcia o nawigacji. Bêdziesz musia³ siê tym zaj¹æ.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_03"); //Zrobiê co w mojej mocy!
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_04"); //Poka¿ mi tylko swój statek i za³ogê. Wiesz chocia¿, dok¹d p³yniemy? Masz jak¹œ mapê?
	AI_Output			(other, self, "DIA_Jack_BEMYCAPTAIN3_15_05"); //Czekaj na mnie na przystani. O resztê siê nie martw.
	AI_Output			(self, other, "DIA_Jack_BEMYCAPTAIN3_14_06"); //Jak uwa¿asz.
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

	description	 = 	"No, staruszku. Ruszajmy w drogê.";
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
	AI_Output			(other, self, "DIA_Jack_LOSFAHREN_15_00"); //No, staruszku. Ruszajmy w drogê.

	if ((B_CaptainConditions (self)) == TRUE)
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_01"); //Wszystko w najlepszym porz¹dku. Masz tê mapê?
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_02"); //Czeka nas niez³a przeprawa. Mam tylko nadziejê, ¿e dotrzemy na miejsce w jednym kawa³ku.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_03"); //Na pewno masz wszystko, co trzeba? Nie bêdziemy zawracaæ, jeœli w po³owie drogi przypomnisz sobie o czymœ wa¿nym.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_04"); //Jeœli jesteœ pewien, ¿e masz wszystko, idŸ do kajuty kapitana i walnij siê na kojê. Przyda ci siê trochê snu.
		AI_StopProcessInfos (self);
		B_CaptainCallsAllOnBoard (self);
	}
	else
	{
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_05"); //Powoli, ch³opcze. Nie pokaza³eœ mi jeszcze swojej ³ajby. Wszystko w swoim czasie.
		AI_Output			(self, other, "DIA_Jack_LOSFAHREN_14_06"); //Musisz mieæ co najmniej 5 osób w za³odze, swobodny dostêp do statku i mapê morsk¹. Inaczej nie mamy o czym mówiæ.
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

	description	 = 	"Co zamierzasz robiæ dalej?";
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
	AI_Output			(other, self, "DIA_Jack_PERM5_NOTCAPTAIN_15_00"); //Co zamierzasz robiæ dalej?
	AI_Output			(self, other, "DIA_Jack_PERM5_NOTCAPTAIN_14_01"); //Przemyœla³em sobie parê spraw. Chyba jednak zostanê w mojej latarni.
	
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










































 





















