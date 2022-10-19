//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_EXIT   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 999;
	condition   = DIA_Addon_Snaf_EXIT_Condition;
	information = DIA_Addon_Snaf_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Snaf_PICKPOCKET (C_INFO)
{
	npc			= BDT_1098_Addon_Snaf;
	nr			= 900;
	condition	= DIA_Addon_Snaf_PICKPOCKET_Condition;
	information	= DIA_Addon_Snaf_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       
FUNC INT DIA_Addon_Snaf_PICKPOCKET_Condition()
{
	C_Beklauen (49, 56);
};
 
FUNC VOID DIA_Addon_Snaf_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Snaf_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Snaf_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Snaf_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Snaf_PICKPOCKET_DoIt);
};

func void DIA_Addon_Snaf_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
	
func void DIA_Addon_Snaf_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Hi   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 1;
	condition   = DIA_Addon_Snaf_Hi_Condition;
	information = DIA_Addon_Snaf_Hi_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Snaf_Hi_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Snaf_Hi_01_00"); //Chcesz pi� czy gada�? Czego potrzebujesz?
};
//---------------------------------------------------------------------
//	Was gibt's denn leckeres?
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Cook (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 2;
	condition   = DIA_Addon_Snaf_Cook_Condition;
	information = DIA_Addon_Snaf_Cook_Info;
	permanent   = FALSE;
	description = "Masz co� dobrego do jedzenia?";
};
FUNC INT DIA_Addon_Snaf_Cook_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Snaf_Cook_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_15_00"); //Masz co� dobrego do jedzenia?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_01_01"); //Chc� sprawdzi� nowy przepis � Ognisty gulasz w mocnym sosie.
	
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"Ognisty gulasz?",DIA_Addon_Snaf_Cook_FEUER);	
	Info_AddChoice 	  (DIA_Addon_Snaf_Cook,"Mocny sos?",DIA_Addon_Snaf_Cook_HAMMER);
};
//---------------------------------------------------------------------
FUNC VOID DIA_Addon_Snaf_Cook_FEUER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_FEUER_15_00");//Ognisty gulasz?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_01");//Chrupi�ce, delikatne, pieczone mi�so w otoczce z ognistej kapusty.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_FEUER_01_02");//Spokojnie � mam ju� przygotowane sk�adniki.
};
FUNC VOID DIA_Addon_Snaf_Cook_HAMMER()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_15_00");//Mocny sos?
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_01");//Sos z bardzo mocnego bimbru. Dosta�em ten przepis od niejakiego Lou.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_01_02");//Zdob�d� sk�adniki i przygotuj bimber w laboratorium, a ja zrobi� sos. Co ty na to?
	
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Nie mam na to czasu.",DIA_Addon_Snaf_Cook_NO);
	Info_AddChoice (DIA_Addon_Snaf_Cook,"Dobrze, zrobi� to.",DIA_Addon_Snaf_Cook_YES);
	
};
FUNC VOID DIA_Addon_Snaf_Cook_NO ()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");//Nie mam na to czasu.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");//Dobra, niewa�ne.
	
	MIS_SnafHammer = LOG_OBSOLETE;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
};
FUNC VOID DIA_Addon_Snaf_Cook_YES()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");//Dobrze, zrobi� to.
	AI_Output (self, other, "DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");//Super. Oto przepis.
	
	B_GiveInvItems (self, other,ItWr_Addon_Lou_Rezept,1);
	MIS_SnafHammer = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Snaf_Cook);
	
	Log_CreateTopic (Topic_Addon_Hammer,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Hammer,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Hammer,"Snaf potrzebuje troch� gorza�ki do swojego sosu. Da� mi przepis na mocn� nalewk�, kt�r� mam przyrz�dzi� przy stole laboratoryjnym. ");
};
//---------------------------------------------------------------------
//	Info Booze
//---------------------------------------------------------------------
var int Snaf_Tip_Kosten;
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Booze   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 3;
	condition   = DIA_Addon_Snaf_Booze_Condition;
	information = DIA_Addon_Snaf_Booze_Info;
	permanent   = FALSE;
	description = "Przygotowa�em bimber.";
};
FUNC INT DIA_Addon_Snaf_Booze_Condition()
{	
	if (Npc_HasItems (other, ItFo_Addon_LousHammer) >= 1)
	&& (MIS_SnafHammer == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Booze_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Booze_15_00");//Przygotowa�em bimber.

	//PATCH N.B.
	B_GiveInvItems (other, self, ItFo_Addon_LousHammer, 1);

	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_01");//Doskonale, zaraz to doko�cz�.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_02");//Teraz mo�esz troch� skosztowa�. To doda ci si�.
	AI_Output (self, other, "DIA_Addon_Snaf_Booze_01_03");//Poczekaj, je�li b�dziesz potrzebowa� pomocy, wszystkie informacje masz u mnie za darmo.
	Snaf_Tip_Kosten = 0;
	B_GiveInvItems (self, other, ItFo_Addon_FireStew,1);
	MIS_SnafHammer = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Loushammer);
};

