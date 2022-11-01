// ************************************************************
// 								EXIT
// ************************************************************
INSTANCE DIA_Pepe_EXIT   (C_INFO)
{
	npc         = BAU_912_Pepe;
	nr          = 999;
	condition   = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Pepe_Hallo (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 1;
	condition	= DIA_Pepe_Hallo_Condition;
	information	= DIA_Pepe_Hallo_Info;
	permanent	= FALSE;
	description	= "Co tu porabiasz?";
};
func int DIA_Pepe_Hallo_Condition ()
{
	return TRUE;
};
func void DIA_Pepe_Hallo_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Hallo_15_00"); //Co porabiasz?
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //Pilnuję owiec! I unikam kłopotów.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Nie zawsze się udaje, co?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //No, szczególnie gdy wokół tylu najemników. Cieszę się, że jestem na pastwisku. Choć i tu bywa niebezpiecznie.
	};
};

// ************************************************************
// 								Danger
// ************************************************************
instance DIA_Pepe_Danger (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 2;
	condition	= DIA_Pepe_Danger_Condition;
	information	= DIA_Pepe_Danger_Info;
	permanent 	= FALSE;
	description	= "A jakież to niebezpieczeństwa czyhają na pastwisku?";
};
func int DIA_Pepe_Danger_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};
func void DIA_Pepe_Danger_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Jakie to niebezpieczeństwa czyhają na pastwisku?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Po okolicy włóczy się niewielka wataha wilków. Ostatnio cholerne bestie prawie każdego dnia porywają jedną owcę.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Jeszcze kilka dni temu miałem ze dwa razy więcej owiec. Kiedy Onar się o tym dowie, chyba mnie zatłucze.
};

// ************************************************************
// 								WhyNotSLD
// ************************************************************
instance DIA_Pepe_WhyNotSLD	(C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 3;
	condition	= DIA_Pepe_WhyNotSLD_Condition;
	information	= DIA_Pepe_WhyNotSLD_Info;
	PERMANENT 	= FALSE;
	description	= "Dlaczego nie powiedziałeś o wilkach najemnikom?";
};
func int DIA_Pepe_WhyNotSLD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	&& ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};
func void DIA_Pepe_WhyNotSLD_Info ()
{
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Dlaczego nie powiedziałeś o wilkach najemnikom? Mogliby się ich przecież pozbyć.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Taa, wiem. Powinienem był im powiedzieć. Ale nie powiedziałem.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //Teraz, kiedy tyle owiec zostało porwanych, wolę już nic nie gadać.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Przecież właśnie powiedziałeś MNIE...
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //Właśnie zaczynam tego żałować.
};

// ************************************************************
// 								KillWolves
// ************************************************************
instance DIA_Pepe_KillWolves (C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr			= 4;
	condition	= DIA_Pepe_KillWolves_Condition;
	information	= DIA_Pepe_KillWolves_Info;
	permanent 	= FALSE;
	description	= "A gdybym zabił te wilki?";
};
func int DIA_Pepe_KillWolves_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	{
		return TRUE;
	};
};
func void DIA_Pepe_KillWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //A gdybym zabił te wilki?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //Ty, sam? Ha, ha. Nie wierzę. Już chyba prędzej zrobiłby to któryś z moich baranów.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Zapomnij. To była tylko taka sugestia. Przejdę się do chłopaków i zapytam, co oni na to.
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //Zaraz... A zresztą dobrze, w porządku! Ehm... jesteś wielki i silny, mógłbyś pokonać i setkę wilków. Bardzo proszę!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Na ogół czają się w krzakach, na obrzeżach pastwiska. Myślę, że są tylko cztery...
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Owcom Pepe zagrażają krążące po okolicy stada wilków. Powinienem się nimi zająć.");
};

