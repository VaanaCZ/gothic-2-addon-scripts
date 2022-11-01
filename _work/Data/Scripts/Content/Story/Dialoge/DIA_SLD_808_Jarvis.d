// ************************************************************
// 			  				   EXIT 
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  					Hello 
// ************************************************************
instance DIA_Jarvis_Hello (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_Hello_Condition;
	information	= DIA_Jarvis_Hello_Info;
	permanent	= FALSE;
	important 	= TRUE;
};                       

FUNC INT DIA_Jarvis_Hello_Condition()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_Hello_Info()
{	
	AI_Output (self, other, "DIA_Jarvis_Hello_04_00"); //Hej! Czy ja cię skądś nie znam?
	AI_Output (other, self, "DIA_Jarvis_Hello_15_01"); //To możliwe. Też byłem w Kolonii.
	AI_Output (self, other, "DIA_Jarvis_Hello_04_02"); //Taak... Czego chcesz?
};
	
// ************************************************************
// 			  					DieLage 
// ************************************************************
instance DIA_Jarvis_DieLage (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_DieLage_Condition;
	information	= DIA_Jarvis_DieLage_Info;
	permanent	= FALSE;
	description = "Jak wygląda sytuacja?";
};                       

FUNC INT DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Jarvis_DieLage_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DieLage_15_00"); //Jak wygląda sytuacja?
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_01"); //Teraz mamy poważne kłopoty. Wśród nas, najemników, tworzą się dwa obozy.
	AI_Output (self, other, "DIA_Jarvis_DieLage_04_02"); //Sylvio i jego ludzie nie wierzą, że Lee ma dobry plan.
};
	
// ************************************************************
// 			  					TwoFronts 
// ************************************************************
instance DIA_Jarvis_TwoFronts (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_TwoFronts_Condition;
	information	= DIA_Jarvis_TwoFronts_Info;
	permanent	= FALSE;
	description = "Co was tak poróżniło?";
};                       

FUNC INT DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_TwoFronts_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_TwoFronts_15_00"); //Co was tak poróżniło?
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_01"); //Większość z nas pochodzi z Kolonii, tak samo jak Lee.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_02"); //Jednak niektórzy z najemników dołączyli do nas później.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_03"); //Nie byli w Kolonii, ale walczyli z orkami - dalej na południu.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_04"); //Jakimś sposobem dowiedzieli się, że Lee szuka ludzi. Ich szefem był Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_05"); //Uznał przywództwo Lee, ale teraz próbuje podburzać przeciwko niemu najemników, żeby nie realizowali jego planu.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_06"); //Sporo ludzi Lee uważa, że to żaden problem. Ale ja znam kolesi takich jak Sylvio.
	AI_Output (self, other, "DIA_Jarvis_TwoFronts_04_07"); //Zrobi wszystko, żeby zrealizować swoje zamierzenia.
};
	
// ************************************************************
// 			  					LeesPlan 
// ************************************************************
instance DIA_Jarvis_LeesPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 4;
	condition	= DIA_Jarvis_LeesPlan_Condition;
	information	= DIA_Jarvis_LeesPlan_Info;
	permanent	= FALSE;
	description = "Czy wiesz, co zmierza Lee?";
};                       

FUNC INT DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_LeesPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_LeesPlan_15_00"); //Czy wiesz, co zmierza Lee?
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_01"); //Lee chce, żebyśmy czekali, aż paladyni w mieście wymrą z głodu.
	};
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_02"); //Planuje zabrać nas wszystkich z wyspy. A Innos wie, że nie mam nic przeciwko opuszczeniu tego miejsca.
	AI_Output (self, other, "DIA_Jarvis_LeesPlan_04_03"); //Nie wiem, jak zamierza tego dokonać, ale mu ufam. Dobrze nami dowodzi.
};

// ************************************************************
// 			  				SylviosPlan 
// ************************************************************
instance DIA_Jarvis_SylviosPlan (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 5;
	condition	= DIA_Jarvis_SylviosPlan_Condition;
	information	= DIA_Jarvis_SylviosPlan_Info;
	permanent	= FALSE;
	description = "Czy wiesz, co planuje Sylvio?";
};                       

