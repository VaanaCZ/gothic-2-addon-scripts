// ***********************************************************
// 							EXIT
// ***********************************************************
INSTANCE DIA_Bosper_EXIT   (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 999;
	condition   = DIA_Bosper_EXIT_Condition;
	information = DIA_Bosper_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr			 =  2;
	condition	 = 	DIA_Bosper_HALLO_Condition;
	information	 = 	DIA_Bosper_HALLO_Info;
	permanent    =  FALSE;
	important    =  TRUE;
};
func int DIA_Bosper_HALLO_Condition ()
{	
	if Npc_IsInState (self, ZS_Talk)
	{
		return TRUE;
	};
};
func void DIA_Bosper_HALLO_Info ()
{
	AI_Output (self, other, "DIA_Bosper_HALLO_11_00"); //V�tej v m�m obchod�, cizin�e.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_01"); //Jmenuji se Bosper. Vyr�b�m luky a obchoduji s ko�e�inami.
	AI_Output (self, other, "DIA_Bosper_HALLO_11_02"); //Co t� p�iv�d� do Khorinidu?
	
	Log_CreateTopic	(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry (TOPIC_CityTrader,"Bosper vyr�b� luky a obchoduje s k��emi. Jeho obchod najdu v doln� ��sti m�sta, u v�chodn� br�ny.");
};

// ***********************************************************
// 						 	IntoOV		//e1
// ***********************************************************
instance DIA_Bosper_IntoOV		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 1;
	condition	= DIA_Bosper_IntoOV_Condition;
	information = DIA_Bosper_IntoOV_Info;
	permanent   = FALSE;
	description = "Mus�m se dostat do horn� �tvrti...";
};
func int DIA_Bosper_IntoOV_Condition ()
{	
	if (hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};	
};
func void DIA_Bosper_IntoOV_Info ()
{
	AI_Output (other, self, "DIA_Bosper_IntoOV_15_00"); //Mus�m se dostat do horn� �tvrti.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_01"); //Tam, kde s�dl� paladinov�? Tak na to rovnou zapome�.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_02"); //Nejd��v se mus� st�t ctihodn�m m욝anem, nebo si aspo� naj�t slu�n� zam�stn�n�.
	AI_Output (self, other, "DIA_Bosper_IntoOV_11_03"); //Jako cizinec se tam rozhodn� dostat nem��e�.
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Bosper_IntoOV_15_04"); //To jsem taky zjistil.
	};

	Log_CreateTopic (TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus	(TOPIC_OV,LOG_RUNNING);
	B_LogEntry (TOPIC_OV,"Pokud se chci dostat do horn� �tvrti, mus�m se st�t bu�to v�en�m ob�anem, nebo si naj�t pr�ci.");
};

// ***********************************************************
// 						 	SeekWork	//e1
// ***********************************************************
instance DIA_Bosper_SeekWork		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_SeekWork_Condition;
	information = DIA_Bosper_SeekWork_Info;
	permanent   = FALSE;
	description = "Hled�m pr�ci.";
};
func int DIA_Bosper_SeekWork_Condition ()
{	
	return TRUE;
};
func void DIA_Bosper_SeekWork_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SeekWork_15_00"); //Hled�m pr�ci!
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_01"); //Hmm - nov� u�edn�k by se mi hodil.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_02"); //Ten posledn� to vzdal zrovna p�edev��rem.
	AI_Output (self, other, "DIA_Bosper_SeekWork_11_03"); //V� aspo� n�co o lovu?
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_04"); //Noooo...
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_05"); //M��u t� nau�it, jak stahovat zv��ata.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_06"); //Za ka�dou k��i, kterou mi p�inese�, ti dob�e zaplat�m.
	}
	else
	{
		AI_Output (other, self, "DIA_Bosper_SeekWork_15_07"); //M��u ti d�t p�r k���, jestli o n� m� z�jem.
		AI_Output (self, other, "DIA_Bosper_SeekWork_11_08"); //V�born�! P�ines mi tolik zv��ec�ch k��i, kolik m��e� - koup�m je od tebe za dobrou cenu.
	};
	
  B_LogEntry (TOPIC_Lehrling,"Bosper hled� nov�ho u�edn�ka - mohl bych u n�j za��t pracovat.");	
 
};