//---------------------------------------------------------------------
//	ATTENTAT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Snaf_Attentat   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 4;
	condition   = DIA_Addon_Snaf_Attentat_Condition;
	information = DIA_Addon_Snaf_Attentat_Info;
	permanent   = FALSE;
	description = "Co wiesz na temat pr�by zab�jstwa?";
};
FUNC INT DIA_Addon_Snaf_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_15_00"); //Co wiesz na temat pr�by zab�jstwa?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_01"); //Chodzi o ten zamach na Estebana?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_01_02"); //Wiesz, sk�d wieje wiatr. Ober�ysta widzi wszystko, ale nie bierze niczyjej strony...
	
	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Powiedz mi chocia�, gdzie mog� zdoby� informacje.",DIA_Addon_Snaf_Attentat_GoWhere);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"Co by� zrobi� na moim miejscu?",DIA_Addon_Snaf_Attentat_YouBeingMe);
	Info_AddChoice 	  (DIA_Addon_Snaf_Attentat,"A wi�c co� wiesz?",DIA_Addon_Snaf_Attentat_Something);	
};
	
func void DIA_Addon_Snaf_Attentat_Something()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_Something_15_00"); //A wi�c co� wiesz?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_Something_01_01"); //TEGO nie powiedzia�em.
};
func void DIA_Addon_Snaf_Attentat_GoWhere()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_GoWhere_15_00"); //Powiedz mi chocia�, gdzie mog� zdoby� informacje.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_GoWhere_01_01"); //Na boga! To przecie� jedno i to samo! Zapomnij o tym.
};
func void DIA_Addon_Snaf_Attentat_YouBeingMe()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Attentat_YouBeingMe_15_00"); //Co by� zrobi� na moim miejscu?
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_01"); //Zastanowi�bym si�, co wiem na temat osoby, kt�ra zleci�a zab�jstwo.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_02"); //Po pierwsze � by� to najpewniej jeden z bandyt�w, czyli jest tutaj, w obozie.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_03"); //Po drugie � skoro jest w obozie, to znaczy, �e ci� obserwuje.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_04"); //Po trzecie � je�li dojdzie do wniosku, �e stoisz po stronie Estebana, to nigdy si� nie ujawni.
	AI_Output (self, other, "DIA_Addon_Snaf_Attentat_YouBeingMe_01_05"); //Pytanie brzmi � jakie masz szanse na znalezienie tego cz�owieka?

	Info_ClearChoices (DIA_Addon_Snaf_Attentat);
};

//---------------------------------------------------------------------
//	Info Abrechnung
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Abrechnung   (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 5;
	condition   = DIA_Addon_Snaf_Abrechnung_Condition;
	information = DIA_Addon_Snaf_Abrechnung_Info;
	permanent   = TRUE;
	description = "No to jakie mam szanse na znalezienie tego cz�owieka?";
};
FUNC INT DIA_Addon_Snaf_Abrechnung_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Snaf_Attentat)
	&& (MIS_JUDAS == LOG_RUNNING)
	&& (Huno_zuSnaf == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Abrechnung_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Abrechnung_15_00"); //No to jakie mam szanse na znalezienie tego cz�owieka?
	AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_01"); //Hmmm...
	
	if (Senyan_Erpressung == LOG_RUNNING) 
	&& (!Npc_IsDead (Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_02"); //�le to widz�. Niekt�rzy zauwa�yli, �e kr�cisz si� ko�o Senyana.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_03"); //Musisz zrezygnowa� ze swoich kontakt�w. Inaczej nie znajdziesz osoby, kt�ra zleci�a zab�jstwo.
		
		if (Snaf_Tip_Senyan == FALSE)
		{
			B_LogEntry (Topic_Addon_Senyan,"Powinienem zako�czy� kontakty z Senyanem. Jednak lepiej bezpo�rednio go nie atakowa�. Wcze�niej powinienem z nim jeszcze raz porozmawia�.");
			Snaf_Tip_Senyan = TRUE;
		};
	}
	else if (Npc_IsDead(Senyan))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_04"); //Musisz za�atwi� jednego z ludzi Estebana. Cz�owiek, kt�rego szukasz, uwierzy, �e jeste� po jego stronie.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_05"); //Ale tak �atwo nie ujawni swojej to�samo�ci. Musisz wymy�li� co� wi�cej.
	}
	else if (Finn_Petzt == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_06"); //Od czasu rozmowy z tob� Finn wygl�da na bardzo podekscytowanego.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_07"); //A ka�dy wie, �e trzyma si� blisko Estebana.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_08"); //To znaczy, �e powiedzia�e� mu co�, czego nie chcia� us�ysze�.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_09"); //Cz�owiek, kt�rego szukasz, b�dzie bardzo zadowolony...
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_10"); //Ale istnieje ryzyko, �e pobiegnie do Estebana � ale sam o tym przecie� wiesz.
	}
	if (Finn_TellAll == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_11"); //Podobno powiedzia�e� Finnowi, �e ch�tnie pracowa�by� dla Estebana.
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_12"); //Nie wiem, co planujesz, ale cz�owiek, kt�rego szukasz, b�dzie teraz bardzo ostro�ny.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Snaf_Abrechnung_01_13"); //No wszystko si� mo�e zdarzy�.
	};
	
	//------------------- Abschied ----------------------------------
	if (Snaf_Rechnung == FALSE)
	{
		if (Snaf_Einmal == FALSE)
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_14"); //Dzi�kuj�.
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_15"); //Hej, nie powiedzia�em ci nic, czego by� wcze�niej nie wiedzia�, jasne?
			
			Snaf_Einmal = TRUE;
		}
		else
		{
			AI_Output (other, self, "DIA_Addon_Snaf_Abschied_15_16"); //No pewnie..
			AI_Output (self, other, "DIA_Addon_Snaf_Abschied_01_17"); //Dok�adnie.
		};
	};
};