FUNC INT DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosPlan_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosPlan_15_00"); //Czy wiesz, co planuje Sylvio?
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_01"); //Sylvio dowiedział się, że niektórzy z paladynów przenieśli się do starej Kolonii.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_02"); //Mówi, że reszta paladynów nie odważy się nas tutaj zaatakować i chce wykorzystać sytuację.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_03"); //Plądrować małe farmy, rozprawić się z małymi patrolami straży poza miastem, złupić podróżnych - takie rzeczy.
	AI_Output (self, other, "DIA_Jarvis_SylviosPlan_04_04"); //Lee uważa jednak, że w naszej sytuacji byłaby to najgorsza rzecz, jaką moglibyśmy zrobić.
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 6;
	condition	= DIA_Jarvis_WannaJoin_Condition;
	information	= DIA_Jarvis_WannaJoin_Info;
	permanent	= FALSE;
	description = "Chcę zostać najemnikiem!";
};                       

FUNC INT DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_WannaJoin_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_WannaJoin_15_00"); //Chcę zostać najemnikiem!
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_01"); //Nie jestem pewien, czy to dobry pomysł...
	AI_Output (other,self , "DIA_Jarvis_WannaJoin_15_02"); //W czym problem?
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_03"); //No cóż, muszę głosować za tobą albo przeciwko tobie.
	AI_Output (self, other, "DIA_Jarvis_WannaJoin_04_04"); //A w obecnej sytuacji zagłosuję na ciebie tylko wtedy, jeśli będę pewien, że stoisz po stronie Lee!
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 7;
	condition	= DIA_Jarvis_MissionKO_Condition;
	information	= DIA_Jarvis_MissionKO_Info;
	permanent	= FALSE;
	description = "Więc co powinienem zrobić?";
};                       

FUNC INT DIA_Jarvis_MissionKO_Condition()
{
	if (Npc_KnowsInfo (other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo (other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_MissionKO_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_MissionKO_15_00"); //Więc co powinienem zrobić?
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_01"); //To proste. Obij paru chłopaków Sylvia! Tym sposobem obie strony będą dokładnie wiedziały, za kim się opowiedziałeś.
	AI_Output (self, other, "DIA_Jarvis_MissionKO_04_02"); //A jeśli do tego będziesz się trzymał zasad pojedynku, to zaskarbisz sobie szacunek pozostałych.
	
	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic (TOPIC_JarvisSLDKo,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_JarvisSLDKo,LOG_RUNNING);
	B_LogEntry (TOPIC_JarvisSLDKo,"Jarvis chce przetrzepać skórę kilku chłopakom Sylvia. Kiedy ta sprawa będzie już załatwiona, udzieli mi swojego poparcia.");
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_DuellRegeln_Condition;
	information	= DIA_Jarvis_DuellRegeln_Info;
	permanent	= FALSE;
	description = "Jakie są reguły pojedynku?";
};                       

FUNC INT DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_DuellRegeln_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_DuellRegeln_15_00"); //Jakie są reguły pojedynku?
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_01"); //Idź do Torlofa, jeśli jesteś zainteresowany, on ci to wyjaśni.
	AI_Output (self, other, "DIA_Jarvis_DuellRegeln_04_02"); //Żebyśmy się dobrze zrozumieli: nie interesuje mnie, czy będziesz przestrzegał zasad, czy nie. Ważne, żeby ci kolesie wylądowali na glebie!
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Nie muszę nawet trzymać się zasad obowiązujących w czasie pojedynku...");
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_SylviosMen_Condition;
	information	= DIA_Jarvis_SylviosMen_Info;
	permanent	= FALSE;
	description = "Którzy z najemników to ludzie Sylvia?";
};                       

FUNC INT DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_SylviosMen_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_SylviosMen_15_00"); //Którzy z najemników to ludzie Sylvia?
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_01"); //Jest sześciu chłopa. Po pierwsze Sylvio i jego prawa ręka Bullko.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_02"); //Potem Rod, Sentenza, Fester i Raoul.
	AI_Output (self, other, "DIA_Jarvis_SylviosMen_04_03"); //Reszta jest neutralna albo stoi po stronie Lee.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Ludzie Sylvia - Bullko, Rod, Sentenza, Fester i Raoul - są tacy sami jak on.");
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowMany_Condition;
	information	= DIA_Jarvis_HowMany_Info;
	permanent	= FALSE;
	description = "Ilu ludzi Sylvia muszę pokonać?";
};                       

FUNC INT DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowMany_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowMany_15_00"); //Ilu ludzi Sylvia powinienem pokonać?
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_01"); //Jeżeli powalisz trzech z nich, pokażesz po czyjej jesteś stronie.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_02"); //Kogo wybierzesz, to już twoja sprawa.
	AI_Output (self, other, "DIA_Jarvis_HowMany_04_03"); //Mała rada: nie chodzi o sprawdzian twojej odwagi. Nie zadzieraj z Sylviem - zrobi z ciebie siekane kotlety.
	
	B_LogEntry (TOPIC_JarvisSLDKo,"Wystarczy, jeśli pokonam trzech spośród ludzi Sylvia. Od tego ostatniego lepiej trzymać się z daleka.");
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_HowManyLeft_Condition;
	information	= DIA_Jarvis_HowManyLeft_Info;
	permanent	= TRUE;
	description = "Ilu ludzi Sylvia jest jeszcze na mojej liście?";
};                       