// ***********************************************************
// 						 	LEHRLING	//e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------

instance DIA_Bosper_LEHRLING		(C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_LEHRLING_Condition;
	information = DIA_Bosper_LEHRLING_Info;
	permanent   = TRUE;
	description = "Chci se st�t tv�m u�edn�kem!";
};
func int DIA_Bosper_LEHRLING_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_LEHRLING_Info ()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self, "DIA_Bosper_LEHRLING_15_00"); //Chci se st�t tv�m u�edn�kem!

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_01"); //(zak�en� se) Skv�l�! �ekl bych, �e z�klady u� m�.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_02"); //Harad si mysl�, �e jsi dobr� �lov�k.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_03"); //Ale Harad nen� o tv�ch schopnostech zrovna p�esv�d�en.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_04"); //Ale Harad t� pr� je�t� v�bec nevid�l.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_05"); //Thorben ti dal sv�j hlas. J� sice nejsem tak pobo�n�, ale v��m si toho.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_06"); //Thorben ti d� svolen� jen tehdy, pokud si vypros� po�ehn�n� do boh�.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_07"); //Thorben nem� pon�t�, kdo jsi.
		};
		
		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_08"); //Constantino prohla�uje, �e se m��e� zapsat, u koho chce�.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_09"); //Constantino prohla�uje, �es byl obvin�n ze zlo�inu - douf�m, �e �lo jen o n�jakou banalitu.
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_10"); //Sna� se to co nejd��v urovnat.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_11"); //Constantino o tob� je�t� ani nesly�el.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_12"); //A Matteo se nechal sly�et, �e by t� m�li vyva�ovat zlatem.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_13"); //A Matteo se zm�nil o n�jak� p�j�ce - a� u� t�m myslel cokoliv, m�l by sis s n�m rad�i promluvit.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_14"); //Matteo tvrd�, �e s tebou o t�hle v�ci zat�m nemluvil.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_15"); //Matteo tvrd�, �e t� nikdy v �ivot� nevid�l.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_16"); //To znamen�, �es z�skal doporu�en� ode v�ech mistr�!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Bosper_LEHRLING_11_17"); //Nyn� t� doporu�uj� �ty�i mist�i - to posta��, abys mohl k n�komu vstoupit do u�en�.
			};
			
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_18"); //M��e� pro m� za��t pracovat, kdykoliv bude� cht�t.
			
			Info_ClearChoices (DIA_Bosper_LEHRLING);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Dob�e - rozmysl�m si to.", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice (DIA_Bosper_LEHRLING, "Jdu do toho!", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_19"); //Chce�-li k n�komu v doln� ��sti m�sta vstoupit do u�en�, pot�ebuje� souhlas alespo� �ty� mistr�.
			AI_Output (self, other,"DIA_Bosper_LEHRLING_11_20"); //Tak�e by sis m�l promluvit se v�emi, kte�� ti zat�m souhlas nedali.
		};
	}
	else //keine WolfFurs
	{
		AI_Output (self, other, "DIA_Bosper_LEHRLING_11_21"); //Je�t� ne� t� p�ijmu, mus�m samoz�ejm� v�d�t, jestli jsi aspo� k n��emu dobr�.
		
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_LEHRLING_11_22"); //Vr�til jsi mi m�j luk, ale to o tv�m loveck�m talentu moc nevypov�d�.
		};
		Bosper_HintToJob = TRUE;
	};	
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //Jdu do toho!
	AI_Output (self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //Nebude� toho litovat! Mysl�m, �e se n�m bude dob�e spolupracovat.
	
	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Bosper_StartGuild = other.guild;
	
	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("gritta", GIL_NONE);	// = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Bosper m� p�ijal za u�edn�ka. Nyn� m�m p��stup do horn� �tvrti.");
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output (other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //Dob�e - rozmysl�m si to.
	AI_Output (self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //Jen se nerozhodni �patn�! Byl bys pro m� �pln� ide�ln�.
	
	Info_ClearChoices (DIA_Bosper_LEHRLING);
};
		
			
// ***********************************************************
// 						OtherMasters	 	//e2
// ***********************************************************
instance DIA_Bosper_OtherMasters (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_OtherMasters_Condition;
	information = DIA_Bosper_OtherMasters_Info;
	permanent   = FALSE;
	description = "Co kdy� se budu cht�t zapsat u n�kter�ho z ostatn�ch mistr�?";
};
func int DIA_Bosper_OtherMasters_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_OtherMasters_Info ()
{
	AI_Output (other, self, "DIA_Bosper_OtherMasters_15_00"); //Co kdy� se budu cht�t zapsat u n�kter�ho z ostatn�ch mistr�?
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_01"); //(mrzut�) Nesmysl!
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_02"); //Harad a Matteo u� u�edn�ky maj�.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_03"); //Alchymista Constantino je star� samot�� - ten ��dn�ho u�edn�ka nep�ijal u� cel� roky.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_04"); //A co se t��e Thorbena, tak o n�m ka�d� v�, �e je �pln� �vorc - nejsp� by ti nemohl zaplatit ani m���k.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_05"); //Ov�em j� velmi nutn� pot�ebuji u�edn�ka - a taky dob�e plat�m.
	AI_Output (self, other, "DIA_Bosper_OtherMasters_11_06"); //Ale a� u� se chce� zapsat u kohokoliv, bude� k tomu pot�ebovat souhlas v�ech ostatn�ch mistr� z doln� ��sti m�sta.
	
	
	
};

// ***********************************************************
// 							Bartok	 	//e2
// ***********************************************************
instance DIA_Bosper_Bartok (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 4;
	condition	= DIA_Bosper_Bartok_Condition;
	information = DIA_Bosper_Bartok_Info;
	permanent   = FALSE;
	description = "Pro� to tv�j minul� u�edn�k vzdal?";
};
func int DIA_Bosper_Bartok_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};
func void DIA_Bosper_Bartok_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Bartok_15_00"); //Pro� to tv�j minul� u�edn�k vzdal?
	AI_Output (self, other, "DIA_Bosper_Bartok_11_01"); //Nechal se sly�et, �e je tu posledn� dobou p��li� nebezpe�no.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_02"); //Jestli t� to ale opravdu zaj�m�, m��e� se ho zeptat s�m.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_03"); //Jmenuje se Bartok a nejsp� se bude potloukat kolem Coragonovy kr�my.
	AI_Output (self, other, "DIA_Bosper_Bartok_11_04"); //Kdy� z kov�rny vyjde� podchodem, ocitne� se skoro p��mo p�ed hospodou.
};