//---------------------------------------------------------------------
//	HOCH
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_HOCH (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_HOCH_Condition;
	information = DIA_Addon_Snaf_HOCH_Info;
	permanent   = FALSE;
	description = "Huno m�wi, �e mam kogo� tu spotka�.";
};
FUNC INT DIA_Addon_Snaf_HOCH_Condition()
{	
	if (Huno_zuSnaf == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_HOCH_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_HOCH_15_00"); //Przysy�a mnie Huno.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_01"); //Wygl�da na to, �e znalaz�e� swojego cz�owieka.
	AI_Output (self, other, "DIA_Addon_Snaf_HOCH_01_02"); //Id� na g�r�. Kto� tam na ciebie czeka.
		
	AI_StopProcessInfos (self);
	AI_Teleport (Fisk,"BL_INN_UP_06");
	B_StartotherRoutine (Fisk,"MEETING");

	B_GivePlayerXP (XP_Addon_Auftraggeber);
};

//---------------------------------------------------------------------
//	People
//---------------------------------------------------------------------
var int Kosten_Einmal;
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_People (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 6;
	condition   = DIA_Addon_Snaf_People_Condition;
	information = DIA_Addon_Snaf_People_Info;
	permanent   = TRUE;
	description = "Co ludzie s�dz� o Estebanie?";
};
FUNC INT DIA_Addon_Snaf_People_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_People_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Snaf_People_15_00"); //Co ludzie s�dz� o Estebanie?
	AI_Output (self, other, "DIA_Addon_Snaf_People_01_01"); //O kogo ci dok�adnie chodzi?
	if (Kosten_Einmal == FALSE)
	&& (MIS_SnafHammer != LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_02"); //Ka�da informacja kosztuje.
		AI_Output (other, self, "DIA_Addon_Snaf_People_15_03"); //Ile?
		AI_Output (self, other, "DIA_Addon_Snaf_People_01_04"); //10 sztuk z�ota.
		
		Snaf_Tip_Kosten = 10;
		Kosten_Einmal = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Snaf_People);
	Info_AddChoice (DIA_Addon_Snaf_People, DIALOG_BACK, DIA_Addon_Snaf_People_BACK);
	Info_AddChoice (DIA_Addon_Snaf_People, "Paul.", DIA_Addon_Snaf_People_Paul);
	Info_AddChoice (DIA_Addon_Snaf_People, "Huno.", DIA_Addon_Snaf_People_Huno);
	Info_AddChoice (DIA_Addon_Snaf_People, "Fisk.", DIA_Addon_Snaf_People_Fisk);
	Info_AddChoice (DIA_Addon_Snaf_People, "Emilio.", DIA_Addon_Snaf_People_Emilio);
	if (!Npc_IsDead (Senyan))
	{
		Info_AddChoice (DIA_Addon_Snaf_People, "Senyan.", DIA_Addon_Snaf_People_Senyan);
	};
	Info_AddChoice (DIA_Addon_Snaf_People, "Lennar.", DIA_Addon_Snaf_People_Lennar);
	Info_AddChoice (DIA_Addon_Snaf_People, "Finn.", DIA_Addon_Snaf_People_Finn);
};
// --------------------------------------------
	func void B_Addon_Snaf_NotEnough()
	{
		AI_Output (self, other, "DIA_Addon_Snaf_NotEnough_01_00"); //Nie masz do�� pieni�dzy, ma�y!
	};

