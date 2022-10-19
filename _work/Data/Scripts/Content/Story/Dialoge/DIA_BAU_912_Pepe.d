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
	AI_Output (self, other, "DIA_Pepe_Hallo_03_01"); //Pilnuj� owiec! I unikam k�opot�w.
	
	if ((hero.guild != GIL_SLD)&&(hero.guild != GIL_DJG))
	{
		AI_Output (other, self, "DIA_Pepe_Hallo_15_02"); //Nie zawsze si� udaje, co?
		AI_Output (self, other, "DIA_Pepe_Hallo_03_03"); //No, szczeg�lnie gdy wok� tylu najemnik�w. Ciesz� si�, �e jestem na pastwisku. Cho� i tu bywa niebezpiecznie.
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
	description	= "A jakie� to niebezpiecze�stwa czyhaj� na pastwisku?";
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
	AI_Output (other, self, "DIA_Pepe_Danger_15_00"); //Jakie to niebezpiecze�stwa czyhaj� na pastwisku?
	AI_Output (self, other, "DIA_Pepe_Danger_03_01"); //Po okolicy w��czy si� niewielka wataha wilk�w. Ostatnio cholerne bestie prawie ka�dego dnia porywaj� jedn� owc�.
	AI_Output (self, other, "DIA_Pepe_Danger_03_02"); //Jeszcze kilka dni temu mia�em ze dwa razy wi�cej owiec. Kiedy Onar si� o tym dowie, chyba mnie zat�ucze.
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
	description	= "Dlaczego nie powiedzia�e� o wilkach najemnikom?";
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
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_00"); //Dlaczego nie powiedzia�e� o wilkach najemnikom? Mogliby si� ich przecie� pozby�.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_01"); //Taa, wiem. Powinienem by� im powiedzie�. Ale nie powiedzia�em.
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_02"); //Teraz, kiedy tyle owiec zosta�o porwanych, wol� ju� nic nie gada�.
	AI_Output (other, self, "DIA_Pepe_WhyNotSLD_15_03"); //Przecie� w�a�nie powiedzia�e� MNIE...
	AI_Output (self, other, "DIA_Pepe_WhyNotSLD_03_04"); //W�a�nie zaczynam tego �a�owa�.
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
	description	= "A gdybym zabi� te wilki?";
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
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_00"); //A gdybym zabi� te wilki?
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_01"); //Ty, sam? Ha, ha. Nie wierz�. Ju� chyba pr�dzej zrobi�by to kt�ry� z moich baran�w.
	AI_Output (other, self, "DIA_Pepe_KillWolves_15_02"); //Zapomnij. To by�a tylko taka sugestia. Przejd� si� do ch�opak�w i zapytam, co oni na to.
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_03"); //Zaraz... A zreszt� dobrze, w porz�dku! Ehm... jeste� wielki i silny, m�g�by� pokona� i setk� wilk�w. Bardzo prosz�!
	AI_Output (self, other, "DIA_Pepe_KillWolves_03_04"); //Na og� czaj� si� w krzakach, na obrze�ach pastwiska. My�l�, �e s� tylko cztery...
	
	AI_StopProcessInfos (self);
	
	Wld_InsertNpc	(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01"); 
	Wld_InsertNpc	(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02"); 
	Wld_InsertNpc	(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03"); 
	Wld_InsertNpc	(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04"); 
	
	MIS_Pepe_KillWolves = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_PepeWolves,LOG_RUNNING);
	B_LogEntry (TOPIC_PepeWolves,"Owcom Pepe zagra�aj� kr���ce po okolicy stada wilk�w. Powinienem si� nimi zaj��.");
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
	description	 = 	"Pozby�em si� wilk�w.";
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
	AI_Output (other, self, "DIA_Pepe_KilledWolves_15_00"); //Pozby�em si� wilk�w.

	if (Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_01"); //Naprawd�? Innosowi niech b�d� dzi�ki!
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_02"); //Dalej jednak nie wiem, jak powiedzie� Onarowi o tych wszystkich porwanych owcach.
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_03"); //To wszystko wina tego przekl�tego Bullka!

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP (XP_PepeWolves);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_KilledWolves_03_04"); //Nie r�b ze mnie idioty, wiem, �e bestie ci�gle �yj�.
	};
};

// ************************************************************
// 					Was hast du �ber Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco (C_INFO)
{
	npc		 	 = 	BAU_912_Pepe;
	nr			 = 	5;
	condition	 = 	DIA_Pepe_Bullco_Condition;
	information	 = 	DIA_Pepe_Bullco_Info;
	permanent	 = 	FALSE;
	description	 = 	"Dlaczego wspomnia�e� Bullka?";
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
	AI_Output (other, self, "DIA_Pepe_Bullco_15_00"); //Dlaczego wspomnia�e� Bullka?
	AI_Output (self, other, "DIA_Pepe_Bullco_03_01"); //To jeden z najemnik�w. W�a�ciwie to on mia� si� zajmowa� ochron� stada.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_02"); //Zamiast tego on i jego kumpel Sylvio przesiaduj� ca�ymi dniami z Thekl� w kuchni.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_03"); //Je�li nie dostan� zap�aty, to b�dzie wina tego drania.
	AI_Output (self, other, "DIA_Pepe_Bullco_03_04"); //Gdybym chocia� m�g� mu spu�ci� porz�dne lanie. Jednak wszyscy si� go boj�, to prawdziwy morderca.

	MIS_Pepe_KickBullco = LOG_RUNNING;
	
	Log_CreateTopic (TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_KickBullco,LOG_RUNNING);
	B_LogEntry (TOPIC_KickBullco,"Pepe jest niezadowolony, �e Bullko po�wi�ca jego owcom tak ma�o uwagi, i szuka kogo�, kto da�by mu nauczk�.");
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
	description	 = 	"Bullko dosta� to, na co zas�ugiwa�. ";
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
	AI_Output (other, self, "DIA_Pepe_BullcoDefeated_15_00"); //Bullko dosta� to, na co zas�ugiwa�. Da�em mu porz�dn� nauczk�.
	AI_Output (self, other, "DIA_Pepe_BullcoDefeated_03_01"); //Ta �winia zas�u�y�a sobie na to.

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
		AI_Output (self, other, "DIA_Pepe_PERM_03_01"); //Wszystko w porz�dku i ze mn�, i z owcami. Przynajmniej z tymi, kt�re pozosta�y przy �yciu.
	};
	
	if (Kapitel == 2)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_02"); //Na razie dobrze. Ale obawiam si�, �e pewnego dnia wilki wr�c� i b�dzie ich jeszcze wi�cej.
	};
	
	if (Kapitel == 3)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_03"); //Dosz�y mnie dziwne wie�ci. Podobno jakie� wrogo nastawione typki zaj�y farm� Sekoba. Nie ruszaj� si� stamt�d na krok.
	}
	
	if (kapitel >= 4)
	{
		AI_Output (self, other, "DIA_Pepe_PERM_03_04"); //S�ysza�em, �e jacy� ludzie zaj�li farm� Lobarta. Mo�e kto� powinien mu pom�c.
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
	description	 = 	"Czy m�g�bym kupi� owc�?";
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
	AI_Output (other, self, "DIA_Pepe_Liesel_15_00"); //Czy m�g�bym kupi� owc�?
	AI_Output (self, other, "DIA_Pepe_Liesel_03_01"); //Oczywi�cie, pod warunkiem, �e masz pieni�dze. Owca b�dzie ci� kosztowa�a 100 sztuk z�ota.
	AI_Output (self, other, "DIA_Pepe_Liesel_03_02"); //Je�li zap�acisz, dostaniesz owc�. Ale pami�taj, by dobrze j� traktowa�.
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
	description	 = 	"Prosz�, oto 100 sztuk z�ota. A teraz daj mi owc�.";
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
	AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_00"); //Prosz�, oto 100 sztuk z�ota. A teraz daj mi owc�.
	
	if (B_GiveInvItems  (other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_01"); //�wietnie. We� sobie Betsy, znajdziesz j� na pastwisku.
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_02"); //Powiedz jej tylko, �eby za tob� posz�a. Jak na owc�, jest ca�kiem sprytna. I pami�taj, opiekuj si� ni�.
		}
		else
		{
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_03"); //Znowu? Dobrze, we� Betsy.
			AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_04"); //Betsy? Jak to? Poprzednia te� nazywa�a si� Betsy...
			AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_05"); //Wszystkie owce nazywaj� si� Betsy.
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_06"); //Oczywi�cie, nie dotyczy to baran�w.
				AI_Output (other, self, "DIA_Pepe_BuyLiesel_15_07"); //A one jak si� nazywaj�?
				AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_08"); //Bruce.
			};
		};
		
		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;		
		Wld_InsertNpc	(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");  // *** FIXME *** noch entsprechenden WP/FP eintragen
	
		AI_StopProcessInfos (self);
	}
	else
	{
		AI_Output (self, other, "DIA_Pepe_BuyLiesel_03_09"); //Nie masz dostatecznie du�o pieni�dzy. Nie mog� ci sprzeda� owcy po ni�szej cenie.
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