// ***********************************************************
// 						ZUSTIMMUNG		 	//e3   PERM
// ***********************************************************

instance DIA_Bosper_ZUSTIMMUNG (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_ZUSTIMMUNG_Condition;
	information = DIA_Bosper_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "D� mi sv�j souhlas, abych se mohl zapsat u jin�ho mistra?";
};
func int DIA_Bosper_ZUSTIMMUNG_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info ()
{
	AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //D� mi sv�j souhlas, abych se mohl zapsat u jin�ho mistra?
	if (MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //(zklaman�) Doufal jsem, �e se rozhodne� pro m�.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //Ale kdy� to chce� takhle...
		AI_Output (other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //T�m mi chce� nazna�it, �e m� nedoporu��?
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //Kdy� ostatn� mist�i nebudou proti, pak ano.
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //Kdy� u� nic jin�ho, aspo� jsi mi vr�til luk.
		};
		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //Ale ur�it� by z tebe byl dobr� lovec.
		};
		if Bosper_Zustimmung_Once == FALSE
		{
			B_GivePlayerXP (XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};	
		B_LogEntry (Topic_Lehrling,"Bosper mi d� doporu�en�, kdy� se budu cht�t st�t u�edn�kem u n�koho jin�ho.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //(povzdychne si) No dob�e! P�imluv�m se za tebe - ale s jednou podm�nkou.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //Pracuj pro m�, alespo� chv�li.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //Tak zjist�, jestli se ti moje �emeslo zamlouv�, nebo ne.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //A kdo v� - mo�n� se ti zal�b� natolik, �e z�stane� u m�.
		AI_Output (self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //A kdy� jsi dost dobr�, abych t� p�ijal J�, ur�it� si povede� dob�e i u ostatn�ch.
		Bosper_HintToJob = TRUE;
	};	
};

// ***********************************************************
// 							Job		 	//e3
// ***********************************************************
instance DIA_Bosper_Job (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_Job_Condition;
	information = DIA_Bosper_Job_Info;
	permanent   = FALSE;
	description = "Co m�m pro tebe ud�lat?";
};
func int DIA_Bosper_Job_Condition ()
{	
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Job_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Job_15_00"); //Co m�m pro tebe ud�lat?

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_01"); //Nau��m t�, jak stahovat k��i ze zv��at, a ty mi pak p�inese�, �ekn�me, p�l tuctu vl��ch k���.
		
		Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
		B_LogEntry	(TOPIC_CityTeacher,"Bosper m� nau�� stahovat zv��ec� k��e.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_02"); //P�ines mi p�l tuctu vl��ch k���.
	};
	
	AI_Output (self, other, "DIA_Bosper_Job_11_03"); //Tak pozn�m, �e ses sv� �emeslo nau�il.
	AI_Output (self, other, "DIA_Bosper_Job_11_04"); //Pokud ti to nepotrv� v��nost a jestli ty k��e budou ve slu�n�m stavu, p�ijmu t�, kdy� bude� cht�t.
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output (self, other, "DIA_Bosper_Job_11_05"); //Nebo (povzdech) m��e� za��t u n�kter�ho z ostatn�ch mistr� - bude�-li si to opravdu p��t.
	};
	
	MIS_Bosper_WolfFurs = LOG_RUNNING;
	
	Log_CreateTopic(TOPIC_BosperWolf,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperWolf,LOG_RUNNING);
	B_LogEntry (TOPIC_BosperWolf,"Mus�m Bosperovi p�in�st �est vl��ch k��� - pak pro n�j budu moci pracovat, nebo m� doporu�� do u�en� u jin�ho mistra.");
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry (TOPIC_BosperWolf,"M�l bych ho p�im�t, aby m� nau�il stahovat zv��ec� k��e.");
	};
};

