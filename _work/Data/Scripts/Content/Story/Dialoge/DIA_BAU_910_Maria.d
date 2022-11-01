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
	description = "Kim jesteś?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Kim jesteś?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Mam na imię Maria i jestem żoną Onara.
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
	description = "Chciałem się po prostu rozejrzeć...";
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
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Chciałem się po prostu rozejrzeć...
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //Odkąd znaleźli się tutaj ci wszyscy mężczyźni, w domu nie można mieć ani chwili spokoju.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //Wszędzie jest ich pełno.
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
	description = "Czy obecność najemników jest dla ciebie kłopotliwa?";
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
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //Czy obecność najemników jest dla ciebie kłopotliwa?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Hm, zapomnij o tym, co przed chwilą powiedziałam. W końcu chodzi przecież o nasze bezpieczeństwo.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //Przynajmniej dopóki tu są, nie musimy się obawiać o własne życie.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Zanim ich tu sprowadziliśmy, ciągle mieliśmy na głowie straż. Tylko że zamiast nas chronić, plądrowali naszą spiżarnię.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Zabrali nam większość tegorocznych zbiorów i kilka owiec. Nie zrobili nic, żeby nam się odwdzięczyć.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //Kilku z tych łotrów posunęło się nawet do kradzieży.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //Nie zrozum mnie źle, żołnierzu. Wiem, są wśród was również uczciwe osoby.
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
	description = "A można wiedzieć, co ci ukradli?";
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
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //A można wiedzieć, co ci ukradli?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //Przede wszystkim złoto i srebro. Zabrali też mój prezent ślubny, złoty talerz.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Założę się, że teraz leży zakurzony w kufrze jakiegoś strażnika.
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
	description = "Mam przy sobie złoty talerz. Czy to twoja własność?";
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
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //Mam przy sobie złoty talerz. Czy to twoja własność?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Tak! To on! Stokrotne dzięki!
	
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
	description = "A jak będzie z moją nagrodą?";
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
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //A jak będzie z moją nagrodą?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Jesteś najemnikiem na służbie u mojego męża, prawda?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Zgadza się.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Ile ci płaci mój mąż?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //To za mało. Idź do niego i poproś o podwyżkę.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //Sądzisz, że na to przystanie?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //Wierz mi, wie, co go czeka, jeśli się nie zgodzi.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Czy chcesz się zatrudnić na naszej farmie jako najemnik?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "Nie, nie bardzo.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Tak.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Proszę, weź to. Zasłużyłeś sobie.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //Nie, nie bardzo.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Więc przyjmij w nagrodę to złoto. Zasłużyłeś na nie.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Tak.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Dobrze, jeśli zatrudnisz się u nas jako najemnik, dopilnuję, abyś dostał godziwą zapłatę.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Wróć tutaj, kiedy już uzgodnisz z moim mężem kwestię wynagrodzenia.
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
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //To dobry człowiek. Trochę zrzędliwy i strasznie niecierpliwy, ale w końcu każdy ma jakieś wady.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //Kiedyś powiedziałam mężowi: czemu pozwalasz żołnierzom z miasta tak się traktować?
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //Zrób coś! Tak właśnie powiedziałam.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Postanowiliśmy zatrudnić najemników. Teraz czuję się tutaj jak na wojnie.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Ale w końcu to JEST wojna, czyż nie?
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
	description = "Czy ostatnio zdarzyło się tu coś interesującego?";
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
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //Czy ostatnio zdarzyło się tu coś interesującego?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Przechodziła tędy grupa paladynów.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Najpierw sądziliśmy, że będą chcieli zaatakować farmę, ale okazało się, że zmierzali do Górniczej Doliny.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Kilka nocy temu Wasili wypłoszył złodzieja. Poza tym nie działo się tutaj nic godnego uwagi.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //Odkąd najemnicy opuścili nasz dom, zrobiło się tutaj znacznie ciszej.
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


			
			
			
			



	















