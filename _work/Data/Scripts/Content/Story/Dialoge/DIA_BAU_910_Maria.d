// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Maria_EXIT   (C_INFO)
{
	npc         = BAU_910_Maria;
	nr          = 999;
	condition   = DIA_Maria_EXIT_Condition;
	information = DIA_Maria_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 1;
	condition	= DIA_Maria_Hallo_Condition;
	information	= DIA_Maria_Hallo_Info;
	permanent  	= FALSE;
	description = "Kim jeste�?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Kim jeste�?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Mam na imi� Maria i jestem �on� Onara.
	AI_Output (self, other, "DIA_Maria_Hallo_17_02"); //Czego tu szukasz?
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen		(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 2;
	condition	= DIA_Maria_Umsehen_Condition;
	information	= DIA_Maria_Umsehen_Info;
	permanent  	= FALSE;
	description = "Chcia�em si� po prostu rozejrze�...";
};

func int DIA_Maria_Umsehen_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info ()
{
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Chcia�em si� po prostu rozejrze�...
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //Odk�d znale�li si� tutaj ci wszyscy m�czy�ni, w domu nie mo�na mie� ani chwili spokoju.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //Wsz�dzie jest ich pe�no.
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 3;
	condition	= DIA_Maria_Soeldner_Condition;
	information	= DIA_Maria_Soeldner_Info;
	permanent  	= FALSE;
	description = "Czy obecno�� najemnik�w jest dla ciebie k�opotliwa?";
};

func int DIA_Maria_Soeldner_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info ()
{
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //Czy obecno�� najemnik�w jest dla ciebie k�opotliwa?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Hm, zapomnij o tym, co przed chwil� powiedzia�am. W ko�cu chodzi przecie� o nasze bezpiecze�stwo.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //Przynajmniej dop�ki tu s�, nie musimy si� obawia� o w�asne �ycie.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Zanim ich tu sprowadzili�my, ci�gle mieli�my na g�owie stra�. Tylko �e zamiast nas chroni�, pl�drowali nasz� spi�arni�.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Zabrali nam wi�kszo�� tegorocznych zbior�w i kilka owiec. Nie zrobili nic, �eby nam si� odwdzi�czy�.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //Kilku z tych �otr�w posun�o si� nawet do kradzie�y.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //Nie zrozum mnie �le, �o�nierzu. Wiem, s� w�r�d was r�wnie� uczciwe osoby.
		};	
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 4;
	condition	= DIA_Maria_Mission_Condition;
	information	= DIA_Maria_Mission_Info;
	permanent  	= FALSE;
	description = "A mo�na wiedzie�, co ci ukradli?";
};

func int DIA_Maria_Mission_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info ()
{
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //A mo�na wiedzie�, co ci ukradli?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //Przede wszystkim z�oto i srebro. Zabrali te� m�j prezent �lubny, z�oty talerz.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Za�o�� si�, �e teraz le�y zakurzony w kufrze jakiego� stra�nika.
	};
	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 5;
	condition	= DIA_Maria_BringPlate_Condition;
	information	= DIA_Maria_BringPlate_Info;
	permanent  	= FALSE;
	description = "Mam przy sobie z�oty talerz. Czy to twoja w�asno��?";
};

func int DIA_Maria_BringPlate_Condition ()
{
	if (Npc_HasItems (other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info ()
{
	B_GiveInvItems (other, self, ItMi_MariasGoldPlate, 1);
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //Mam przy sobie z�oty talerz. Czy to twoja w�asno��?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Tak! To on! Stokrotne dzi�ki!
	
	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP (XP_Maria_Teller);
};


// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------

instance DIA_Maria_Belohnung	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 6;
	condition	= DIA_Maria_Belohnung_Condition;
	information	= DIA_Maria_Belohnung_Info;
	permanent  	= TRUE;
	description = "A jak b�dzie z moj� nagrod�?";
};

func int DIA_Maria_Belohnung_Condition ()
{
	if (MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info ()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //A jak b�dzie z moj� nagrod�?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Jeste� najemnikiem na s�u�bie u mojego m�a, prawda?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Zgadza si�.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Ile ci p�aci m�j m��?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //To za ma�o. Id� do niego i popro� o podwy�k�.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //S�dzisz, �e na to przystanie?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //Wierz mi, wie, co go czeka, je�li si� nie zgodzi.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Czy chcesz si� zatrudni� na naszej farmie jako najemnik?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "Nie, nie bardzo.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Tak.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Prosz�, we� to. Zas�u�y�e� sobie.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //Nie, nie bardzo.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Wi�c przyjmij w nagrod� to z�oto. Zas�u�y�e� na nie.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Tak.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Dobrze, je�li zatrudnisz si� u nas jako najemnik, dopilnuj�, aby� dosta� godziw� zap�at�.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Wr�� tutaj, kiedy ju� uzgodnisz z moim m�em kwesti� wynagrodzenia.
	Info_ClearChoices (DIA_Maria_Belohnung);
};
		
// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 7;
	condition	= DIA_Maria_AboutOnar_Condition;
	information	= DIA_Maria_AboutOnar_Info;
	permanent  	= FALSE;
	description = "Opowiedz mi o Onarze.";
};

func int DIA_Maria_AboutOnar_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info ()
{
	AI_Output (other, self, "DIA_Maria_AboutOnar_15_00"); //Opowiedz mi o Onarze.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //To dobry cz�owiek. Troch� zrz�dliwy i strasznie niecierpliwy, ale w ko�cu ka�dy ma jakie� wady.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //Kiedy� powiedzia�am m�owi: czemu pozwalasz �o�nierzom z miasta tak si� traktowa�?
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //Zr�b co�! Tak w�a�nie powiedzia�am.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Postanowili�my zatrudni� najemnik�w. Teraz czuj� si� tutaj jak na wojnie.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Ale w ko�cu to JEST wojna, czy� nie?
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM	(C_INFO)
{
	npc			= BAU_910_Maria;
	nr		 	= 8;
	condition	= DIA_Maria_PERM_Condition;
	information	= DIA_Maria_PERM_Info;
	permanent  	= FALSE;
	description = "Czy ostatnio zdarzy�o si� tu co� interesuj�cego?";
};

func int DIA_Maria_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info ()
{
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //Czy ostatnio zdarzy�o si� tu co� interesuj�cego?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Przechodzi�a t�dy grupa paladyn�w.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Najpierw s�dzili�my, �e b�d� chcieli zaatakowa� farm�, ale okaza�o si�, �e zmierzali do G�rniczej Doliny.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Kilka nocy temu Wasili wyp�oszy� z�odzieja. Poza tym nie dzia�o si� tutaj nic godnego uwagi.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //Odk�d najemnicy opu�cili nasz dom, zrobi�o si� tutaj znacznie ciszej.
	};
};
			

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Maria_PICKPOCKET (C_INFO)
{
	npc			= BAU_910_Maria;
	nr			= 900;
	condition	= DIA_Maria_PICKPOCKET_Condition;
	information	= DIA_Maria_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60_Female;
};                       

FUNC INT DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen (60, 110);
};
 
FUNC VOID DIA_Maria_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Maria_PICKPOCKET);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_BACK 		,DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};
	
func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Maria_PICKPOCKET);
};


			
			
			
			



	