// ***********************************************************
// 					Ich hab deine Felle	 	//e4
// ***********************************************************
instance DIA_Bosper_BringFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 102;
	condition	= DIA_Bosper_BringFur_Condition;
	information = DIA_Bosper_BringFur_Info;
	permanent   = TRUE;
	description = "Co se t��e t�ch vl��ch k���...";
};
func int DIA_Bosper_BringFur_Condition ()
{	
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BringFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BringFur_15_00"); //Co se t��e t�ch vl��ch k���...
	
	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_01"); //U� jsi vstoupil do u�en� k jin�mu mistrovi. K��e od tebe proto odkoup�m za b�nou cenu.
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};
	
	if (B_GiveInvItems (other, self, ItAt_WolfFur, 6))		
	{
		AI_Output (other, self, "DIA_Bosper_BringFur_15_02"); //M�m je - tady.
		AI_Output (self, other, "DIA_Bosper_BringFur_11_03"); //Skv�l�! J� v�d�l, �e se pro tuhle pr�ci hod�!
		AI_Output (self, other, "DIA_Bosper_BringFur_11_04"); //Tady m� pen�ze, jak jsem ti sl�bil.
		B_GiveInvItems (self, other, itmi_gold, (Value_WolfFur * 6));
		AI_Output (self, other, "DIA_Bosper_BringFur_11_05"); //No a? Co si mysl�? Nen� to lep�� pr�ce ne� cel� dny ml�tit do kovadliny nebo se v nev�tran�m kutlochu patlat s n�jak�mi lahvi�kami?
		
		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry (Topic_Lehrling,"Bosper m� p�ijme do u�en�, pokud s t�m budou souhlasit i ostatn� z mistr�.");
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_BringFur_11_06"); //Dohodli jsme se na p�ltuctu - je�t� m� ale �as. Pokra�uj a opat�i mi ty k��e.
	};

};