FUNC INT DIA_Jarvis_HowManyLeft_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Jarvis_HowMany))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_HowManyLeft_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_00"); //Ilu ludzi Sylvia jest jeszcze na mojej liście?
	
	var int victories;
	victories = 0;
	
	if (Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_01"); //Pokonałem Bullka.
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_02"); //Słyszałem. Nieźle.
		victories = victories + 1; 

	};
	if (Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE)
	{
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_03"); //Rod wygląda, jakby przytrafił mu się mały wypadek.
		victories = victories + 1;
	};
	if (Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (Npc_KnowsInfo (other, DIA_Sentenza_Hello))
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_04"); //Sentenza próbował wydusić ze mnie trochę złota - to był niezbyt mądry pomysł.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_05"); //Powaliłem Sentenzę.
		};

		victories = victories + 1;
	};

	if (Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_06"); //Fester chciał mnie zrobić w konia - i to był jego błąd.
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_07"); //Fester dostał to, co mu się należało.
		};
		victories = victories + 1;
	};
	
	if (Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE)
	{
		if (victories == 0)
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_08"); //A jeśli chodzi o Raoula...
		}
		else
		{
			AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_09"); //Poszedłem zobaczyć się z Raoulem...
		};
	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_10"); //I?
		AI_Output (other, self, "DIA_Jarvis_HowManyLeft_15_11"); //Koniecznie potrzebował porządnego obicia pyska.
		victories = victories + 1;
	};
	
	
	// ------------------------
	if (victories < 3)
	{	
		if (victories == 0)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_12"); //Jak dotąd nie pokonałeś żadnego z ludzi Sylvia.
		}
		else // 1-2
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_13"); //Dobrze - tylko tak dalej.
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_14"); //Spodziewam się, że sponiewierasz przynajmniej trzech z nich.
	}
	else // 3 oder mehr
	{	
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_15"); //Wystarczy, wystarczy.
		if (victories == 6)
		{
			AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_16"); //Naprawdę nakopałeś każdemu z nich, hę?
		};
		AI_Output (self, other, "DIA_Jarvis_HowManyLeft_04_17"); //Jestem pod wrażeniem - jeśli Lee mnie spyta, to bez wahania na ciebie zagłosuję.
		
		MIS_Jarvis_SldKO = LOG_SUCCESS;
		
		self.aivar[AIV_IGNORE_Murder] = FALSE;
		
		B_GivePlayerXP ((XP_Ambient)*victories);
		B_LogEntry (TOPIC_SLDRespekt,"Jarvis udzieli mi swojego poparcia, jeśli zechcę wstąpić w szeregi najemników.");
	};
};


// ###############################
// ##							##
// 			Höhere Gilden
// ##							##
// ###############################


// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;

instance DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 8;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= FALSE;
	description = "Jakieś wieści?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self, "DIA_Jarvis_PERM_15_00"); //Jakieś wieści?
	
	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if (other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG)
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_01"); //Teraz jesteś jednym z nas. To dobrze.
			}
			else
			{
				AI_Output (self, other, "DIA_Jarvis_PERM_04_02"); //Dokonałeś złego wyboru - mogłeś być jednym z nas.
			};
		
			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_03"); //Chłopaki Sylvia dostali ostatnio niezłą nauczkę.
		};
	};
	
	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_04"); //Silvio w końcu się zmył. Gdy dowiedział się o smokach, to razem z częścią swoich chłopaków wyruszył do Kolonii.
			AI_Output (self, other, "DIA_Jarvis_PERM_04_05"); //Pewnie myśli, że tam można się obłowić.
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output (self, other, "DIA_Jarvis_PERM_04_06"); //Nic, jak na razie spokój. Nie mogę się doczekać, żeby zobaczyć, co z tego wyniknie.
		};
	};
};




// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jarvis_PICKPOCKET (C_INFO)
{
	npc			= Sld_808_Jarvis;
	nr			= 900;
	condition	= DIA_Jarvis_PICKPOCKET_Condition;
	information	= DIA_Jarvis_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen (41, 55);
};
 
FUNC VOID DIA_Jarvis_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_BACK 		,DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};
	
func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jarvis_PICKPOCKET);
};





		





