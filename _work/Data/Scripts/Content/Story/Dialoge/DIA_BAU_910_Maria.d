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
	description = "Kim jesteœ?";
};

func int DIA_Maria_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Maria_Hallo_15_00"); //Kim jesteœ?
	AI_Output (self, other, "DIA_Maria_Hallo_17_01"); //Mam na imiê Maria i jestem ¿on¹ Onara.
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
	description = "Chcia³em siê po prostu rozejrzeæ...";
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
	AI_Output (other, self, "DIA_Maria_Umsehen_15_00"); //Chcia³em siê po prostu rozejrzeæ...
	AI_Output (self, other, "DIA_Maria_Umsehen_17_01"); //Odk¹d znaleŸli siê tutaj ci wszyscy mê¿czyŸni, w domu nie mo¿na mieæ ani chwili spokoju.
	AI_Output (self, other, "DIA_Maria_Umsehen_17_02"); //Wszêdzie jest ich pe³no.
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
	description = "Czy obecnoœæ najemników jest dla ciebie k³opotliwa?";
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
	AI_Output (other, self, "DIA_Maria_Soeldner_15_00"); //Czy obecnoœæ najemników jest dla ciebie k³opotliwa?

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_01"); //Hm, zapomnij o tym, co przed chwil¹ powiedzia³am. W koñcu chodzi przecie¿ o nasze bezpieczeñstwo.
		}
	else
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_02"); //Przynajmniej dopóki tu s¹, nie musimy siê obawiaæ o w³asne ¿ycie.
		};

	AI_Output (self, other, "DIA_Maria_Soeldner_17_03"); //Zanim ich tu sprowadziliœmy, ci¹gle mieliœmy na g³owie stra¿. Tylko ¿e zamiast nas chroniæ, pl¹drowali nasz¹ spi¿arniê.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_04"); //Zabrali nam wiêkszoœæ tegorocznych zbiorów i kilka owiec. Nie zrobili nic, ¿eby nam siê odwdziêczyæ.
	AI_Output (self, other, "DIA_Maria_Soeldner_17_05"); //Kilku z tych ³otrów posunê³o siê nawet do kradzie¿y.
	if (hero.guild == GIL_MIL)
		{
			AI_Output (self, other, "DIA_Maria_Soeldner_17_06"); //Nie zrozum mnie Ÿle, ¿o³nierzu. Wiem, s¹ wœród was równie¿ uczciwe osoby.
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
	description = "A mo¿na wiedzieæ, co ci ukradli?";
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
	AI_Output (other, self, "DIA_Maria_Mission_15_00"); //A mo¿na wiedzieæ, co ci ukradli?
	AI_Output (self, other, "DIA_Maria_Mission_17_01"); //Przede wszystkim z³oto i srebro. Zabrali te¿ mój prezent œlubny, z³oty talerz.
	if (other.guild != GIL_MIL)
	{
		AI_Output (self, other, "DIA_Maria_Mission_17_02"); //Za³o¿ê siê, ¿e teraz le¿y zakurzony w kufrze jakiegoœ stra¿nika.
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
	description = "Mam przy sobie z³oty talerz. Czy to twoja w³asnoœæ?";
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
	AI_Output (other, self, "DIA_Maria_BringPlate_15_00"); //Mam przy sobie z³oty talerz. Czy to twoja w³asnoœæ?
	AI_Output (self, other, "DIA_Maria_BringPlate_17_01"); //Tak! To on! Stokrotne dziêki!
	
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
	description = "A jak bêdzie z moj¹ nagrod¹?";
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
	AI_Output (other, self, "DIA_Maria_Belohnung_15_00"); //A jak bêdzie z moj¹ nagrod¹?
	
	
	if (other.guild == GIL_SLD)
	|| (Npc_KnowsInfo (other, DIA_Onar_HowMuch))
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_01"); //Jesteœ najemnikiem na s³u¿bie u mojego mê¿a, prawda?
		AI_Output (other, self, "DIA_Maria_Belohnung_15_02"); //Zgadza siê.
		AI_Output (self, other, "DIA_Maria_Belohnung_17_03"); //Ile ci p³aci mój m¹¿?
		B_Say_Gold (other, self, SOLD);
		AI_Output (self, other, "DIA_Maria_Belohnung_17_04"); //To za ma³o. IdŸ do niego i poproœ o podwy¿kê.
		AI_Output (other, self, "DIA_Maria_Belohnung_15_05"); //S¹dzisz, ¿e na to przystanie?
		AI_Output (self, other, "DIA_Maria_Belohnung_17_06"); //Wierz mi, wie, co go czeka, jeœli siê nie zgodzi.
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output (self, other, "DIA_Maria_Belohnung_17_07"); //Czy chcesz siê zatrudniæ na naszej farmie jako najemnik?
		Info_ClearChoices (DIA_Maria_Belohnung);
		Info_AddChoice (DIA_Maria_Belohnung, "Nie, nie bardzo.", DIA_Maria_Belohnung_Gold);
		Info_AddChoice (DIA_Maria_Belohnung, "Tak.", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems (self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output (self, other, "DIA_Maria_Belohnung_17_08"); //Proszê, weŸ to. Zas³u¿y³eœ sobie.
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_Gold_15_00"); //Nie, nie bardzo.
	B_GiveInvItems (self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output (self, other, "DIA_Maria_Belohnung_Gold_17_01"); //Wiêc przyjmij w nagrodê to z³oto. Zas³u¿y³eœ na nie.
	Info_ClearChoices (DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output (other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //Tak.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //Dobrze, jeœli zatrudnisz siê u nas jako najemnik, dopilnujê, abyœ dosta³ godziw¹ zap³atê.
	AI_Output (self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //Wróæ tutaj, kiedy ju¿ uzgodnisz z moim mê¿em kwestiê wynagrodzenia.
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
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_01"); //To dobry cz³owiek. Trochê zrzêdliwy i strasznie niecierpliwy, ale w koñcu ka¿dy ma jakieœ wady.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_02"); //Kiedyœ powiedzia³am mê¿owi: czemu pozwalasz ¿o³nierzom z miasta tak siê traktowaæ?
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_03"); //Zrób coœ! Tak w³aœnie powiedzia³am.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_04"); //Postanowiliœmy zatrudniæ najemników. Teraz czujê siê tutaj jak na wojnie.
	AI_Output (self, other, "DIA_Maria_AboutOnar_17_05"); //Ale w koñcu to JEST wojna, czy¿ nie?
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
	description = "Czy ostatnio zdarzy³o siê tu coœ interesuj¹cego?";
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
	AI_Output (other, self, "DIA_Maria_PERM_15_00"); //Czy ostatnio zdarzy³o siê tu coœ interesuj¹cego?
	if (Kapitel <= 2)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_01"); //Przechodzi³a têdy grupa paladynów.
		AI_Output (self, other, "DIA_Maria_PERM_17_02"); //Najpierw s¹dziliœmy, ¿e bêd¹ chcieli zaatakowaæ farmê, ale okaza³o siê, ¿e zmierzali do Górniczej Doliny.
	}
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_03"); //Kilka nocy temu Wasili wyp³oszy³ z³odzieja. Poza tym nie dzia³o siê tutaj nic godnego uwagi.
	};
	
	if (Kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Maria_PERM_17_04"); //Odk¹d najemnicy opuœcili nasz dom, zrobi³o siê tutaj znacznie ciszej.
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


			
			
			
			



	