// ***********************************************************
// 							TeachFUR		 	//e4
// ***********************************************************
instance DIA_Bosper_TeachFUR (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 2;
	condition	= DIA_Bosper_TeachFUR_Condition;
	information = DIA_Bosper_TeachFUR_Info;
	permanent   = TRUE;
	description = "Vysv�tli mi, jak stahovat zv��ata z k��e!";
};
func int DIA_Bosper_TeachFUR_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Bosper_TeachFUR_Info ()
{
	AI_Output (other, self, "DIA_Bosper_TeachFUR_15_00"); //Vysv�tli mi, jak stahovat zv��ata z k��e!

	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur))
	{
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_01"); //No tak poslouchej, je to jednoduch�, opravdu.
		AI_Output (self, other, "DIA_Bosper_TeachFUR_11_02"); //Sta�� vz�t ostr� n�� a roz��znout zv��eti b�icho. Pak po stran�ch trochu na��zni k��i na nohou a m��e� celou ko�e�inu sm�le st�hnout.
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output (self, other, "DIA_Bosper_TeachFUR_11_03"); //P�ines mi vl�� k��e a pak se uvid�.
			B_LogEntry (TOPIC_BosperWolf,"Bosper m� nau�il stahovat zv��ec� k��e.");
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  700;
	condition	 = 	DIA_Bosper_Trade_Condition;
	information	 = 	DIA_Bosper_Trade_Info;
	permanent	 = 	TRUE;
	description	 = 	"Uka� mi sv� zbo��.";
};
func int DIA_Bosper_Trade_Condition ()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};
	
	return TRUE;
};
func void DIA_Bosper_Trade_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Trade_15_00"); //Uka� mi sv� zbo��.
	
	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv (self);
		//Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems	(self, ItRw_Bolt, Npc_HasItems (self,ItRw_Bolt) );
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Bolt, McBolzenAmount );
	
		Npc_RemoveInvItems	(self, ItRw_Arrow, Npc_HasItems (self,ItRw_Arrow) );
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems 	(self, ItRw_Arrow, McArrowAmount );
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_Trade_11_01"); //Nejsi tady, aby sis prohl�el moje zbo�� - m� mi p�ece p�in�st ty k��e!
		AI_Output (self, other, "DIA_Bosper_Trade_11_02"); //Tak pokra�uj!
	};
};

