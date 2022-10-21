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
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //Pilnujê owiec! I unikam k³opotów.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Nie zawsze siê udaje, co?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //No, szczególnie gdy wokó³ tylu najemników. Cieszê siê, ¿e jestem na pastwisku. Choæ i tu bywa niebezpiecznie.
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
	description	= "A jakie¿ to niebezpieczeñstwa czyhaj¹ na pastwisku?";
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
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Jakie to niebezpieczeñstwa czyhaj¹ na pastwisku?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Po okolicy w³óczy siê niewielka wataha wilków. Ostatnio cholerne bestie prawie ka¿dego dnia porywaj¹ jedn¹ owcê.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Jeszcze kilka dni temu mia³em ze dwa razy wiêcej owiec. Kiedy Onar siê o tym dowie, chyba mnie zat³ucze.
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
	description	= "Dlaczego nie powiedzia³eœ o wilkach najemnikom?";
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
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Dlaczego nie powiedzia³eœ o wilkach najemnikom? Mogliby siê ich przecie¿ pozbyæ.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Taa, wiem. Powinienem by³ im powiedzieæ. Ale nie powiedzia³em.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //Teraz, kiedy tyle owiec zosta³o porwanych, wolê ju¿ nic nie gadaæ.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Przecie¿ w³aœnie powiedzia³eœ MNIE...
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //W³aœnie zaczynam tego ¿a³owaæ.
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
	description	= "A gdybym zabi³ te wilki?";
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
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //A gdybym zabi³ te wilki?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //Ty, sam? Ha, ha. Nie wierzê. Ju¿ chyba prêdzej zrobi³by to któryœ z moich baranów.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Zapomnij. To by³a tylko taka sugestia. Przejdê siê do ch³opaków i zapytam, co oni na to.
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //Zaraz... A zreszt¹ dobrze, w porz¹dku! Ehm... jesteœ wielki i silny, móg³byœ pokonaæ i setkê wilków. Bardzo proszê!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Na ogó³ czaj¹ siê w krzakach, na obrze¿ach pastwiska. Myœlê, ¿e s¹ tylko cztery...
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Owcom Pepe zagra¿aj¹ kr¹¿¹ce po okolicy stada wilków. Powinienem siê nimi zaj¹æ.");
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
	description	 = 	"Pozby³em siê wilków.";
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
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Pozby³em siê wilków.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //Naprawdê? Innosowi niech bêd¹ dziêki!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Dalej jednak nie wiem, jak powiedzieæ Onarowi o tych wszystkich porwanych owcach.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //To wszystko wina tego przeklêtego Bullka!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Nie rób ze mnie idioty, wiem, ¿e bestie ci¹gle ¿yj¹.
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
	description	 = 	"Dlaczego wspomnia³eœ Bullka?";
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
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Dlaczego wspomnia³eœ Bullka?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //To jeden z najemników. W³aœciwie to on mia³ siê zajmowaæ ochron¹ stada.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Zamiast tego on i jego kumpel Sylvio przesiaduj¹ ca³ymi dniami z Thekl¹ w kuchni.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Jeœli nie dostanê zap³aty, to bêdzie wina tego drania.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Gdybym chocia¿ móg³ mu spuœciæ porz¹dne lanie. Jednak wszyscy siê go boj¹, to prawdziwy morderca.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Pepe jest niezadowolony, ¿e Bullko poœwiêca jego owcom tak ma³o uwagi, i szuka kogoœ, kto da³by mu nauczkê.");
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
	description	 = 	"Bullko dosta³ to, na co zas³ugiwa³. ";
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
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullko dosta³ to, na co zas³ugiwa³. Da³em mu porz¹dn¹ nauczkê.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Ta œwinia zas³u¿y³a sobie na to.

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
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //Wszystko w porz¹dku i ze mn¹, i z owcami. Przynajmniej z tymi, które pozosta³y przy ¿yciu.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Na razie dobrze. Ale obawiam siê, ¿e pewnego dnia wilki wróc¹ i bêdzie ich jeszcze wiêcej.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Dosz³y mnie dziwne wieœci. Podobno jakieœ wrogo nastawione typki zajê³y farmê Sekoba. Nie ruszaj¹ siê stamt¹d na krok.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //S³ysza³em, ¿e jacyœ ludzie zajêli farmê Lobarta. Mo¿e ktoœ powinien mu pomóc.
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
	description	 = 	"Czy móg³bym kupiæ owcê?";
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
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //Czy móg³bym kupiæ owcê?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Oczywiœcie, pod warunkiem, ¿e masz pieni¹dze. Owca bêdzie ciê kosztowa³a 100 sztuk z³ota.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Jeœli zap³acisz, dostaniesz owcê. Ale pamiêtaj, by dobrze j¹ traktowaæ.
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
	description	 = 	"Proszê, oto 100 sztuk z³ota. A teraz daj mi owcê.";
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
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Proszê, oto 100 sztuk z³ota. A teraz daj mi owcê.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //Œwietnie. WeŸ sobie Betsy, znajdziesz j¹ na pastwisku.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Powiedz jej tylko, ¿eby za tob¹ posz³a. Jak na owcê, jest ca³kiem sprytna. I pamiêtaj, opiekuj siê ni¹.
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Znowu? Dobrze, weŸ Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy? Jak to? Poprzednia te¿ nazywa³a siê Betsy...
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Wszystkie owce nazywaj¹ siê Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Oczywiœcie, nie dotyczy to baranów.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //A one jak siê nazywaj¹?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Nie masz dostatecznie du¿o pieniêdzy. Nie mogê ci sprzedaæ owcy po ni¿szej cenie.
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