FUNC VOID DIA_Addon_Snaf_People_BACK()
{
	Info_ClearChoices (DIA_Addon_Snaf_People);
};
FUNC VOID DIA_Addon_Snaf_People_Paul()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Paul_15_00"); //Co wiesz na temat Paula?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Paul_01_01"); //Wydaje mi si�, �e nie przepada za Estebanem. Pracuje dla Huno, wi�c nie schodzi ju� do kopalni.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Huno()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Huno_15_00"); //Huno lubi Estebana?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_01"); //Ha. Huno. W�a�ciwie nic o nim nie wiem.
	AI_Output (self, other, "DIA_Addon_Snaf_People_Huno_01_02"); //Ta informacja jest za darmo.
};
FUNC VOID DIA_Addon_Snaf_People_Fisk()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Fisk_15_00"); //Co mo�esz mi powiedzie� o Fisku?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_01"); //Fisk to Fisk. P�aci haracz Estebanowi i oddaje mu cz�� towar�w, kt�re dostaje od pirat�w.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Fisk_01_02"); //Wydaje mi si� jednak, �e Esteban za bardzo go nie obchodzi.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Emilio()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Emilio_15_00"); //Co Emilio s�dzi o Estebanie?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Emilio_01_01"); //Wydaje mi si�, �e nie zapali�by �wieczki na jego grobie. Rozumiesz, o czym m�wi�?
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Senyan()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Senyan_15_00"); //Co powiesz o Senyanie?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Senyan_01_01"); //Senyan jest jednym z ludzi Estebana. Pracuje dla niego ju� od pewnego czasu.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};
FUNC VOID DIA_Addon_Snaf_People_Lennar()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Lennar_15_00"); //Co Lennar my�li o Estebanie?
	AI_Output (self, other, "DIA_Addon_Snaf_People_Lennar_01_01"); //O ile dobrze wiem, Lennar NIE my�li.
};

func VOID DIA_Addon_Snaf_People_Finn()
{
	AI_Output (other, self, "DIA_Addon_Snaf_People_Finn_15_00"); //Co mi powiesz o Finnie?
	if (B_GiveInvItems(other, self, ItMi_Gold, Snaf_Tip_Kosten))
	{
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_01"); //Dobry kopacz. Ma zmys� do szukania z�ota.
		AI_Output (self, other, "DIA_Addon_Snaf_People_Finn_01_02"); //Z tego powodu Esteban go szanuje. Wydaje mi si�, �e si� nawzajem dobrze dogaduj�.
	}
	else
	{
		B_Addon_Snaf_NotEnough();
	};
};

//---------------------------------------------------------------------
//	Und du?
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_Himself (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 7;
	condition   = DIA_Addon_Snaf_Himself_Condition;
	information = DIA_Addon_Snaf_Himself_Info;
	permanent   = FALSE;
	description = "A jakie jest TWOJE zdanie o Estebanie?";
};
FUNC INT DIA_Addon_Snaf_Himself_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Snaf_Attentat))
	&& (!Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_Himself_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_00"); //A jakie jest TWOJE zdanie o Estebanie?
	AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_01"); //Kto o nim m�wi, szybko ko�czy martwy...
	//AI_Output (other, self, "DIA_Addon_Snaf_Himself_15_02"); //Und?
	//AI_Output (self, other, "DIA_Addon_Snaf_Himself_01_03"); //Ende der Geschichte. //wav fehlt
};

//---------------------------------------------------------------------
//	PERM
//---------------------------------------------------------------------
instance DIA_Addon_Snaf_PERM (C_INFO)
{
	npc         = BDT_1098_Addon_Snaf;
	nr          = 8;
	condition   = DIA_Addon_Snaf_PERM_Condition;
	information = DIA_Addon_Snaf_PERM_Info;
	permanent   = TRUE;
	description = "Jak id� interesy?";
};
FUNC INT DIA_Addon_Snaf_PERM_Condition()
{	
	if (Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Snaf_PERM_Info()
{
	AI_Output (other, self, "DIA_Addon_Snaf_PERM_15_00"); //Jak id� interesy?
	AI_Output (self, other, "DIA_Addon_Snaf_PERM_01_01"); //C�. �mier� Estebana jest dla paru os�b okazj� do �wi�towania...
};