// **************************************************************
// 						Von Bogen geh�rt
// **************************************************************
instance DIA_Bosper_BogenRunning (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  5;
	condition	 = 	DIA_Bosper_BogenRunning_Condition;
	information	 = 	DIA_Bosper_BogenRunning_Info;
	permanent	 = 	FALSE;
	description	 = "Sly�el jsem, �e t� pr� n�kdo okradl.";
};
func int DIA_Bosper_BogenRunning_Condition ()
{	
	if (MIS_Bosper_Bogen == LOG_RUNNING) 
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenRunning_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenRunning_15_00"); //Sly�el jsem, �e t� pr� n�kdo okradl.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_01"); //Kdo ti to �ekl? Nejsp� Bartok, �e? To ti nemohl pov�d�t nic lep��ho? No tak jo.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_02"); //�eknu ti, a� se ten hajzl modl�, abych ho nedostal do ruky!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_03"); //Jen na chvili�ku jsem ode�el z kr�mu a kdy� jsem se vr�til, spat�il jsem jenom, jak ut�k� - s m�m lukem na rameni.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_04"); //Okam�it� jsem zavolal str�e, ale ten lump b�el sm�rem k p��stavu. A tam se jim ztratil.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_05"); //Trochu jsem jim p�ip�lil koudel u zadku, tak�e prohledali celou p��stavn� �tvr�, ale nena�li v�bec nic.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_06"); //Jsou to prost� mamlasov�!
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_07"); //Vsad�m se, �e m�j luk bude po��d je�t� n�kde ve m�st�. Informoval jsem str�n� u obou m�stsk�ch bran, a tak by nikoho s m�m lukem ven nepustili.
	AI_Output (self, other, "DIA_Bosper_BogenRunning_11_08"); //Kdybych jen toho �mejda dostal do rukou...

	Log_CreateTopic (TOPIC_BosperBogen,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_BosperBogen,LOG_RUNNING);
	B_LogEntry	(TOPIC_BosperBogen,"Bosperovi n�kdo ukradl luk. Zlod�j uprchl do p��stavu, ale pak n�kam zmizel. Domobrana prohledala celou �tvr�, ale nikdo nic nena�el, i kdy� luk mus� b�t st�le je�t� kdesi ve m�st�.");
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess (C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  6;
	condition	 = 	DIA_Bosper_BogenSuccess_Condition;
	information	 = 	DIA_Bosper_BogenSuccess_Info;
	permanent	 = 	FALSE;
	description	 = "M�m pocit, �e tenhle luk je tv�j.";
};
func int DIA_Bosper_BogenSuccess_Condition ()
{	
	if (Npc_HasItems (other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Bosper_BogenSuccess_Info ()
{
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_00"); //M�m pocit, �e tenhle luk je tv�j.
	
	B_GiveInvItems (other, self, ItRw_Bow_L_03_MIS,1);
	
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_01"); //M�j luk! Kdes ho na�el?
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_02"); //V �ern� d��e pln� krys.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_03"); //Douf�m, �es s t�m nem�l n�jak� trable.
	AI_Output (other, self, "DIA_Bosper_BogenSuccess_15_04"); //Ne - s takov�mi v�cmi u� jsem se vypo��dal d��v.
	AI_Output (self, other, "DIA_Bosper_BogenSuccess_11_05"); //Hm, a� je to, jak chce, d�kuji ti. Jsem tv�m dlu�n�kem!
	 
	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems (self, ItRw_Bow_L_03_MIS,1); 
	
};

// **************************************************************
// 							PERM
// **************************************************************
//------------------------
	var int Bosper_Island;
//------------------------
instance DIA_Bosper_PERM		(C_INFO)
{
	npc			 = 	VLK_413_Bosper;
	nr 			 =  10;
	condition	 = 	DIA_Bosper_PERM_Condition;
	information	 = 	DIA_Bosper_PERM_Info;
	permanent	 = 	TRUE;
	description	 = 	"Co nov�ho ve m�st�?";
};
func int DIA_Bosper_PERM_Condition ()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};
func void DIA_Bosper_PERM_Info ()
{
	AI_Output (other, self, "DIA_Bosper_PERM_15_00"); //Co nov�ho ve m�st�?
	
	if (Bosper_Island == FALSE)
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_01"); //Jestli n�s sk�eti opravdu obkl���, za�ne to tu b�t velmi nep��jemn�.
		AI_Output (self, other, "DIA_Bosper_PERM_11_02"); //Jedin� lo�, kter� tu kotv�, pat�� paladin�m, a ti si ji taky po��dn� hl�daj�. A nemysl�m, �e by ji pou�ili na z�chranu m욝an�.
		AI_Output (other, self, "DIA_Bosper_PERM_15_03"); //Ned� se odsud dostat je�t� n�jak jinak?
		AI_Output (self, other, "DIA_Bosper_PERM_11_04"); //Ne, nikdo z n�s odsud bez lodi neunikne.
		
		Bosper_Island = TRUE;
	}
	else 
	{
		AI_Output (self, other, "DIA_Bosper_PERM_11_05"); //Zat�m se nic nov�ho nep�ihodilo. Stav se pozd�ji.
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Bosper_MILKommentar;
	var int Bosper_PALKommentar;
	var int Bosper_INNOSKommentar;
// ----------------------------------

instance DIA_Bosper_AlsLehrling (C_INFO)
{
	npc         = VLK_413_Bosper;
	nr          = 1;
	condition   = DIA_Bosper_AlsLehrling_Condition;
	information = DIA_Bosper_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Bosper_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Bosper_AlsLehrling_Info()
{
	if (other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_00"); //Tak�e ty ses p�idal k domobran�?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_01"); //Ne �e by mi to n�jak vadilo. Krom� sk�et� a bandit� m��e� v�dycky ulovit i p�r vlk� (u�kl�bne se).
		Bosper_MILKommentar = TRUE;
	}
	
	else if (other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_02"); //Kouk�m, �e tvoje kari�ra let� rychle vzh�ru, kr�lovsk� paladine!
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_03"); //A� u� odsud p�jde� kamkoliv, nezapome� na sv�ho star�ho mistra.
		Bosper_PALKommentar = TRUE;
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) )
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_04"); //Tak tys vstoupil do kl�tera, jo? Douf�m, �e t� ob�as taky pust� ven, abys m� mohl i nad�le z�sobovat k��emi.
		Bosper_INNOSKommentar = TRUE;
	}
	
	else if (Bosper_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_05"); //Kde ses tak dlouho fl�kal?
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_06"); //Pot�ebuji dal�� k��e, p�inesls mi je?
		Bosper_Lehrling_Day = Wld_GetDay();
	}
	
	else
	{
		AI_Output (self, other,"DIA_Bosper_AlsLehrling_11_07"); //Tak t� tu m�me zas...
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};
	
// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************	
instance DIA_Bosper_Aufgaben (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 1;
	condition	= DIA_Bosper_Aufgaben_Condition;
	information	= DIA_Bosper_Aufgaben_Info;
	permanent	= FALSE;
	description	= "Jak� m�m jako u�edn�k povinnosti?";
};
func int DIA_Bosper_Aufgaben_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_Aufgaben_Info ()
{
	AI_Output (other, self, "DIA_Bosper_Aufgaben_15_00"); //Jak� m�m jako u�edn�k povinnosti?
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_01"); //Je to jednoduch� - p�ines mi co nejv�c ko�e�in.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_02"); //Zaplat�m ti za n� daleko lep�� cenu, ne� jakou by ti mohli nab�dnout ostatn� obchodn�ci.
	AI_Output (self, other, "DIA_Bosper_Aufgaben_11_03"); //Krom� toho se nemus� v obchod� moc ukazovat - zvl�dnu to klidn� v�echno s�m.
	if (other.guild == GIL_NONE)
	{
		AI_Output (other, self, "DIA_Bosper_Aufgaben_15_04"); //A kde m�m sp�t?
		AI_Output (self, other, "DIA_Bosper_Aufgaben_11_05"); //Bohu�el tu pro tebe nem�m ��dn� voln� pokoj. Ale v hostinci na tr�i�ti t� n�kam ulo�it mus�.
	};
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Bosper mi za zv��ec� k��e zaplat� velmi p��znivou cenu.");
};