// ************************************************************
// 								KilledWolves
// ************************************************************
instance DIA_Pepe_KilledWolves		(C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_KilledWolves_Condition;
	information	 = 	DIA_Pepe_KilledWolves_Info;
	permanent	 = 	TRUE;
	description	 = 	"Pozbyłem się wilków.";
};
func int DIA_Pepe_KilledWolves_Condition ()
{
	if  (MIS_Pepe_KillWolves == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Pepe_KilledWolves_Info ()
{
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Pozbyłem się wilków.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //Naprawdę? Innosowi niech będą dzięki!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Dalej jednak nie wiem, jak powiedzieć Onarowi o tych wszystkich porwanych owcach.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //To wszystko wina tego przeklętego Bullka!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Nie rób ze mnie idioty, wiem, że bestie ciągle żyją.
	};
};

// ************************************************************
// 					Was hast du über Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dlaczego wspomniałeś Bullka?";
};
func int DIA_Pepe_Bullco_Condition ()
{
	if (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (!Npc_IsDead(Bullco))
	&& (Kapitel <= 3)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Bullco_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Dlaczego wspomniałeś Bullka?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //To jeden z najemników. Właściwie to on miał się zajmować ochroną stada.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Zamiast tego on i jego kumpel Sylvio przesiadują całymi dniami z Theklą w kuchni.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Jeśli nie dostanę zapłaty, to będzie wina tego drania.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Gdybym chociaż mógł mu spuścić porządne lanie. Jednak wszyscy się go boją, to prawdziwy morderca.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Pepe jest niezadowolony, że Bullko poświęca jego owcom tak mało uwagi, i szuka kogoś, kto dałby mu nauczkę.");
};

// ************************************************************
// 						Bullco geschlagen
// ************************************************************
instance DIA_Pepe_BullcoDefeated (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_BullcoDefeated_Condition;
	information	 = 	DIA_Pepe_BullcoDefeated_Info;
	permanent	 = 	FALSE;
	description	 = 	"Bullko dostał to, na co zasługiwał. ";
};
func int DIA_Pepe_BullcoDefeated_Condition ()
{
	if (MIS_Pepe_KickBullco == LOG_RUNNING)
	{
		if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			return TRUE;
		};
	};
};
func void DIA_Pepe_BullcoDefeated_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullko dostał to, na co zasługiwał. Dałem mu porządną nauczkę.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Ta świnia zasłużyła sobie na to.

	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP (XP_KickBullco);
};

// ************************************************************
// 			  					PERM 
// ************************************************************
instance DIA_Pepe_PERM		(C_INFO)
{
	npc		 	= BAU_912_Pepe;
	nr		 	= 6;
	condition	= DIA_Pepe_PERM_Condition;
	information	= DIA_Pepe_PERM_Info;
	permanent	= TRUE;
	description	= "Co tam u ciebie? Jak owce?";
};

func int DIA_Pepe_PERM_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info ()
{
	AI_Output (other, self, "DIA_Pepe_PERM_15_00"); //Co tam u ciebie? Jak owce?

	if (kapitel <= 1)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //Wszystko w porządku i ze mną, i z owcami. Przynajmniej z tymi, które pozostały przy życiu.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Na razie dobrze. Ale obawiam się, że pewnego dnia wilki wrócą i będzie ich jeszcze więcej.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Doszły mnie dziwne wieści. Podobno jakieś wrogo nastawione typki zajęły farmę Sekoba. Nie ruszają się stamtąd na krok.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //Słyszałem, że jacyś ludzie zajęli farmę Lobarta. Może ktoś powinien mu pomóc.
	};
};

// ************************************************************
// 			  					Liesel 
// ************************************************************
instance DIA_Pepe_Liesel		(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	7;
	condition	 = 	DIA_Pepe_Liesel_Condition;
	information	 = 	DIA_Pepe_Liesel_Info;
	permanent	 = 	FALSE;
	description	 = 	"Czy mógłbym kupić owcę?";
};
func int DIA_Pepe_Liesel_Condition ()
{
	if Npc_KnowsInfo (hero, DIA_Pepe_Hallo)
	{
		return TRUE;
	};
};
func void DIA_Pepe_Liesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //Czy mógłbym kupić owcę?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Oczywiście, pod warunkiem, że masz pieniądze. Owca będzie cię kosztowała 100 sztuk złota.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Jeśli zapłacisz, dostaniesz owcę. Ale pamiętaj, by dobrze ją traktować.
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
var int Pepe_SchafGekauft;

instance DIA_Pepe_BuyLiesel	(C_INFO)
{
	npc			 = 	BAU_912_Pepe;
	nr			 = 	8;
	condition	 = 	DIA_Pepe_BuyLiesel_Condition;
	information	 = 	DIA_Pepe_BuyLiesel_Info;
	permanent	 = 	TRUE;
	description	 = 	"Proszę, oto 100 sztuk złota. A teraz daj mi owcę.";
};
func int DIA_Pepe_BuyLiesel_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Pepe_LIESEL))
	{
		return TRUE;
	};
};
func void DIA_Pepe_BuyLiesel_Info ()
{
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Proszę, oto 100 sztuk złota. A teraz daj mi owcę.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Świetnie. Weź sobie Betsy, znajdziesz ją na pastwisku.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Powiedz jej tylko, żeby za tobą poszła. Jak na owcę, jest całkiem sprytna. I pamiętaj, opiekuj się nią.
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Znowu? Dobrze, weź Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy? Jak to? Poprzednia też nazywała się Betsy...
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Wszystkie owce nazywają się Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Oczywiście, nie dotyczy to baranów.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //A one jak się nazywają?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Nie masz dostatecznie dużo pieniędzy. Nie mogę ci sprzedać owcy po niższej cenie.
	};
};


// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Pepe_PICKPOCKET (C_INFO)
{
	npc			= BAU_912_Pepe;
	nr			= 900;
	condition	= DIA_Pepe_PICKPOCKET_Condition;
	information	= DIA_Pepe_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen (15, 25);
};
 
FUNC VOID DIA_Pepe_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Pepe_PICKPOCKET);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_BACK 		,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};
	
func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Pepe_PICKPOCKET);
};