// *******************************************************
//				 		SellFur
// *******************************************************	
// -----------------------------
	var int Bosper_TrollFurSold;
// -----------------------------

instance DIA_Bosper_SellFur (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr 			= 600;
	condition	= DIA_Bosper_SellFur_Condition;
	information	= DIA_Bosper_SellFur_Info;
	permanent	= TRUE;
	description	= "M�m tu pro tebe p�r k���.";
};
func int DIA_Bosper_SellFur_Condition ()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};
func void DIA_Bosper_SellFur_Info ()
{
	AI_Output (other, self, "DIA_Bosper_SellFur_15_00"); //M�m tu pro tebe p�r k���.
	
	if (Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
	{
		
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait (self,3);
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur) );
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};
		
		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_01"); //Ov�� k��e? Douf�m, �es tu ovci nezabil n�jak�mu sedl�kovi na pastv�.
			AI_Output (other, self, "DIA_Bosper_SellFur_15_02"); //To by m� ani ve snu nenapadlo.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur) );
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
				
		};
		
		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_03"); //Vl�� k��e, ty jsou dobr�.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur) );
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};
		
		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_04"); //K��e ze sk�et�ho psa? To jsou p�kn� bestie.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_WargFur) * Value_WargFur) );
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};
		
		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output (self, other, "DIA_Bosper_SellFur_11_05"); //P�ni, dokonce k��e st�nov� �elmy - ty jsou velmi cenn�.
			B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur) );
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};
		
		if (Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_06"); //A co je ksakru TOHLE za k��i?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_07"); //Tu jsem st�hl z trola.
				AI_Output (self, other, "DIA_Bosper_SellFur_11_08"); //Ta... ta m� cenu cel�ho jm�n�!
				Bosper_TrollFurSold == TRUE;
			}
			else //TRUE
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_09"); //Dal�� velk� trol� k��e - tos ty potvory v�n� zabil?
				AI_Output (other, self, "DIA_Bosper_SellFur_15_10"); //To v� - kdy� naraz�m na n�jakou nestv�ru, prost� chyt�m p��le�itost za pa�esy.
			};
			
			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur) );
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};
			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output (self, other, "DIA_Bosper_SellFur_11_11"); //A dokonce k��e z �ern�ho trola!
				B_GiveInvItems(self, other, itmi_gold, (Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur) );
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};
		
		AI_Output (self, other, "DIA_Bosper_SellFur_11_12"); //Dobr� pr�ce. P�ij� zase, a� se�ene� dal��.
	}
	else
	{
		AI_Output (self, other, "DIA_Bosper_SellFur_11_13"); //Ale v�dy� v�, �e m� zaj�maj� pouze k��e z vlk�, st�nov�ch �elem a tak podobn�.
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
INSTANCE DIA_Bosper_Minenanteil (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 3;
	condition	= DIA_Bosper_Minenanteil_Condition;
	information	= DIA_Bosper_Minenanteil_Info;

	description = "Vid�m, �e m� na prodej n�jak� d�ln� akcie.";
};   
                    
FUNC INT DIA_Bosper_Minenanteil_Condition()
{	
	if (hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Bosper_Minenanteil_Info()
{	
	AI_Output (other, self, "DIA_Bosper_Minenanteil_15_00"); //Vid�m, �e m� na prodej n�jak� d�ln� akcie.
	AI_Output (self, other, "DIA_Bosper_Minenanteil_11_01"); //Ehm, o tom nic nev�m. Klidn� si je vezmi, jestli chce�.
	B_GivePlayerXP (XP_Ambient);
};	


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Bosper_PICKPOCKET (C_INFO)
{
	npc			= VLK_413_Bosper;
	nr			= 900;
	condition	= DIA_Bosper_PICKPOCKET_Condition;
	information	= DIA_Bosper_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen (67, 120);
};
 
FUNC VOID DIA_Bosper_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Bosper_PICKPOCKET);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_BACK 		,DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};
	
func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Bosper_PICKPOCKET);
};








